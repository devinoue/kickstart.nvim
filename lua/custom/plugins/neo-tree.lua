return {
  'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = 'open_current',
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true, -- デフォルトで隠されているかどうか
        show_hidden_count = true,
        hide_dotfiles = false, -- dotfileを隠すかどうか
        hide_gitignored = false, -- gitignoreされているファイルを隠すかどうか
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
  },
      config = function()
      require('neo-tree').setup({
        -- Neo-treeの設定をここに追加
      })

      -- キーマップを設定
      vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
    end,
}
