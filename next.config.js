/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  env: {
    NEXT_PUBLIC_SUPABASE_URL: process.env.NEXT_PUBLIC_SUPABASE_URL,
    NEXT_PUBLIC_SUPABASE_ANON_KEY: process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
    NEXT_PUBLIC_API_BASE_URL: process.env.NEXT_PUBLIC_API_BASE_URL,
    NEXT_PUBLIC_ENABLE_MODULE_PERSISTENCE: process.env.NEXT_PUBLIC_ENABLE_MODULE_PERSISTENCE,
    NEXT_PUBLIC_LIVE_CAPTIONS_ENABLED: process.env.NEXT_PUBLIC_LIVE_CAPTIONS_ENABLED,
  },
};

module.exports = nextConfig;