-- Neovim Lua APIを使って環境変数を参照し、ファイル保存時に自動実行
local dotfiles_dir = vim.fn.getenv 'KNOWX_DIR'
local file_to_watch = dotfiles_dir .. '/knowx.md'

-- パスが正しいか確認
-- vim.notify('Watching file: ' .. file_to_watch)

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = file_to_watch,
  command = 'silent !bash ' .. dotfiles_dir .. '/scripts/auto_push.sh',
})
