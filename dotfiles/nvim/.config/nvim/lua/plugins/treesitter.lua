return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
            "c",
            "c_sharp",
            "cpp",
            "dart",
            "dockerfile",
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
