-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

require 'custom.plugins.keymaps'
require 'custom.lua.set-current-directory'
require 'custom.lua.knowx'

vim.o.wrap = true
vim.o.linebreak = true
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'
vim.opt.whichwrap:append '<,>,[,],h,l'
vim.o.showbreak = '↪'

vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8'

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

vim.api.nvim_command 'highlight IME_Japanese guifg=#f7768e'
vim.api.nvim_command 'highlight IME_Roman guifg=#9ece6a'

vim.keymap.set('n', '<leader>ti', function()
  require('custom.lua.imselect').toggle_ime_display()
end)

-- 他のプラグイン設定の後に追加
-- require 'custom.lua.floating-ime'0

return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use
  'christoomey/vim-tmux-navigator', -- tmux & split window navigation
}
