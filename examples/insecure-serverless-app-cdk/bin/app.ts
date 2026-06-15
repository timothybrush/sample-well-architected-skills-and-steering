#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import { InsecureServerlessAppStack } from '../lib/stack';

const app = new cdk.App();

new InsecureServerlessAppStack(app, 'InsecureServerlessAppStack', {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION,
  },
  description: 'Deliberately flawed serverless app for WA review testing',
});

app.synth();
