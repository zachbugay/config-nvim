-- Autocompletion
return {
  "saghen/blink.cmp",
  event = "VimEnter",
  branch = "main",
  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
  },
  ---@param plugin LazyPlugin
  build = function(plugin)
    ---@param out vim.SystemCompleted
    local on_exit = function(out)
      if out.code == 0 then
        return
      end
      print(out.code)
      print(out.signal)
      print(out.stdout)
      print(out.stderr)
    end

    ---@module "blink.cmp"
    ---@type "blink.cmp.API"
    require("blink.cmp").build():wait(60000)
  end,
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { "lsp", "path", "snippets", "lazydev", "buffer" },
      providers = {
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
        buffer = {
          -- Make buffer completions appear at the end.
          score_offset = -100,
          enabled = function()
            -- Filetypes for which buffer completions are enabled; add filetypes to extend:
            local enabled_filetypes = {
              "markdown",
              "text",
            }
            local filetype = vim.bo.filetype
            return vim.tbl_contains(enabled_filetypes, filetype)
          end,
        },
      },
    },
    fuzzy = {
      implementation = "rust",
    },
    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  },
}
