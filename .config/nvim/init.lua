-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
  extension = {
    rcl = "rcl",
    rv = "revo",
    revo = "revo",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rcl",
  callback = function()
    vim.lsp.start({
      name = "rcl-lsp",
      cmd = { "/home/kehinde/dev/rcl/target/release/rcl-lsp" },
      root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1]) or vim.fn.getcwd(),
    })
  end,
})

vim.lsp.config("revo", {
  cmd = { "revo", "lsp" },
  filetypes = { "rv", "revo" },
  root_markers = { "lib.json", "exe.json", ".git" },
})

vim.treesitter.language.register("revo", {
  "rv",
  "revo",
})

require("nvim-treesitter").setup({
  local_parser = {
    revo = {
      source = {
        type = "git",
        url = "https://codeberg.org/doomy/tree-sitter-revo",
        revision = "main",
      },
      filetype = "revo",
    },
  },
})

require("nvim-treesitter").install({ "revo" })
