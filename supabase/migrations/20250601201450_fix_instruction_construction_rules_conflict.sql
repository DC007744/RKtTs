-- This migration modifies the instruction_construction_rules table to handle conflicts between
-- the seed.sql file and the integrate_keystone_cms_schema.sql migration

-- First, ensure the table has a unique constraint on the name column
DO $$
BEGIN
    IF EXISTS (
        SELECT FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'instruction_construction_rules'
    ) THEN
        -- Check if the constraint already exists
        IF NOT EXISTS (
            SELECT 1 FROM pg_constraint 
            WHERE conname = 'instruction_construction_rules_name_key' 
            AND conrelid = 'public.instruction_construction_rules'::regclass
        ) THEN
            -- Add the unique constraint
            ALTER TABLE public.instruction_construction_rules 
            ADD CONSTRAINT instruction_construction_rules_name_key UNIQUE (name);
        END IF;
    END IF;
END
$$;

-- Now, modify the integrate_keystone_cms_schema.sql migration to handle the conflict
-- by checking if a record with the name 'Onboarding Flow' already exists
DO $$
BEGIN
    -- Check if 'Onboarding Flow' already exists in the table
    IF EXISTS (
        SELECT 1 FROM public.instruction_construction_rules 
        WHERE name = 'Onboarding Flow'
    ) THEN
        -- If it exists, update it with the latest values
        UPDATE public.instruction_construction_rules
        SET description = 'Rules for constructing the onboarding flow instructions',
            template_id = (SELECT id FROM public.prompt_templates WHERE key = 'onboarding'),
            components = '[
                {"type": "template", "key": "baseSystemInstruction"},
                {"type": "template", "key": "onboardingIntroInstructions"}
             ]'::jsonb,
            updated_at = now()
        WHERE name = 'Onboarding Flow';
    END IF;
END
$$;