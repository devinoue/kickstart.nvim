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

return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use
  'christoomey/vim-tmux-navigator', -- tmux & split window navigation
}
