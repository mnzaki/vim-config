return {
  -- 1. LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',           -- Installs servers
      'williamboman/mason-lspconfig.nvim', -- Bridges Mason & LSPConfig
    },
    config = function()
      -- turn this back on when you need to debug!!
      vim.lsp.set_log_level("off")

      require("mason").setup()
      require("mason-lspconfig").setup({
        -- This list ensures these servers are automatically installed
        ensure_installed = {
          "clangd", "gopls", "html", "jdtls", "jsonls",
          "marksman", "pyright", "rust_analyzer", "bashls",
          "ts_ls", "dockerls", "elixirls", "lua_ls"
        }
      })

      vim.diagnostic.config({
        virtual_text = true, -- Keep inline error text? (set false if too noisy)
        signs = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Keybindings (runs only when LSP is active in a buffer)
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
      end

      -- Capabilities (connects LSP to autocomplete)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup all servers with default config
      local servers = {
        "clangd", "cmake", "gopls", "html", "jdtls", "jsonls",
        "marksman", "pyright", "rust_analyzer", "bashls",
        "ts_ls", "volar", "dockerls", "elixirls"
      }

      for _, server in pairs(servers) do
        vim.lsp.config(server, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      -- Lua specific setup (so it knows 'vim' globals)
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = { diagnostics = { globals = { 'vim' } } }
        }
      })
    end
  },

  -- 2. Autocompletion (The Popup Menu)
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- ['<Tab>'] = cmp.mapping.select_next_item(),
          -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  },

  -- 3. Formatting & Linting (Replaces coc-prettier/eslint)
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier", "eslint_d" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  -- 4. Telescope (Replaces fzf-preview)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>a', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>o', builtin.lsp_document_symbols, {})
    end
  }
}
