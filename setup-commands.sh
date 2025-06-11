#!/bin/bash

# Create Next.js project with TypeScript and Tailwind CSS
npx create-next-app@latest serge --typescript --tailwind --eslint --app
cd serge

# Install essential dependencies
npm install @openai/api @supabase/supabase-js lottie-react uuid
npm install --save-dev @types/uuid prettier eslint-config-prettier

# Create project structure
mkdir -p app/dashboard
mkdir -p app/onboarding
mkdir -p app/module
mkdir -p app/history
mkdir -p app/conversation
mkdir -p components/layout
mkdir -p components/typography
mkdir -p components/buttons
mkdir -p components/inputs
mkdir -p components/feedback
mkdir -p components/animation
mkdir -p components/conversation
mkdir -p components/modules
mkdir -p components/progress
mkdir -p components/safety
mkdir -p components/avatar
mkdir -p components/onboarding
mkdir -p components/history
mkdir -p lib/api
mkdir -p lib/context
mkdir -p lib/models
mkdir -p lib/openai
mkdir -p lib/audio
mkdir -p lib/speech
mkdir -p lib/animation
mkdir -p lib/session
mkdir -p lib/modules
mkdir -p lib/history
mkdir -p lib/safety
mkdir -p lib/avatar
mkdir -p lib/onboarding
mkdir -p lib/supabase
mkdir -p lib/config
mkdir -p public/animations

# Initialize Git repository
git init
git add .
git commit -m "Initial project setup"

echo "Project setup complete! Navigate to the serge directory to start development."