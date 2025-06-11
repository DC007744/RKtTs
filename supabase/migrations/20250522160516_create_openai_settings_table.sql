-- 1. Create the table
CREATE TABLE public.openai_settings (
  id          UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
  temperature FLOAT8        NOT NULL DEFAULT 0.2,
  updated_at  TIMESTAMPTZ   NOT NULL DEFAULT now()
);

-- 2. Insert the single "settings" row
INSERT INTO public.openai_settings (temperature) VALUES (0.2);

-- 3. Add RLS policies
ALTER TABLE public.openai_settings ENABLE ROW LEVEL SECURITY;

-- 4. Create policies for authenticated users
CREATE POLICY "Allow full access to authenticated users for openai_settings"
ON public.openai_settings
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- 5. Create policies for anonymous users (read-only)
CREATE POLICY "Allow read access to anonymous users for openai_settings"
ON public.openai_settings
FOR SELECT
TO anon
USING (true);