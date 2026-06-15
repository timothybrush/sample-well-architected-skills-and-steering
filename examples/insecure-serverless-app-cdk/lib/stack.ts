import * as cdk from 'aws-cdk-lib';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as apigateway from 'aws-cdk-lib/aws-apigateway';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';
import * as s3 from 'aws-cdk-lib/aws-s3';
import * as sqs from 'aws-cdk-lib/aws-sqs';
import * as rds from 'aws-cdk-lib/aws-rds';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as iam from 'aws-cdk-lib/aws-iam';
import { Construct } from 'constructs';

export class InsecureServerlessAppStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // --- Networking ---

    const vpc = new ec2.Vpc(this, 'AppVpc', {
      maxAzs: 2,
      natGateways: 0, // We'll use a NAT instance instead
    });

    // WA-ISSUE: [Sustainability] Always-on EC2 NAT instance instead of managed NAT Gateway.
    // NAT Gateway scales automatically and is more energy-efficient than an always-on EC2 instance.
    const natInstance = new ec2.Instance(this, 'NatInstance', {
      vpc,
      vpcSubnets: { subnetType: ec2.SubnetType.PUBLIC },
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.MEDIUM),
      machineImage: ec2.MachineImage.latestAmazonLinux2(),
      sourceDestCheck: false,
    });

    // --- Storage ---

    // WA-ISSUE: [Security] S3 bucket without server-side encryption enabled.
    // All S3 buckets should have encryption at rest configured (SSE-S3 or SSE-KMS).
    // WA-ISSUE: [Cost] No S3 lifecycle policies defined.
    // Without lifecycle rules, objects accumulate indefinitely, increasing storage costs.
    // WA-ISSUE: [Sustainability] No data tiering or intelligent tiering configured.
    // Data should be moved to appropriate storage classes as access patterns change.
    const dataBucket = new s3.Bucket(this, 'DataBucket', {
      bucketName: `insecure-app-data-${cdk.Aws.ACCOUNT_ID}`,
      encryption: s3.BucketEncryption.UNENCRYPTED, // WA-ISSUE: [Security] No encryption
      versioned: false,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
      // No lifecycleRules configured
    });

    // --- Database ---

    const table = new dynamodb.Table(this, 'ItemsTable', {
      tableName: 'InsecureAppItems',
      partitionKey: { name: 'pk', type: dynamodb.AttributeType.STRING },
      sortKey: { name: 'sk', type: dynamodb.AttributeType.STRING },
      billingMode: dynamodb.BillingMode.PAY_PER_REQUEST,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
    });

    // WA-ISSUE: [Reliability] Single-AZ RDS instance without Multi-AZ failover.
    // Production databases should use Multi-AZ deployments for automatic failover.
    const database = new rds.DatabaseInstance(this, 'AppDatabase', {
      engine: rds.DatabaseInstanceEngine.postgres({
        version: rds.PostgresEngineVersion.VER_14,
      }),
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.MEDIUM),
      vpc,
      vpcSubnets: { subnetType: ec2.SubnetType.PRIVATE_WITH_EGRESS },
      multiAz: false, // WA-ISSUE: [Reliability] No Multi-AZ
      deletionProtection: false,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
      credentials: rds.Credentials.fromGeneratedSecret('dbadmin'),
    });

    // --- Messaging ---

    // WA-ISSUE: [Reliability] SQS queue without a Dead Letter Queue (DLQ).
    // Failed messages will be retried indefinitely or lost. A DLQ captures poison messages
    // for investigation and prevents infinite retry loops.
    const processingQueue = new sqs.Queue(this, 'ProcessingQueue', {
      queueName: 'insecure-app-processing',
      visibilityTimeout: cdk.Duration.seconds(30),
      // No deadLetterQueue configured
    });

    // --- Lambda Function ---

    // WA-ISSUE: [Security] Hardcoded secrets in Lambda environment variables.
    // Secrets should be stored in AWS Secrets Manager or SSM Parameter Store.
    // WA-ISSUE: [Cost] Over-provisioned Lambda memory at 3008MB for simple CRUD operations.
    // Right-size Lambda memory using tools like AWS Lambda Power Tuning.
    // WA-ISSUE: [Cost] Using x86_64 architecture instead of ARM64 (Graviton2).
    // ARM64 offers better price-performance for most workloads.
    // WA-ISSUE: [Ops] No structured logging configured.
    // Use structured JSON logging for better observability and log analysis.
    const handler = new lambda.Function(this, 'ApiHandler', {
      runtime: lambda.Runtime.NODEJS_18_X,
      handler: 'index.handler',
      code: lambda.Code.fromAsset('lambda'),
      memorySize: 3008, // WA-ISSUE: [Cost] Over-provisioned for simple CRUD
      timeout: cdk.Duration.seconds(30),
      architecture: lambda.Architecture.X86_64, // WA-ISSUE: [Cost] Not using Graviton/ARM
      vpc,
      vpcSubnets: { subnetType: ec2.SubnetType.PRIVATE_WITH_EGRESS },
      environment: {
        TABLE_NAME: table.tableName,
        BUCKET_NAME: dataBucket.bucketName,
        QUEUE_URL: processingQueue.queueUrl,
        // WA-ISSUE: [Security] Secrets in environment variables
        DB_PASSWORD: 'SuperSecret123!',
        API_KEY: 'sk-proj-abc123def456ghi789',
        SMTP_PASSWORD: 'smtp-pass-do-not-share',
        NOTIFICATION_EMAIL: 'alerts@example.com',
      },
      // WA-ISSUE: [Reliability] No reserved concurrency or provisioned concurrency configured.
      // Without concurrency controls, a traffic spike can exhaust the account-level concurrency limit.
      // No reservedConcurrentExecutions set
    });

    // WA-ISSUE: [Security] Overly permissive IAM policy with wildcard resource.
    // IAM policies should follow least-privilege principle with specific resource ARNs.
    handler.addToRolePolicy(new iam.PolicyStatement({
      effect: iam.Effect.ALLOW,
      actions: [
        's3:*',
        'dynamodb:*',
        'sqs:*',
        'rds:*',
        'logs:*',
        'secretsmanager:*',
      ],
      resources: ['*'], // WA-ISSUE: [Security] Wildcard resource
    }));

    // Grant specific permissions (these are redundant given the wildcard above,
    // but show what proper scoping would look like)
    table.grantReadWriteData(handler);
    dataBucket.grantReadWrite(handler);
    processingQueue.grantSendMessages(handler);

    // --- API Gateway ---

    // WA-ISSUE: [Security] No WAF (Web Application Firewall) attached to API Gateway.
    // WAF protects against common web exploits like SQL injection and XSS.
    // WA-ISSUE: [Security] TLS 1.0 allowed on custom domain (insecure protocol version).
    // Minimum TLS version should be 1.2 to prevent known protocol vulnerabilities.
    // WA-ISSUE: [Performance] No caching layer configured on API Gateway.
    // API Gateway caching reduces backend calls and improves response latency.
    // WA-ISSUE: [Performance] No CloudFront CDN in front of API Gateway.
    // CloudFront reduces latency for geographically distributed users.
    // WA-ISSUE: [Ops] No deployment configuration (canary/linear).
    // All-at-once deployments risk full outage if new code has defects.
    const api = new apigateway.RestApi(this, 'AppApi', {
      restApiName: 'InsecureServerlessApi',
      description: 'API with intentional WA issues for demo purposes',
      deployOptions: {
        stageName: 'prod',
        // No caching enabled
        cachingEnabled: false, // WA-ISSUE: [Performance] No API caching
        // No canary deployment settings
        // No access logging
        // No method-level throttling
      },
      // No WAF association
    });

    // WA-ISSUE: [Security] Custom domain with TLS 1.0 (deprecated, insecure)
    const domainName = new apigateway.DomainName(this, 'CustomDomain', {
      domainName: 'api.insecure-app.example.com',
      certificate: cdk.aws_certificatemanager.Certificate.fromCertificateArn(
        this, 'Cert', 'arn:aws:acm:us-east-1:123456789012:certificate/fake-cert-id'
      ),
      securityPolicy: apigateway.SecurityPolicy.TLS_1_0, // WA-ISSUE: [Security] TLS 1.0
    });

    // WA-ISSUE: [Performance] Synchronous processing for potentially large payloads.
    // Large payload processing should be offloaded to async workflows (Step Functions, SQS).
    const itemsResource = api.root.addResource('items');
    itemsResource.addMethod('GET', new apigateway.LambdaIntegration(handler));
    itemsResource.addMethod('POST', new apigateway.LambdaIntegration(handler)); // WA-ISSUE: [Performance] Sync processing
    itemsResource.addMethod('PUT', new apigateway.LambdaIntegration(handler));
    itemsResource.addMethod('DELETE', new apigateway.LambdaIntegration(handler));

    const bulkResource = itemsResource.addResource('bulk');
    bulkResource.addMethod('POST', new apigateway.LambdaIntegration(handler)); // WA-ISSUE: [Performance] Sync bulk processing

    // WA-ISSUE: [Reliability] No health check endpoint or Route 53 health checks configured.
    // Health checks enable automated failover and monitoring of service availability.
    const healthResource = api.root.addResource('health');
    // Health endpoint exists but no Route 53 health check or CloudWatch synthetic canary monitors it

    // --- Missing Observability ---

    // WA-ISSUE: [Ops] No CloudWatch alarms defined for any resource.
    // Alarms should monitor Lambda errors, API 5xx rates, DynamoDB throttles,
    // SQS queue depth, and RDS CPU/connections.
    // No alarms, no dashboards, no anomaly detection configured.

    // --- Outputs ---

    new cdk.CfnOutput(this, 'ApiUrl', {
      value: api.url,
      description: 'API Gateway URL',
    });

    new cdk.CfnOutput(this, 'BucketName', {
      value: dataBucket.bucketName,
      description: 'S3 Data Bucket Name',
    });

    new cdk.CfnOutput(this, 'TableName', {
      value: table.tableName,
      description: 'DynamoDB Table Name',
    });
  }
}
