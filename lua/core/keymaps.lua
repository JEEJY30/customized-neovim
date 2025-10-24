-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

-- Clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Tab management
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- Buffer navigation
keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- Better window navigation
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Resize windows
keymap.set('n', '<A-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
keymap.set('n', '<A-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
keymap.set('n', '<A-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap.set('n', '<A-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Stay in indent mode
keymap.set('v', '<', '<gv', { desc = 'Indent left' })
keymap.set('v', '>', '>gv', { desc = 'Indent right' })

-- Move text up and down
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move text down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move text up' })

-- Better paste
keymap.set('v', 'p', '"_dP', { desc = 'Paste without yanking' })

-- Save file
keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Quit
keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
keymap.set('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Quit all without saving' })

