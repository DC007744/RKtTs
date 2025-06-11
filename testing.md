# Serge Application Testing Guide - Post CMS & Debug Panel Integration

This document outlines key testing procedures to verify the successful integration of the KeystoneJS CMS and the conditional Debug Panel, as well as to ensure no regressions have occurred in existing functionality, particularly the "recap context" feature for returning users.

## I. Prerequisites

1.  **Database Migrations:**
    *   Ensure your local Supabase instance (for the main app, default `127.0.0.1:54321`) is running.
    *   Ensure your local Supabase instance for the CMS (default `127.0.0.1:54322`, see `.env.development` `DATABASE_URL` for Keystone) is running.
    *   Apply all database migrations:
        ```bash
        supabase db reset 
        ```
        (This command stops your local Supabase, applies all migrations including the new `20250601201500_integrate_keystone_cms_schema.sql`, and restarts it. Ensure data in your local CMS DB is backed up if important, as `db reset` clears it before applying migrations.)
        Alternatively, to apply only pending migrations:
        ```bash
        supabase migration up
        ```
2.  **Environment Variables:**
    *   Verify `.env.development` contains correct Supabase URLs for both the main app and the CMS.
    *   Verify `NEXT_PUBLIC_SHOW_DEBUG_INFO_PANEL=true`.
    *   Verify CMS basic auth credentials (if set up and you want to test auth).
3.  **NPM Dependencies:**
    *   Ensure `npm install` has been run successfully after pulling the latest changes.
4.  **Start Services:**
    *   Run `npm run dev`. This should start:
        *   Next.js application (e.g., on `http://localhost:5001`)
        *   KeystoneJS CMS (e.g., on `http://localhost:4001`)

## II. KeystoneJS CMS Testing

Access the CMS admin UI (e.g., `http://localhost:4001`).

1.  **Authentication (if enabled via `basicAuthMiddleware`):**
    *   **Test:** Attempt to access the CMS.
    *   **Expected:** Should be prompted for basic auth credentials. Valid credentials grant access; invalid ones deny.
2.  **List Verification:**
    *   **Test:** Navigate through the CMS lists.
    *   **Expected:** The following lists should be present and accessible:
        *   `WorkbookChapter`
        *   `ReflectionQuestion`
        *   `SergeInstruction` (maps to `prompt_templates`)
        *   `OpenAISetting`
3.  **Prompt Template Management (`SergeInstruction` List):**
    *   **Test:**
        *   View existing prompt templates (e.g., `baseSystemInstruction`, `onboarding`, `returning_user_instructions`).
        *   Modify the content of a non-critical prompt template (e.g., add a test phrase to `onboardingIntroInstructions`). Save changes.
        *   Attempt to create a new prompt template.
        *   Attempt to edit its parameters (if applicable, via related list if UI supports).
    *   **Expected:**
        *   Existing templates should display their seeded content.
        *   Changes should save successfully.
        *   New templates can be created.
        *   The application (Next.js app) should reflect these changes in agent behavior after a new session or relevant trigger. For example, the modified `onboardingIntroInstructions` should be used by the agent for new users.
    *   **Potential Failures:**
        *   CMS UI errors.
        *   Changes not saving to the database.
        *   Application not picking up CMS changes (caching issues, incorrect `promptService` logic).
4.  **OpenAI Settings Management (`OpenAISetting` List):**
    *   **Test:**
        *   View the existing OpenAI setting (should be one row for temperature).
        *   Modify the `temperature` value (e.g., to 0.9, then back to 0.2). Save changes.
    *   **Expected:**
        *   The temperature value should update in the CMS.
        *   The application should use the updated temperature for new OpenAI API calls (this might be subtle to observe directly but can be inferred from agent response variability or by checking API call payloads if debugging network requests).
    *   **Potential Failures:**
        *   CMS UI errors for the SliderField.
        *   Changes not saving.
        *   Application not using the updated temperature.
5.  **Content Integrity:**
    *   **Test:** Spot-check data in `workbook_chapters` and `reflection_questions` if they are managed by CMS.
    *   **Expected:** Data should be consistent with intended workbook structure.

## III. Debug Panel Testing

Access the Next.js application (e.g., `http://localhost:5001`).

1.  **Visibility:**
    *   **Test:** With `NEXT_PUBLIC_SHOW_DEBUG_INFO_PANEL=true` in `.env.development`.
    *   **Expected:** The Debug Info Panel should be visible on the main interaction page (typically fixed at the bottom).
    *   **Test:** Change `NEXT_PUBLIC_SHOW_DEBUG_INFO_PANEL` to `false`, restart the Next.js app.
    *   **Expected:** The Debug Info Panel should NOT be visible.
2.  **Content Accuracy:**
    *   **Test:** Interact with the application (onboarding, navigating chapters).
    *   **Expected:** The Debug Info Panel should accurately reflect:
        *   `Current Stage` (e.g., 'onboarding', 'early_life').
        *   `Name` and `Motivation` (once captured).
        *   `User Type` (First-time/Returning).
        *   `User ID`.
        *   `Agent Phase`.
        *   Content of `DebugAgentQuestions` should be relevant.
    *   **Potential Failures:**
        *   Panel not updating.
        *   Incorrect information displayed.

## IV. Main Application Functionality & Regression Testing

Focus on ensuring core features, especially the "recap context," remain functional.

1.  **New User Onboarding Flow:**
    *   **Test:** Clear browser localStorage for the site. Start a new session.
    *   **Expected:**
        *   Agent should initiate the onboarding flow (asking for name, then motivation).
        *   `capture_onboarding_details` tool should be called correctly.
        *   User `name` and `motivation` should be saved to `user_sessions` table in Supabase.
        *   Session should transition smoothly to the first module (e.g., "early_life") after onboarding.
        *   Debug panel should reflect "First-time" user and update name/motivation.
    *   **Potential Failures:**
        *   Agent stuck in onboarding loop.
        *   Tool call errors.
        *   Data not saving to Supabase.
        *   Incorrect transition post-onboarding.
2.  **Returning User Recap Context:**
    *   **Test:**
        1.  Complete onboarding and interact with the first module (e.g., "early_life") for a few turns.
        2.  End the session (e.g., by navigating away or closing the tab).
        3.  Start a new session (re-open the application).
    *   **Expected:**
        *   The agent should provide a recap of the previous session/chapter ("early_life" in this case) before presenting the current prompt for that module.
        *   The `returning_user_instructions` prompt template (fetched from CMS) should be used.
        *   The `recentChapterRecapText` should be correctly populated and used.
        *   Debug panel should reflect "Returning" user.
    *   **Potential Failures:**
        *   No recap provided; agent behaves as if it's a new user or starts the module afresh.
        *   Incorrect recap provided.
        *   Errors in fetching `chapter_summaries` or `prompt_templates`.
3.  **Chapter Navigation:**
    *   **Test:** After onboarding, navigate using "Prev" and "Next" chapter buttons.
    *   **Expected:**
        *   Smooth transition between chapters.
        *   `currentModuleId` and `currentModuleSlug` update correctly in `userSessionContext` and Supabase.
        *   Agent provides context for the new chapter.
        *   Voice session reconnects correctly with the new chapter's context.
        *   Chapter summaries are generated and saved upon completing a chapter (when navigating "Next").
    *   **Potential Failures:**
        *   Navigation buttons disabled incorrectly.
        *   Agent loses context or fails to reconnect voice for the new chapter.
        *   Errors in updating session state or Supabase.
4.  **Voice Interaction & Tool Calls:**
    *   **Test:** General voice interaction, ensure agent responds, tools like `trackWorkbookProgressToolSchema`, `getCurrentWorkbookPromptToolSchema`, `sayGoodbyeAndDisconnectToolSchema` are functioning as expected post-onboarding.
    *   **Expected:** Smooth conversation, correct tool execution.
    *   **Potential Failures:** Agent not responding, tool errors, unexpected agent behavior.
5.  **Conversation History:**
    *   **Test:** Check if conversation history is saved to Supabase (`conversation_messages` table) and can be viewed (if UI exists).
    *   **Expected:** History saved correctly.
    *   **Potential Failures:** History not saving, errors in `saveToSupabase` in `ConversationContext`.
6.  **General Stability:**
    *   **Test:** Perform various actions, try edge cases.
    *   **Expected:** No console errors (client/server), no UI freezes, application remains stable.

## V. Specific Checks for Cherry-Picked Commits

*   **`5ca5ffc` (Reconnect bug fixed, User conversation history supabase bug fixed):**
    *   Pay close attention to voice session stability during navigation and reconnections.
    *   Verify conversation history saving to Supabase is robust, especially around session end and disconnects.
*   **CMS-related commits:** Ensure that any UI elements or logic relying on CMS-configurable data (prompts, OpenAI settings) behave as expected when those settings are changed in the CMS.

This testing plan should provide good coverage for the integrated features and help identify any regressions or new issues.