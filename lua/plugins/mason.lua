return {
  {
    'williamboman/mason.nvim',
    build = ":MasonUpdate", -- Optional but updates registry for Mason
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ruby_lsp", "solargraph" }, -- Automatically install ruby_lsp
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      -- Use mason-lspconfig to integrate Solargraph with lspconfig
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- Default handler for all installed servers
          lspconfig[server_name].setup({})
        end,
        ["ruby_lsp"] = function()
          lspconfig.ruby_lsp.setup({
            --filetypes = { "ruby", "!erb" }, -- Exclude erb files
          })
        end,
        ["solargraph"] = function()
          lspconfig.solargraph.setup({
            formatting = false
          })
        end,
      })
    end,
  },
  -- Autocompletion plugin setup
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',      -- Buffer source
      'hrsh7th/cmp-path',        -- Path source
      'hrsh7th/cmp-cmdline',     -- Command-line source
      'L3MON4D3/LuaSnip',        -- Snippet engine (optional but recommended)
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For LuaSnip users
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },    -- LSP completions
          { name = 'buffer' },      -- Buffer completions
          { name = 'path' },        -- Path completions
        }),
      })
    end,
  },
}

