# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0
"""
Scoring aggregation and terminal reporting for eval results.
"""

import json
from datetime import datetime, timezone
from pathlib import Path

RESULTS_DIR = Path(__file__).parent / "results"


def print_report(all_results: list[dict]) -> None:
    """Print a formatted summary table to the terminal."""
    print("\n")
    print("=" * 72)
    print("  EVALUATION RESULTS")
    print("=" * 72)

    # Header
    print(f"\n  {'Skill':<35} {'Baseline':>10} {'W/ Skill':>10} {'Delta':>8}")
    print(f"  {'-'*35} {'-'*10} {'-'*10} {'-'*8}")

    total_baseline = 0
    total_skill = 0
    count = 0

    for result in all_results:
        agg = result["aggregate"]
        baseline = agg["baseline_avg"]
        skill = agg["skill_avg"]
        delta = agg["delta"]

        total_baseline += baseline
        total_skill += skill
        count += 1

        delta_str = f"+{delta:.0%}" if delta >= 0 else f"{delta:.0%}"
        print(f"  {result['skill_name']:<35} {baseline:>9.0%} {skill:>9.0%} {delta_str:>8}")

    if count > 1:
        avg_baseline = total_baseline / count
        avg_skill = total_skill / count
        avg_delta = avg_skill - avg_baseline
        delta_str = f"+{avg_delta:.0%}" if avg_delta >= 0 else f"{avg_delta:.0%}"

        print(f"  {'-'*35} {'-'*10} {'-'*10} {'-'*8}")
        print(f"  {'AVERAGE':<35} {avg_baseline:>9.0%} {avg_skill:>9.0%} {delta_str:>8}")

    print(f"\n{'='*72}")

    # Per-case breakdown
    for result in all_results:
        print(f"\n  {result['skill_name']}")
        for case in result["cases"]:
            b_score = case["baseline"]["score"]
            s_score = case["with_skill"]["score"]
            print(f"    Case {case['id']}: {b_score:.0%} → {s_score:.0%}  |  {case['prompt'][:50]}...")

    print()


def print_triggering_report(results: list[dict]) -> None:
    """Print a formatted triggering accuracy report."""
    print("\n")
    print("=" * 72)
    print("  TRIGGERING EVAL RESULTS")
    print("=" * 72)

    print(f"\n  {'Skill':<35} {'Accuracy':>9} {'TP':>4} {'TN':>4} {'FP':>4} {'FN':>4}")
    print(f"  {'-'*35} {'-'*9} {'-'*4} {'-'*4} {'-'*4} {'-'*4}")

    total_correct = 0
    total_prompts = 0

    for r in results:
        print(
            f"  {r['skill_name']:<35} {r['accuracy']:>8.0%} "
            f"{r['tp']:>4} {r['tn']:>4} {r['fp']:>4} {r['fn']:>4}"
        )
        total_correct += r["tp"] + r["tn"]
        total_prompts += r["total"]

    if len(results) > 1:
        overall = total_correct / total_prompts if total_prompts > 0 else 0
        print(f"  {'-'*35} {'-'*9} {'-'*4} {'-'*4} {'-'*4} {'-'*4}")
        print(f"  {'OVERALL':<35} {overall:>8.0%}")

    print(f"\n{'='*72}\n")


def save_results(all_results: list[dict]) -> Path:
    """Save results as timestamped JSON for historical tracking."""
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)

    timestamp = datetime.now(timezone.utc).strftime("%Y%m%d_%H%M%S")
    output_path = RESULTS_DIR / f"eval_{timestamp}.json"

    payload = {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "results": all_results,
        "summary": {
            skill["skill_name"]: {
                "baseline": skill["aggregate"]["baseline_avg"],
                "with_skill": skill["aggregate"]["skill_avg"],
                "delta": skill["aggregate"]["delta"],
            }
            for skill in all_results
        },
    }

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2)

    print(f"  Results saved to: {output_path}")
    return output_path
