-- Migration: Remove unused prompt templates (without DISABLE TRIGGER)
-- This migration removes unused templates and parameters with standard DELETEs only.

-- Step 1: Delete parameters for unused templates
DELETE FROM prompt_template_parameters
WHERE template_id IN (
  SELECT id FROM prompt_templates
  WHERE key IN (
    'moduleCompletion',
    'moduleIntro',
    'MODULE_INTRO_INSTRUCTIONS_TEMPLATE',
    'modulePrompt',
    'onboardingStage1Instructions',
    'onboardingStage2Instructions',
    'onboardingStage3Instructions',
    'returningUserInstruction',
    'safetyConcerns'
  )
);

-- Step 2: Delete the templates themselves
DELETE FROM prompt_templates
WHERE key IN (
  'moduleCompletion',
  'moduleIntro',
  'MODULE_INTRO_INSTRUCTIONS_TEMPLATE',
  'modulePrompt',
  'onboardingStage1Instructions',
  'onboardingStage2Instructions',
  'onboardingStage3Instructions',
  'returningUserInstruction',
  'safetyConcerns'
);