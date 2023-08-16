return {
  { "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "SirVer/ultisnips",
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    opts = function()
      local cmp = require'cmp'

      require("cmp_nvim_ultisnips").setup{}

      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "ultisnippets" }
      return {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
           vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }),
          ["<S-Tab>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.jump_backwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
          ),
        }),

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'ultisnips' }, -- For ultisnips users.
        }, {
          { name = 'buffer' },
        })
      }
    end
  }
}
