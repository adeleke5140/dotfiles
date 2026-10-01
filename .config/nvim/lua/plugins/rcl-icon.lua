return {
  "nvim-tree/nvim-web-devicons",
  opts = function(_, opts)
    opts.override_by_extension = vim.tbl_extend("force", opts.override_by_extension or {}, {
      rcl = {
        icon = "\u{F300}",
        color = "#4a90d9",
        cterm_color = "33",
        name = "Rcl",
      },
    })
    opts.override_by_filename = vim.tbl_extend("force", opts.override_by_filename or {}, {
      ["Cargo.rcl"] = {
        icon = "\u{F300}",
        color = "#4a90d9",
        cterm_color = "33",
        name = "CargoRcl",
      },
      ["build.rcl"] = {
        icon = "\u{F300}",
        color = "#4a90d9",
        cterm_color = "33",
        name = "BuildRcl",
      },
    })
  end,
}
