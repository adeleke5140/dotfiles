-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
-- vim.lsp.log.set_level("debug")

-- lazy loading the float to show relatedInformation from a lsp
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = true,
        format = function(diag)
          local msg = diag.message
          local lsp = diag.user_data and diag.user_data.lsp
          if lsp and lsp.relatedInformation then
            for _, ri in ipairs(lsp.relatedInformation) do
              local line = ri.location.range.start.line + 1
              local col = ri.location.range.start.character + 1
              msg = msg .. string.format("\n -> %s (line %d, col %d)", ri.message, line, col)
            end
          end
          return msg
        end,
      },
    })
  end,
})
