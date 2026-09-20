-- Free tier of Google AI Studio. Set GEMINI_API_KEY in the environment.
require('minuet').setup({
  provider = 'gemini',
  provider_options = {
    gemini = {
      model = 'gemini-3.5-flash',
      -- name of the environment variable that holds the key, not the key itself
      api_key = 'GEMINI_API_KEY',
      optional = {
        generationConfig = {
          maxOutputTokens = 256,
          -- keep thinking minimal to avoid first-token latency
          thinkingConfig = { thinkingLevel = 'minimal' },
        },
      },
    },
  },
  -- Small and infrequent requests to stay within the free-tier rate limit.
  n_completions = 1,
  context_window = 512,
  request_timeout = 2.5,
  throttle = 1500,
  debounce = 600,
  cmp = {
    enable_auto_complete = true,
  },
})
