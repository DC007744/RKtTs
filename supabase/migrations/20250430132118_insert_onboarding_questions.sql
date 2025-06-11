-- Insert onboarding reflection questions for Chapter 0 (Onboarding)
-- Use the id of the existing onboarding chapter (number = 0)
INSERT INTO reflection_questions (chapter_id, text, "order", is_active)
SELECT id, q.text, q.order, TRUE
FROM workbook_chapters, (VALUES
  ('Hello, I am Serge, your AI voice therapist. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?', 1),
  ('How old are you?', 2),
  ('What is your primary motivation or goal for using this application?', 3)
) AS q(text, "order")
WHERE number = 0
ON CONFLICT ON CONSTRAINT reflection_questions_chapter_id_order_key
DO UPDATE SET text = EXCLUDED.text, is_active = EXCLUDED.is_active;