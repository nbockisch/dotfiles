return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "angular",
      "bash",
      "c",
      "c_sharp",
      "cpp",
      "dart",
      "dockerfile",
      "go",
      "java",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "jsonnet",
      "lua",
      "make",
      "markdown",
      "query",
      "rust",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
      "zig"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
