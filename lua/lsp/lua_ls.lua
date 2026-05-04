-- lua_ls = {
--   cmd = { "lua-language-server" },
--   -- filetypes = { ... },
--   -- capabilities = {},
--   settings = {
--     Lua = {
--       completion = {
--         callSnippet = "Replace",
--       },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file("", true), --Include runtime files
--         checkThirdParty = false,
--       },
--       -- You can toggle below to ignore lua_ls's noisy `missing-fields` warnings
--       diagnostics = {
--         globals = { "vim" },
--         -- disable = { "missing-fields" },
--       },
--     },
--   },
-- },

---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  -- NOTE: These will be merged with the configuration file.
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
      -- Using stylua for formatting.
      format = { enable = false },
      hint = {
        enable = true,
        arrayIndex = "Disable",
      },
      runtime = {
        version = "LuaJIT",
      },
    },
  },
}
