-- Add missing parameters for 'returningUserInstruction', 'onboarding', and 'onboardingIntroInstructions' templates

DO $$
DECLARE
    v_returning_user_template_id uuid;
    v_onboarding_template_id uuid;
    v_onboarding_intro_template_id uuid;
BEGIN
    -- Get the id of the 'returningUserInstruction' template
    SELECT id INTO v_returning_user_template_id FROM prompt_templates WHERE key = 'returningUserInstruction';

    IF v_returning_user_template_id IS NOT NULL THEN
        -- Insert parameters for 'returningUserInstruction'
        INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
        VALUES
            (v_returning_user_template_id, 'name', 'The name of the user.', true, 1),
            (v_returning_user_template_id, 'motivation', 'The user''s stated motivation.', true, 2),
            (v_returning_user_template_id, 'recentChapterRecapText', 'The text summarizing the user''s recent interactions from the current module.', true, 3),
            (v_returning_user_template_id, 'currentPromptTextForUser', 'The exact text of the current reflection prompt for the user.', true, 4)
        ON CONFLICT (template_id, name) DO NOTHING;
    ELSE
        RAISE WARNING 'Template with key ''returningUserInstruction'' not found. Parameters not added.';
    END IF;

    -- Get the id of the 'onboarding' template
    SELECT id INTO v_onboarding_template_id FROM prompt_templates WHERE key = 'onboarding';

    IF v_onboarding_template_id IS NOT NULL THEN
        -- Insert parameters for 'onboarding'
        INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
        VALUES
            (v_onboarding_template_id, 'currentPromptTextForUser', 'The initial prompt text for the user during onboarding.', true, 1),
            (v_onboarding_template_id, 'name', 'The name of the user, collected during onboarding.', true, 2)
        ON CONFLICT (template_id, name) DO NOTHING;
    ELSE
        RAISE WARNING 'Template with key ''onboarding'' not found. Parameters not added.';
    END IF;

    -- Get the id of the 'onboardingIntroInstructions' template
    SELECT id INTO v_onboarding_intro_template_id FROM prompt_templates WHERE key = 'onboardingIntroInstructions';

    IF v_onboarding_intro_template_id IS NOT NULL THEN
        -- Insert parameters for 'onboardingIntroInstructions'
        INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
        VALUES
            (v_onboarding_intro_template_id, 'currentPromptTextForUser', 'The initial prompt text for the user during onboarding intro.', true, 1),
            (v_onboarding_intro_template_id, 'name', 'The name of the user, collected during onboarding intro.', true, 2)
        ON CONFLICT (template_id, name) DO NOTHING;
    ELSE
        RAISE WARNING 'Template with key ''onboardingIntroInstructions'' not found. Parameters not added.';
    END IF;

END $$;

COMMENT ON TABLE prompt_template_parameters IS 'Added/updated parameters for multiple prompt templates on 2025-06-02.';