return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
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
          indent = { enable = true },  
        })
    end
  }
}
