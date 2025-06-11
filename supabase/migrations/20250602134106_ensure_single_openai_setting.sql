-- Delete all existing rows from openai_settings to ensure a clean slate
DELETE FROM public.openai_settings;

-- Insert a single, default row for OpenAI settings
INSERT INTO public.openai_settings (id, temperature, default_voice, updated_at)
VALUES ('00000000-0000-0000-0000-000000000001', 0.2, 'ash', NOW());