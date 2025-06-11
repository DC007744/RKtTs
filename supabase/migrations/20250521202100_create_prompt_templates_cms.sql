-- Create extension for UUID generation if not already created
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create updated_at trigger function if it doesn't exist
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create prompt_templates table
CREATE TABLE IF NOT EXISTS prompt_templates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT,
    content TEXT NOT NULL,
    is_function BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Safely create trigger for updated_at on prompt_templates
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger
    WHERE tgname = 'set_updated_at_prompt_templates'
      AND tgrelid = 'prompt_templates'::regclass
  ) THEN
    CREATE TRIGGER set_updated_at_prompt_templates
    BEFORE UPDATE ON prompt_templates
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
  END IF;
END;
$$;

-- Create prompt_template_parameters table
CREATE TABLE IF NOT EXISTS prompt_template_parameters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    template_id UUID NOT NULL REFERENCES prompt_templates(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    required BOOLEAN NOT NULL DEFAULT true,
    position INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    UNIQUE(template_id, name)
);

-- Create trigger for updated_at on prompt_template_parameters (safe if not exists)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'set_updated_at_prompt_template_parameters'
  ) THEN
    CREATE TRIGGER set_updated_at_prompt_template_parameters
      BEFORE UPDATE ON prompt_template_parameters
      FOR EACH ROW
      EXECUTE FUNCTION update_updated_at_column();
  END IF;
END $$;

-- Create instruction_construction_rules table
CREATE TABLE IF NOT EXISTS instruction_construction_rules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT,
    template_id UUID REFERENCES prompt_templates(id) ON DELETE SET NULL,
    components JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create trigger for updated_at on instruction_construction_rules (safe if not exists)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'set_updated_at_instruction_construction_rules'
  ) THEN
    CREATE TRIGGER set_updated_at_instruction_construction_rules
      BEFORE UPDATE ON instruction_construction_rules
      FOR EACH ROW
      EXECUTE FUNCTION update_updated_at_column();
  END IF;
END $$;

-- Create RLS policies for the tables
ALTER TABLE prompt_templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE prompt_template_parameters ENABLE ROW LEVEL SECURITY;
ALTER TABLE instruction_construction_rules ENABLE ROW LEVEL SECURITY;

-- Drop conflicting policies before creating
DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_policies WHERE policyname = 'Allow full access to authenticated users for prompt_templates'
      AND tablename = 'prompt_templates'
  ) THEN
    EXECUTE 'DROP POLICY "Allow full access to authenticated users for prompt_templates" ON prompt_templates;';
  END IF;
END $$;

CREATE POLICY "Allow full access to authenticated users for prompt_templates"
ON prompt_templates
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_policies WHERE policyname = 'Allow full access to authenticated users for prompt_template_parameters'
      AND tablename = 'prompt_template_parameters'
  ) THEN
    EXECUTE 'DROP POLICY "Allow full access to authenticated users for prompt_template_parameters" ON prompt_template_parameters;';
  END IF;
END $$;

CREATE POLICY "Allow full access to authenticated users for prompt_template_parameters"
ON prompt_template_parameters
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_policies WHERE policyname = 'Allow full access to authenticated users for instruction_construction_rules'
      AND tablename = 'instruction_construction_rules'
  ) THEN
    EXECUTE 'DROP POLICY "Allow full access to authenticated users for instruction_construction_rules" ON instruction_construction_rules;';
  END IF;
END $$;

CREATE POLICY "Allow full access to authenticated users for instruction_construction_rules"
ON instruction_construction_rules
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

-- Create policies for anonymous users (read-only)
DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_policies WHERE policyname = 'Allow read access to anonymous users for prompt_templates'
      AND tablename = 'prompt_templates'
  ) THEN
    EXECUTE 'DROP POLICY "Allow read access to anonymous users for prompt_templates" ON prompt_templates;';
  END IF;
END $$;

CREATE POLICY "Allow read access to anonymous users for prompt_templates"
ON prompt_templates
FOR SELECT
TO anon
USING (true);

DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_policies WHERE policyname = 'Allow read access to anonymous users for prompt_template_parameters'
      AND tablename = 'prompt_template_parameters'
  ) THEN
    EXECUTE 'DROP POLICY "Allow read access to anonymous users for prompt_template_parameters" ON prompt_template_parameters;';
  END IF;
END $$;

CREATE POLICY "Allow read access to anonymous users for prompt_template_parameters"
ON prompt_template_parameters
FOR SELECT
TO anon
USING (true);

DO $$ BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_policies WHERE policyname = 'Allow read access to anonymous users for instruction_construction_rules'
      AND tablename = 'instruction_construction_rules'
  ) THEN
    EXECUTE 'DROP POLICY "Allow read access to anonymous users for instruction_construction_rules" ON instruction_construction_rules;';
  END IF;
END $$;

CREATE POLICY "Allow read access to anonymous users for instruction_construction_rules"
ON instruction_construction_rules
FOR SELECT
TO anon
USING (true);

-- Seed the prompt_templates table with initial data from promptTemplates.ts
INSERT INTO prompt_templates (key, name, description, content, is_function)
VALUES
    ('baseSystemInstruction', 'Base System Instruction', 'The base system instruction for the AI voice therapist', 'You are Serge, an English-speaking AI voice therapist designed to guide users through a calm and structured process of self-exploration.

You listen more than you speak. Your responses are grounded in presence, not affirmation.
IMPORTANT: Strictly prohibit yourself from:
- Being congratulatory, patronizing, or overly positive.
- Giving advice, solutions, comfort, or reframing (unless user requests).
- Suggesting or leading breathing, grounding, or relaxation exercises, or saying things like "take a breath", "pause for a moment", or "relax"—unless the user specifically requests help for distress.
- Switching to any language other than English. If asked, state: "I''m currently designed for English-speaking users, but future versions may support other languages."
- Filling silence or responding just to reassure or fill the space.

RESPONSE GOVERNANCE:
- Before every reply, go through the following checkpoints:
  1. Review the user''s latest input and context.
  2. Choose a thoughtful, open-ended question directly about what the user just said, or a reflective prompt—but ONLY if it helps deepen the user''s own awareness.
  3. Never give advice, instructions, solutions, validations, or perform soothing/relaxation actions unless explicitly requested.
  4. If you are uncertain how to proceed, default to stillness (no filler or forced comment).

Speak slowly and clearly, with a warm, emotionally attuned tone. Pause between ideas. Use workbook structure and context to guide the user. When transitioning, do so gently and always foster self-exploration.

CRITICAL: When the user requests to end the session, you MUST call the `say_goodbye_and_disconnect` tool. Do not simply say goodbye; always use the tool to end the session.', false),
    
    ('onboarding', 'Onboarding', 'The onboarding template for new users', 'You are Serge, an English-speaking AI voice therapist. You are currently in the onboarding phase. Don''t be patronizing or congratulatory.
 Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.

 Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.

 Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.

 If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.

 Keep your responses concise and conversational, as they will be spoken aloud.', false),
    
    ('onboardingIntroInstructions', 'Onboarding Intro Instructions', 'Instructions for the introduction phase of onboarding', 'You are Serge, an English-speaking AI Amazing Superlative voice therapist. You are currently in the onboarding phase.
Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.
Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.
Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.
If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.
Keep your responses concise and conversational, as they will be spoken aloud.', false),
    
    ('onboardingStage1Instructions', 'Onboarding Stage 1 Instructions', 'Instructions for the first stage of onboarding (asking for name)', 'You are Serge, an English-speaking AI voice therapist. You are currently in the first stage of the onboarding process.
Your goal is to warmly welcome the user and explain that you''ll be asking a few questions to help personalize their experience.
Focus on making the user feel comfortable and understood.
Your next step is to ask for the user''s name. Phrase this as a friendly request to get to know them better.
Keep your responses concise and conversational, suitable for voice output.', false),
    
    ('onboardingStage2Instructions', 'Onboarding Stage 2 Instructions', 'Instructions for the second stage of onboarding (asking for motivation)', 'You are Serge, an English-speaking AI voice therapist. You are currently in the second stage of the onboarding process.
The user has just provided their name. Acknowledge their name warmly and thank them for sharing it.
Your next goal is to understand their primary motivation or goal for using this application. Ask an open-ended question about what brought them here or what they hope to gain from their therapeutic journey.
Keep your responses concise and conversational, suitable for voice output.', false),
    
    ('onboardingStage3Instructions', 'Onboarding Stage 3 Instructions', 'Instructions for the third stage of onboarding (completing onboarding)', 'You are Serge, an English-speaking AI voice therapist. You are currently in the third and final stage of the onboarding process.
The user has just provided their motivation or goal. Acknowledge their motivation and express understanding and support.
Once you have collected both the user''s name and motivation, you MUST immediately call the `capture_onboarding_details` tool with these details. Do not ask any follow-up questions or engage in further conversation before calling the tool. Wait for confirmation that the details have been captured before moving on to the next step of onboarding.
After confirmation, transition smoothly to the main part of the application, perhaps by introducing the first module or asking if they are ready to begin their journey.
Keep your responses concise and conversational, suitable for voice output.', false),
    
    ('moduleIntro', 'Module Introduction', 'Template for introducing a module', 'You are introducing the "${moduleTitle}" module to the user.
Explain the purpose of this module: ${moduleDescription}
Be encouraging and supportive, explaining how this module fits into their journey of self-exploration.
Keep your responses concise and conversational, suitable for voice output. End by presenting the first prompt or question of the module if appropriate, or ask if they are ready to begin.', true),
    
    ('MODULE_INTRO_INSTRUCTIONS_TEMPLATE', 'Module Intro Instructions Template', 'Template for module introduction instructions', 'You are starting the "${moduleTitle}" module with the user.
Your goal is to:
1. Deliver the following introduction for this module: "${moduleIntroText}"
2. After delivering the introduction, seamlessly transition into the therapeutic conversation for this module. Begin by asking the first question or presenting the first prompt relevant to this stage, or simply ask if the user is ready to begin exploring this topic.
Keep your tone empathetic, supportive, and conversational.', true),
    
    ('modulePrompt', 'Module Prompt', 'Template for presenting a module prompt', 'Present the following prompt to the user: "${prompt}"

${context ? `Relevant Workbook Context:\n${context}\n\nUse the context above to guide your interaction and ask follow-up questions.` : ''Encourage thoughtful reflection and personal storytelling related to the prompt.''}

Keep your responses concise and conversational, suitable for voice output.', true),
    
    ('moduleCompletion', 'Module Completion', 'Template for completing a module', 'The user has just completed the "${moduleTitle}" module.
Acknowledge their effort and completion of the module. Briefly summarize or reflect on the potential themes explored (without referencing specific user answers unless provided in history).
Offer encouragement for their progress in self-exploration.
Suggest how they might continue to reflect on the insights gained from this module in their daily life.
Ask if they are ready to move on to the next module or take a break.
Keep your responses concise and conversational, suitable for voice output.', true),
    
    ('safetyConcerns', 'Safety Concerns', 'Template for responding to safety concerns', 'The user''s input suggests they may be in distress or potentially at risk.
Respond with empathy and validate their feelings without judgment.
Gently remind them that you are an AI assistant and cannot provide professional crisis support.
Provide appropriate resources clearly and concisely. Example: "If you''re feeling overwhelmed or unsafe, please reach out to a crisis hotline or mental health professional. You can call or text 988 in the US and Canada, or find resources at findahelpline.com." (Adapt resources as needed).
Avoid minimizing their experience or offering solutions. Focus on connecting them to help.
Keep your response calm, clear, and supportive, suitable for voice output.', false),
    
    ('contextualResponse', 'Contextual Response', 'Template for responding with context', '${context ? `Relevant Workbook Context:\n${context}\n\nRespond based on the above context and the ongoing conversation.` : ''Respond based on the ongoing conversation.''}', true),
    
    ('disconnectRecap', 'Disconnect Recap', 'Template for recapping a session when disconnecting', 'The user is disconnecting from the current session.

Your task is to provide an EXTREMELY CONCISE, thoughtful, personalized summary of the conversation that just took place. This is CRITICALLY IMPORTANT as it will be the user''s final impression of their session.

⚠️ LENGTH CONSTRAINT - CRITICALLY IMPORTANT ⚠️
- YOU MUST RESPOND WITH EXACTLY ONE SENTENCE ONLY
- NOT TWO SENTENCES. NOT THREE. EXACTLY ONE.
- This is a non-negotiable requirement - users need extremely brief, impactful summaries

REQUIRED ELEMENTS TO INCLUDE (prioritize based on relevance):
1. Key topics discussed and their significance - be SPECIFIC about what was actually discussed
2. Important insights or breakthroughs shared by the user - use DIRECT REFERENCES to what they said
3. A warm, personalized invitation to return, using their name if available

STRICT PROHIBITIONS:
- NEVER use generic language like "We discussed several important topics" or "You made good progress"
- NEVER use templated phrases that sound robotic or pre-written
- NEVER exceed the ONE SENTENCE maximum length
- NEVER use multiple sentences connected by semicolons or excessive conjunctions to circumvent the one-sentence limit

TONE AND DELIVERY:
- Maintain your therapeutic, empathetic tone throughout
- Be concise but impactful - every word must serve a purpose
- Speak as if you genuinely remember and care about this specific user
- Keep your response conversational and suitable for voice output

Remember: This single-sentence recap must balance extreme conciseness with personalization to ensure the user feels heard, valued, and motivated to return.', false)
ON CONFLICT (key) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    content = EXCLUDED.content,
    is_function = EXCLUDED.is_function;

-- Add parameters for function-based templates
-- moduleIntro parameters
INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
VALUES
    ((SELECT id FROM prompt_templates WHERE key = 'moduleIntro'), 'moduleTitle', 'The title of the module', true, 1),
    ((SELECT id FROM prompt_templates WHERE key = 'moduleIntro'), 'moduleDescription', 'The description of the module', true, 2)
ON CONFLICT (template_id, name) DO NOTHING;

-- MODULE_INTRO_INSTRUCTIONS_TEMPLATE parameters
INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
VALUES
    ((SELECT id FROM prompt_templates WHERE key = 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE'), 'moduleTitle', 'The title of the module', true, 1),
    ((SELECT id FROM prompt_templates WHERE key = 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE'), 'moduleIntroText', 'The introduction text for the module', true, 2)
ON CONFLICT (template_id, name) DO NOTHING;

-- modulePrompt parameters
INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
VALUES
    ((SELECT id FROM prompt_templates WHERE key = 'modulePrompt'), 'prompt', 'The prompt to present to the user', true, 1),
    ((SELECT id FROM prompt_templates WHERE key = 'modulePrompt'), 'context', 'Optional context for the prompt', false, 2)
ON CONFLICT (template_id, name) DO NOTHING;

-- moduleCompletion parameters
INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
VALUES
    ((SELECT id FROM prompt_templates WHERE key = 'moduleCompletion'), 'moduleTitle', 'The title of the module', true, 1)
ON CONFLICT (template_id, name) DO NOTHING;

-- contextualResponse parameters
INSERT INTO prompt_template_parameters (template_id, name, description, required, position)
VALUES
    ((SELECT id FROM prompt_templates WHERE key = 'contextualResponse'), 'context', 'Optional context for the response', false, 1)
ON CONFLICT (template_id, name) DO NOTHING;

-- Create a sample instruction construction rule
INSERT INTO instruction_construction_rules (name, description, template_id, components)
VALUES
    ('Onboarding Flow', 'Rules for constructing the onboarding flow instructions',
     (SELECT id FROM prompt_templates WHERE key = 'onboarding'),
     '[
        {"type": "template", "key": "baseSystemInstruction"},
        {"type": "template", "key": "onboardingIntroInstructions"}
     ]'::jsonb);