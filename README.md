# Serge - Therapeutic Voice Assistant

Serge is a web-based therapeutic application that helps users explore their life stories through guided conversation with an AI voice agent. The application uses OpenAI's Realtime Audio API to create a responsive, voice-driven therapeutic experience that follows a structured workbook approach to personal development.

## Technology Stack

- **Frontend**: Next.js 14+ with TypeScript and Tailwind CSS
- **Backend**: Fly.io API service
- **Database**: Supabase with pgvector for embeddings
- **AI**: OpenAI Realtime Audio API and GPT models
- **Animation**: Lottie for audio visualization

## Getting Started

### Prerequisites

- Node.js 18+ and npm
- OpenAI API key
- Supabase account and project

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd serge
```

2. Install dependencies
```bash
npm install
```

3. Set up environment variables
```bash
# Create a .env.local file with the following variables
OPENAI_API_KEY=your_openai_api_key
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

4. Start the development server
```bash
npm run dev
```

5. Open [http://localhost:3000](http://localhost:3000) with your browser to see the application

## Project Structure

- `app/` - Next.js application directory with route groups
- `components/` - Reusable UI components
- `lib/` - Utility functions and service integrations
- `public/` - Static assets

## Development

### Commands

- `npm run dev` - Start the development server
- `npm run build` - Build the application for production
- `npm run start` - Start the production server
- `npm run lint` - Run ESLint to check code quality
