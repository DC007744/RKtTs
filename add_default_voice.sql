-- Add default_voice column to openai_settings table
ALTER TABLE public.openai_settings 
ADD COLUMN IF NOT EXISTS default_voice TEXT NOT NULL DEFAULT 'ash';

-- Add comment to the column
COMMENT ON COLUMN public.openai_settings.default_voice IS 'Default voice for the Serge agent (alloy, ash, ballad, coral, echo, sage, shimmer, verse)';

-- Update existing records to use 'ash' as default
UPDATE public.openai_settings
SET default_voice = 'ash'
WHERE default_voice IS NULL;