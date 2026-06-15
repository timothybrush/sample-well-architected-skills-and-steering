# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0
"""Tests for triggering eval format and completeness."""

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

from run import list_skills_with_triggering, load_triggering, SKILLS_DIR


def test_all_skills_have_triggering():
    """Every skill with evals.json should also have triggering.json."""
    skills_with_evals = sorted(
        d.name for d in SKILLS_DIR.iterdir()
        if d.is_dir() and (d / "evals" / "evals.json").exists()
    )
    skills_with_triggering = list_skills_with_triggering()
    assert skills_with_triggering == skills_with_evals, (
        f"Missing triggering.json for: {set(skills_with_evals) - set(skills_with_triggering)}"
    )


def test_triggering_format():
    """Each triggering.json must have valid structure."""
    for skill_name in list_skills_with_triggering():
        data = load_triggering(skill_name)
        assert data is not None
        assert "skill_name" in data
        assert data["skill_name"] == skill_name
        assert "prompts" in data
        assert isinstance(data["prompts"], list)

        for prompt in data["prompts"]:
            assert "text" in prompt, f"{skill_name}: prompt missing 'text'"
            assert "should_trigger" in prompt, f"{skill_name}: prompt missing 'should_trigger'"
            assert isinstance(prompt["text"], str)
            assert isinstance(prompt["should_trigger"], bool)
            assert len(prompt["text"]) > 5, f"{skill_name}: prompt too short: {prompt['text']}"


def test_triggering_minimum_counts():
    """Each skill must have at least 8 positive and 8 negative prompts."""
    for skill_name in list_skills_with_triggering():
        data = load_triggering(skill_name)
        prompts = data["prompts"]

        positives = [p for p in prompts if p["should_trigger"]]
        negatives = [p for p in prompts if not p["should_trigger"]]

        assert len(positives) >= 8, (
            f"{skill_name}: only {len(positives)} positive prompts (need ≥8)"
        )
        assert len(negatives) >= 8, (
            f"{skill_name}: only {len(negatives)} negative prompts (need ≥8)"
        )


def test_triggering_no_duplicate_prompts():
    """No duplicate prompt texts within a single skill's triggering.json."""
    for skill_name in list_skills_with_triggering():
        data = load_triggering(skill_name)
        texts = [p["text"] for p in data["prompts"]]
        assert len(texts) == len(set(texts)), (
            f"{skill_name}: has duplicate prompts"
        )
