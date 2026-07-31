-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.hl_op()
  end,
})

-- Highlighting for files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  desc = "Determine the highlight of a file that is a go template.",
  group = vim.api.nvim_create_augroup("bugay-buffer-highlight", { clear = true }),
  callback = function(args)
    local buffer_number = args.buf
    local file_name = vim.fn.expand("%")

    local tmp_exts = { "tmp", "bak" }

    for _, ext in ipairs(tmp_exts) do
      if file_name:match("%." .. ext .. "$") then
        local base, ext1, ext2 = file_name:match("^(.+)%.(.+)%.(.+)$")
        -- Some files only have .tmpl, and these should be ignored.
        if string.find(ext1, "/") then
          break
        end
        vim.bo[buffer_number].filetype = ext1
        break
      end
    end
  end,
})
