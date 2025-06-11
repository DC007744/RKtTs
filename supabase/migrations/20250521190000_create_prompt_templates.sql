-- Create prompt_templates table
CREATE TABLE IF NOT EXISTS public.prompt_templates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT,
    content TEXT NOT NULL,
    is_function BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create trigger function for updated_at if it doesn't exist
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for updated_at on prompt_templates
DROP TRIGGER IF EXISTS set_updated_at_prompt_templates ON public.prompt_templates;
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'set_updated_at_prompt_templates'
  ) THEN
    CREATE TRIGGER set_updated_at_prompt_templates
      BEFORE UPDATE ON public.prompt_templates
      FOR EACH ROW
      EXECUTE FUNCTION public.update_updated_at_column();
  END IF;
END $$;

-- Enable RLS on prompt_templates
ALTER TABLE public.prompt_templates ENABLE ROW LEVEL SECURITY;

-- Create policies for prompt_templates
DROP POLICY IF EXISTS "Allow full access to authenticated users for prompt_templates" ON public.prompt_templates;
CREATE POLICY "Allow full access to authenticated users for prompt_templates"
ON public.prompt_templates FOR ALL TO authenticated USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow read access to anonymous users for prompt_templates" ON public.prompt_templates;
CREATE POLICY "Allow read access to anonymous users for prompt_templates"
ON public.prompt_templates FOR SELECT TO anon USING (true);