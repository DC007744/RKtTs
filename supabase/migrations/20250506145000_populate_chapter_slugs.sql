-- Script to populate the slug column for existing workbook_chapters entries
-- This should be run after applying the migrations that add the slug column

-- Function to convert a string to a slug format
-- Converts to lowercase, replaces spaces with hyphens, and removes special characters
CREATE OR REPLACE FUNCTION slugify(input_text TEXT) RETURNS TEXT AS $$
BEGIN
  -- Convert to lowercase
  input_text := LOWER(input_text);
  
  -- Replace spaces with hyphens
  input_text := REPLACE(input_text, ' ', '-');
  
  -- Remove special characters (keep only alphanumeric and hyphens)
  input_text := REGEXP_REPLACE(input_text, '[^a-z0-9\-]', '', 'g');
  
  -- Replace multiple consecutive hyphens with a single hyphen
  input_text := REGEXP_REPLACE(input_text, '\-+', '-', 'g');
  
  -- Remove leading and trailing hyphens
  input_text := TRIM(BOTH '-' FROM input_text);
  
  RETURN input_text;
END;
$$ LANGUAGE plpgsql;

-- Update existing workbook_chapters entries with slugs based on their titles
UPDATE workbook_chapters
SET slug = CASE
  -- Special case for onboarding chapter (number = 0)
  WHEN number = 0 THEN 'onboarding'
  
  -- For other chapters, use the slugified title
  ELSE slugify(title)
END
WHERE slug IS NULL OR slug = '';

-- Verify the results
SELECT id, number, title, slug
FROM workbook_chapters
ORDER BY number;

-- Drop the temporary function
DROP FUNCTION IF EXISTS slugify(TEXT);

-- Update the moduleOrder.ts mapping
-- This is just for reference - you'll need to manually update the moduleOrder.ts file
-- to match these slugs if they differ from the current values
SELECT 'export const moduleOrder: string[] = [';
SELECT CONCAT('  ''', slug, ''', // Chapter ', number, ': ', title)
FROM workbook_chapters
ORDER BY number;
SELECT '];';