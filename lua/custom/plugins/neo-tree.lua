return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_current',
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false, -- ドットファイルを表示
          hide_gitignored = false,
          hide_by_name = {
            'node_modules',
            'thumbs.db',
          },
          never_show = {
            '.git',
            '.DS_Store',
            '.history',
          },
        },
      },
    }
    -- キーマップ設定
    vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end,
}
