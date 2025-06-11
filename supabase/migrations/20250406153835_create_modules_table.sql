-- Migration script to create the 'modules' table

CREATE TABLE public.modules (
    id TEXT PRIMARY KEY NOT NULL,             -- Unique identifier (e.g., 'early_life')
    title TEXT NOT NULL,                      -- Display title (e.g., 'Early Life Exploration')
    description TEXT NOT NULL,                -- Short description for the dashboard card
    display_order INTEGER NOT NULL UNIQUE,    -- Number for sorting modules chronologically
    stage TEXT NOT NULL                       -- Life stage (e.g., 'The Basics', 'The Game')
);

-- Optional: Add comments on the table and columns for clarity
COMMENT ON TABLE public.modules IS 'Stores definitions for the therapeutic modules displayed on the dashboard.';
COMMENT ON COLUMN public.modules.id IS 'Unique identifier (e.g., ''early_life''). Should align with moduleId in user_sessions.modules.';
COMMENT ON COLUMN public.modules.title IS 'Display title for the module.';
COMMENT ON COLUMN public.modules.description IS 'Short description shown on the dashboard card.';
COMMENT ON COLUMN public.modules.display_order IS 'Number for sorting modules chronologically on the dashboard.';
COMMENT ON COLUMN public.modules.stage IS 'The life stage this module belongs to (e.g., ''The Basics'', ''The Game'').';

-- Optional: Add row-level security (RLS) if needed, though likely public read is fine for module definitions
-- ALTER TABLE public.modules ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Allow public read access" ON public.modules FOR SELECT USING (true);

-- Grant usage on the schema to the anon role (if not already granted)
-- GRANT USAGE ON SCHEMA public TO anon;

-- Grant select permission to the anon role (assuming module definitions are public)
GRANT SELECT ON TABLE public.modules TO anon;

-- Grant permissions to authenticated role as well (usually inherits anon, but explicit is fine)
GRANT SELECT ON TABLE public.modules TO authenticated;

-- Grant permissions to service_role (needed for server-side access like API routes)
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.modules TO service_role;