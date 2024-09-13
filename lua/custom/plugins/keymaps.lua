vim.g.mapleader = ' '

local keymap = vim.keymap -- for consiseness

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- 数字のインクリメント・デクリメント
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- increment
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- ノーマルモードでの設定
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

-- インサートモードでの設定
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- URLを開く(gxの代わりにmaOsのopenで)
vim.api.nvim_set_keymap('n', 'gx', [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], { noremap = true, silent = true })

-- ノーマルモードでの上下移動を画面上の行単位に
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true, silent = true })

-- ビジュアルモードでの上下移動を画面上の行単位に
vim.api.nvim_set_keymap('v', '<Up>', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>', 'gj', { noremap = true, silent = true })

-- insertモードでの上下移動の行単位で行うのは不可能

-- 改行時に次の行の行頭に移動
vim.keymap.set('i', '<CR>', '<CR><C-o>^', { noremap = true, silent = true })

-- インサートモードでcmd+sで保存
vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- ノーマルモードでcmd+zで戻る
vim.keymap.set('n', '<D-z>', 'u', { noremap = true, silent = true })

-- インサートモードでcmd+zで戻る
vim.keymap.set('i', '<D-z>', '<C-o>u', { noremap = true, silent = true })

-- ビジュアルモードでcmd+zで戻る
vim.keymap.set('v', '<D-z>', '<Esc>u', { noremap = true, silent = true })

return {}
