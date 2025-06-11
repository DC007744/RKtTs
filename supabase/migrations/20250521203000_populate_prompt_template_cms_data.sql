-- Migration: Populate prompt_templates and prompt_template_parameters from lib/context/promptTemplates.ts

-- 1. baseSystemInstruction (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- 2. onboarding (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- 3. onboardingIntroInstructions (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- 4. onboardingStage1Instructions (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- 5. onboardingStage2Instructions (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- 6. onboardingStage3Instructions (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- 7. moduleIntro (function)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- Removed duplicate INSERT INTO prompt_template_parameters statements to avoid unique constraint errors.
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'moduleTitle', 'The title of the module', true, 1 FROM prompt_templates WHERE key = 'moduleIntro';
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'moduleDescription', 'The description of the module', true, 2 FROM prompt_templates WHERE key = 'moduleIntro';

-- 8. MODULE_INTRO_INSTRUCTIONS_TEMPLATE (function)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- Removed duplicate INSERT INTO prompt_template_parameters statements to avoid unique constraint errors.
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'moduleTitle', 'The title of the module', true, 1 FROM prompt_templates WHERE key = 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE';
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'moduleIntroText', 'The introduction text for the module', true, 2 FROM prompt_templates WHERE key = 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE';

-- 9. modulePrompt (function)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- Removed duplicate INSERT INTO prompt_template_parameters statements to avoid unique constraint errors.
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'prompt', 'The prompt to present to the user', true, 1 FROM prompt_templates WHERE key = 'modulePrompt';
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'context', 'Optional context for the prompt', false, 2 FROM prompt_templates WHERE key = 'modulePrompt';

-- 10. moduleCompletion (function)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- Removed duplicate INSERT INTO prompt_template_parameters statements to avoid unique constraint errors.
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'moduleTitle', 'The title of the module', true, 1 FROM prompt_templates WHERE key = 'moduleCompletion';

-- 11. safetyConcerns (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- 12. contextualResponse (function)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.

-- Removed duplicate INSERT INTO prompt_template_parameters statements to avoid unique constraint errors.
-- INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
-- SELECT id, 'context', 'Optional context for the response', false, 1 FROM prompt_templates WHERE key = 'contextualResponse';

-- 13. disconnectRecap (string)
-- Removed duplicate INSERT INTO prompt_templates statements to avoid unique constraint errors.