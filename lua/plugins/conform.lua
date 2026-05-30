-- Autoformat
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    notify_on_error = false,
    notify_no_formatters = true,
    log_level = vim.log.levels.DEBUG,
    format_on_save = function(bufnr)
      return {
        timeout_ms = 1000,
        lsp_format = "fallback",
      }
    end,
    formatters = {
      dprint = {
        prepend_args = { "--config-discovery=global" },
      },
    },
    formatters_by_ft = {
      ["_"] = { "trim_whitespace" },
      astro = { "dprint" },
      javascript = { name = "dprint" },
      javascriptreact = { name = "dprint" },
      json = { name = "dprint" },
      jsonc = { name = "dprint" },
      lua = { "stylua" },
      markdown = { "dprint" },
      scss = { "dprint" },
      sh = { "shfmt" },
      terraform = { "terraform_fmt" },
      toml = { "dprint" },
      typescript = { name = "dprint" },
      typescriptreact = { name = "dprint" },
      yaml = { "dprint" },
    },
  },
}
