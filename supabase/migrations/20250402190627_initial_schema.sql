-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;

-- Enable pgvector extension if not already enabled
CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA extensions;

-- Create workbook_content table
CREATE TABLE IF NOT EXISTS public.workbook_content (
  id UUID PRIMARY KEY DEFAULT extensions.uuid_generate_v4(),
  section TEXT NOT NULL,
  content TEXT NOT NULL,
  embedding extensions.vector(1536) NOT NULL, -- Assuming OpenAI text-embedding-ada-002 dimension
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create indexes for workbook_content table
-- Index for faster section lookups
CREATE INDEX IF NOT EXISTS workbook_content_section_idx ON public.workbook_content (section);

-- IVFFlat index for approximate nearest neighbor search on embeddings using cosine distance
CREATE INDEX IF NOT EXISTS workbook_content_embedding_idx ON public.workbook_content USING ivfflat (embedding extensions.vector_cosine_ops) WITH (lists = 100);

-- Create health_check table
CREATE TABLE IF NOT EXISTS public.health_check (
  id SERIAL PRIMARY KEY,
  status TEXT NOT NULL DEFAULT 'ok',
  checked_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Insert initial health check record if table is empty
-- Ensures the checkSupabaseConnection function can find a row
-- Initial health_check record is now handled by seed.sql


-- Create function for vector similarity search (cosine distance)
CREATE OR REPLACE FUNCTION public.match_workbook_content (
  query_embedding extensions.vector(1536),
  match_threshold float,
  match_count int
)
RETURNS TABLE (
  id UUID,
  section TEXT,
  content TEXT,
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
    wc.embedding,
    wc.created_at,
    1 - (wc.embedding <=> query_embedding) AS similarity -- Cosine similarity calculation (1 - cosine distance)
  FROM
    public.workbook_content wc
  WHERE 1 - (wc.embedding <=> query_embedding) > match_threshold -- Filter by similarity threshold
  ORDER BY
    wc.embedding <=> query_embedding -- Order by cosine distance (ascending, closest first)
  LIMIT match_count; -- Limit the number of results
$$;

-- Note: Permissions are typically handled by Supabase default roles (anon, authenticated, service_role)
-- Granting explicit permissions might be needed in specific scenarios but often isn't required for basic table/function access via the client library using anon/service keys.
-- Example grants (uncomment if needed, ensure roles exist):
-- GRANT USAGE ON SCHEMA public TO anon, authenticated, service_role;
-- GRANT ALL ON TABLE public.workbook_content TO anon, authenticated, service_role;
-- GRANT ALL ON TABLE public.health_check TO anon, authenticated, service_role;
-- GRANT ALL ON SEQUENCE public.health_check_id_seq TO anon, authenticated, service_role;
-- GRANT EXECUTE ON FUNCTION public.match_workbook_content(extensions.vector(1536), float, int) TO anon, authenticated, service_role;