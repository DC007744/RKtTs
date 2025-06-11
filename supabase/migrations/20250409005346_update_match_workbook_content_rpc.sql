-- Add the stage column to workbook_content
ALTER TABLE public.workbook_content
ADD COLUMN stage TEXT;

-- Add an index for faster stage lookups (optional but recommended)
CREATE INDEX IF NOT EXISTS workbook_content_stage_idx ON public.workbook_content (stage);

-- Update the function to accept filter_by_stage and apply conditional filtering
CREATE OR REPLACE FUNCTION public.match_workbook_content (
  query_embedding extensions.vector(1536),
  match_threshold float,
  match_count int,
  filter_by_stage TEXT DEFAULT NULL -- Added optional parameter
)
RETURNS TABLE (
  id UUID,
  section TEXT,
  content TEXT,
  stage TEXT, -- Added stage to the return table
  embedding extensions.vector(1536),
  created_at TIMESTAMP WITH TIME ZONE,
  similarity float
)
LANGUAGE sql STABLE
AS $$
  SELECT
    wc.id,
    wc.section,
    wc.content,
    wc.stage, -- Return the stage column
    wc.embedding,
    wc.created_at,
    1 - (wc.embedding <=> query_embedding) AS similarity
  FROM
    public.workbook_content wc
  WHERE
    1 - (wc.embedding <=> query_embedding) > match_threshold
    AND (filter_by_stage IS NULL OR filter_by_stage = '' OR wc.stage = filter_by_stage) -- Conditional filtering: only apply if filter_by_stage is provided and not empty
  ORDER BY
    wc.embedding <=> query_embedding -- Order by cosine distance (ascending, closest first)
  LIMIT match_count; -- Limit the number of results
$$;