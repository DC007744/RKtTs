-- This migration modifies the instruction_construction_rules table to add a unique constraint on the name column
-- This is needed for the ON CONFLICT (name) clause in the integrate_keystone_cms_schema.sql migration

-- First, let's modify the table definition to include a unique constraint on the name column
CREATE TABLE IF NOT EXISTS public.instruction_construction_rules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE, -- Added UNIQUE constraint here
    description TEXT,
    template_id UUID REFERENCES public.prompt_templates(id) ON DELETE SET NULL,
    components JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- If the table already exists, add the unique constraint
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