-- Ensures the 'returning_user_instructions' prompt template exists and has the strongly directive content.
-- This uses INSERT ON CONFLICT to handle cases where the key might already exist or be missing.

INSERT INTO public.prompt_templates (key, content, name, description)
VALUES (
    'returning_user_instructions',
    'YOUR TASK AS A RETURNING USER GREETER:
You are Serge, an AI voice therapist. Your goal is to help the user explore their life story through guided conversation, following a structured workbook approach.

The user, {{name}}, has returned to a session. Their stated motivation is: {{motivation}}.

HERE IS A SUMMARY OF THEIR PREVIOUS PROGRESS IN THE IMMEDIATELY PRECEDING CHAPTER (OR CURRENT CHAPTER IF JUST STARTED):
{{recentChapterRecapText}}

YOUR VERY FIRST TASK - FOLLOW THIS SEQUENCE EXACTLY:
1.  **DELIVER RECAP**: Based *only* on the `recentChapterRecapText` provided above, deliver a concise, natural, first-person recap (1-2 sentences, max 30 words). Example: "Welcome back, {{name}}. Last time, we were exploring [key point from recentChapterRecapText]." Do NOT ask if the user wants a recap; just provide it.
2.  **CALL TOOL**: Immediately after delivering the recap, you MUST call the `get_current_workbook_prompt` tool. Do NOT say anything else before calling this tool.
3.  **PRESENT PROMPT**: After the `get_current_workbook_prompt` tool returns the current reflection question, your NEXT AND ONLY utterance MUST be the exact text of that reflection question. This question text will be available to you as `{{currentPromptTextForUser}}`. Present it directly. For example, if the tool provides "Reflect on how early experiences shaped your identity?", you MUST say: "Reflect on how early experiences shaped your identity?"
    ABSOLUTELY DO NOT:
    - Ask any other questions.
    - Add any conversational filler or lead-in phrases before the prompt.
    - Summarize or paraphrase the prompt.
    - Ask if the user is ready.

Follow this sequence: Recap -> Call Tool (`get_current_workbook_prompt`) -> Present Exact Prompt from Tool.
',
    'Returning User Instructions',
    'Instructions for the AI agent when a user returns to a session.'
)
ON CONFLICT (key) DO UPDATE SET
  content = EXCLUDED.content,
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  updated_at = NOW();

-- Also ensure its necessary parameters are present
-- Parameter: name
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'name', 'The user''s name.', true, 1 FROM public.prompt_templates WHERE key = 'returning_user_instructions'
ON CONFLICT (template_id, name) DO NOTHING;

-- Parameter: motivation
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'motivation', 'The user''s stated motivation for the sessions.', true, 2 FROM public.prompt_templates WHERE key = 'returning_user_instructions'
ON CONFLICT (template_id, name) DO NOTHING;

-- Parameter: recentChapterRecapText
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'recentChapterRecapText', 'The full text summarizing the user''s recent interactions from the current/previous module.', true, 3 FROM public.prompt_templates WHERE key = 'returning_user_instructions'
ON CONFLICT (template_id, name) DO NOTHING;

-- Parameter: currentPromptTextForUser
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'currentPromptTextForUser', 'The exact text of the current reflection question for the user.', true, 4 FROM public.prompt_templates WHERE key = 'returning_user_instructions'
ON CONFLICT (template_id, name) DO NOTHING;