return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      require("nvim-treesitter").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "bash", "c", "cpp", "go", "java", "html", "javascript",
          "json", "lua", "markdown", "markdown_inline", "python",
          "rust", "svelte", "typescript", "vim", "vimdoc", "query",
          "supercollider", "dockerfile", "desktop", "jsdoc", "comment",
          "css"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
          enable = true, -- false will disable the whole extension
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })

      require('treesitter-context').setup({
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        multiline_threshold = 10, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner , 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
      })
    end
  }
}
