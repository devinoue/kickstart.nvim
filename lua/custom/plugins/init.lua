-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

require 'custom.plugins.keymaps'

-- Neovim Lua APIを使って環境変数を参照し、ファイル保存時に自動実行
local dotfiles_dir = vim.fn.getenv 'KNOWX_DIR'
local file_to_watch = dotfiles_dir .. '/knowx.md'

-- パスが正しいか確認
vim.notify('Watching file: ' .. file_to_watch)

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = file_to_watch,
  command = 'silent !bash ' .. dotfiles_dir .. '/scripts/auto_push.sh',
})

-- ファイルを開いたときに前回のカーソル位置に戻る
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- インサートモードでのカーソル移動
vim.api.nvim_set_keymap('i', '<Down>', 'pumvisible() ? "<C-n>" : "<C-o>gj"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<Up>', 'pumvisible() ? "<C-p>" : "<C-o>gk"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<Left>', '<C-o>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<C-o>l', { noremap = true, silent = true })

-- 行頭での左移動で前の行末に移動
vim.api.nvim_set_keymap('i', '<Left>', 'col(".") == 1 ? "<C-o>k<End>" : "<Left>"', { noremap = true, silent = true, expr = true })

-- 行末での右移動で次の行頭に移動
vim.api.nvim_set_keymap('i', '<Right>', 'col(".") == col("$") ? "<C-o>j0" : "<Right>"', { noremap = true, silent = true, expr = true })

-- 改行時に次の行の行頭に移動
vim.api.nvim_set_keymap('i', '<CR>', '<CR><C-o>^', { noremap = true, silent = true })

-- インサートモードでcmd+sで保存
vim.api.nvim_set_keymap('i', '<D-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- ノーマルモードでcmd+zで戻る
vim.api.nvim_set_keymap('n', '<D-z>', 'u', { noremap = true, silent = true })

-- インサートモードでcmd+zで戻る
vim.api.nvim_set_keymap('i', '<D-z>', '<C-o>u', { noremap = true, silent = true })

-- ビジュアルモードでcmd+zで戻る
vim.api.nvim_set_keymap('v', '<D-z>', '<Esc>u', { noremap = true, silent = true })

-- Array of file names indicating root directory. Modify to your liking.
local root_names = { '.git', 'Makefile' }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local set_root = function()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    return
  end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then
      return
    end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })

return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use
  'christoomey/vim-tmux-navigator', -- tmux & split window navigation
}
