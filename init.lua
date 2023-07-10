---------- SETTINGS --------
-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','         -- remap leader to comma ',' key

require('lazy').setup("plugins", {
  ui = {
    icons = {
      lazy = "⋰  "
    }
  }
})
require('lsp')

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true      -- smart context-based indentation
vim.o.tabstop = 4             -- 1 tab = 4 spaces
vim.o.shiftwidth = 4          -- autoindentation rule
vim.o.expandtab = true        -- expand tab to spaces

-- Set indentation by filetype
vim.cmd[[autocmd Filetype html setlocal ts=2 sw=2 expandtab]]
vim.cmd[[autocmd Filetype lua setlocal ts=2 sw=2 expandtab]]

-- Editor Settings
vim.o.number = true           -- see line numbers in gutter on the left
vim.opt.termguicolors = true
vim.cmd[[set textwidth=120]]  -- set text width to 120
vim.cmd[[colorscheme tokyonight-storm]] -- set editor colorscheme

-- Fancy Diagnostic Icons
local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = ""
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

---------- SHORTCUTS -------
vim.keymap.set('t', "<Esc>", "<C-\\><C-N>", {silent = true, noremap = true}) -- Exit terminal mode with ESC

-- Buffer Navigation
vim.keymap.set('n', 'gn', ':bnext<cr>', {})
vim.keymap.set('n', 'gN', ':bprev<cr>', {})

-- Split Navigation
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { silent = true, noremap = true })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { silent = true, noremap = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', require('telescope').extensions.projects.projects, {})

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})

-- ToggleTerm: <C-t> opens terminal in float mode

-- Zen mode
vim.keymap.set('n', '<leader>zz', '<cmd>ZenMode<cr>', {})

