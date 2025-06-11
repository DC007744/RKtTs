-- Add slug column to workbook_chapters table if it doesn't exist
ALTER TABLE workbook_chapters
ADD COLUMN IF NOT EXISTS slug TEXT;

-- Add unique constraint to slug column
ALTER TABLE workbook_chapters
ADD CONSTRAINT workbook_chapters_slug_unique UNIQUE (slug);

-- Add comment to explain the purpose of the column
COMMENT ON COLUMN workbook_chapters.slug IS 'Unique slug identifier for chapter navigation';

-- Create an index on slug for faster lookups
CREATE INDEX IF NOT EXISTS idx_workbook_chapters_slug ON workbook_chapters(slug);