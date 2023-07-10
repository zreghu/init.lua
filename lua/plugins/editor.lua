return {
  { "nvim-telescope/telescope.nvim", tag = "0.1.2", dependencies = { "nvim-lua/plenary.nvim" }},
  { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = {} },
  { "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
      options = { theme = 'palenight' },
      sections = {
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            symbols = {
              error = ' ', -- xf659
              warn = ' ', -- xf529
              info = ' ', -- xf7fc
              hint = ' ', -- xf835
            }
          }
        }
      }
    }
  },
  { "ahmedkhalf/project.nvim", lazy = false, opts = {},
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require"project_nvim".setup{}
      require"telescope".load_extension('projects')
    end
  },
  { "akinsho/toggleterm.nvim", version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      open_mapping = [[<C-t>]],
      direction = 'float'
    }
  },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", opts = {} },
  { "folke/zen-mode.nvim",
    opts = {
    window = {
        height = 0.9,
      },
      on_open = function()
        vim.cmd[[Limelight]]
      end,
      on_close = function()
        vim.cmd[[Limelight!]]
      end,
      }
  },
  { "junegunn/limelight.vim" },
	{ "folke/tokyonight.nvim" },
}
