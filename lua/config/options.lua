-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
return {
  "neovim/nvim-lspconfig",
  -- using lazy.nvim
  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = {},
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  },
  opts = {
    servers = {
      ocamllsp = {
        filetypes = {
          "ocaml",
          "ocaml.menhir",
          "ocaml.interface",
          "ocaml.ocamllex",
          "reason",
          "dune",
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "*.opam",
            "esy.json",
            "package.json",
            ".git",
            "dune-project",
            "dune-workspace",
            "*.ml"
          )(fname)
        end,
      },
    },
  },
}
