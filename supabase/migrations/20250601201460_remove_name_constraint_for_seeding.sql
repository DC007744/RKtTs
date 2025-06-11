-- This migration removes the unique constraint on the name column in the instruction_construction_rules table
-- to allow the seed.sql file to insert its records without conflicts

DO $$
BEGIN
    -- Check if the constraint exists
    IF EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'instruction_construction_rules_name_key' 
        AND conrelid = 'public.instruction_construction_rules'::regclass
    ) THEN
        -- Remove the unique constraint
        ALTER TABLE public.instruction_construction_rules 
        DROP CONSTRAINT instruction_construction_rules_name_key;
    END IF;
END
$$;

-- Also modify the ON CONFLICT clause in the integrate_keystone_cms_schema.sql migration
-- by using a DO block to handle the insert without relying on the unique constraint
DO $$
BEGIN
    -- Check if the table exists
    IF EXISTS (
        SELECT FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'instruction_construction_rules'
    ) THEN
        -- Check if a record with the name 'Onboarding Flow' already exists
        IF EXISTS (
            SELECT 1 FROM public.instruction_construction_rules 
            WHERE name = 'Onboarding Flow'
        ) THEN
            -- If it exists, update it
            UPDATE public.instruction_construction_rules
            SET description = 'Rules for constructing the onboarding flow instructions',
                template_id = (SELECT id FROM public.prompt_templates WHERE key = 'onboarding' LIMIT 1),
                components = '[
                    {"type": "template", "key": "baseSystemInstruction"},
                    {"type": "template", "key": "onboardingIntroInstructions"}
                 ]'::jsonb,
                updated_at = now()
            WHERE name = 'Onboarding Flow';
        ELSE
            -- If it doesn't exist, insert it
            INSERT INTO public.instruction_construction_rules (name, description, template_id, components, created_at, updated_at)
            SELECT 
                'Onboarding Flow', 
                'Rules for constructing the onboarding flow instructions', 
                id, 
                '[
                    {"type": "template", "key": "baseSystemInstruction"},
                    {"type": "template", "key": "onboardingIntroInstructions"}
                 ]'::jsonb,
                now(),
                now()
            FROM public.prompt_templates WHERE key = 'onboarding' LIMIT 1;
        END IF;
    END IF;
END
$$;