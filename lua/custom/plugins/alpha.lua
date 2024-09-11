return {
  'goolord/alpha-nvim', -- プラグインの名前
  event = 'VimEnter', -- Vimが起動したときにプラグインを読み込むイベント
  config = function()
    local alpha = require 'alpha' -- alphaモジュールを読み込む
    local dashboard = require 'alpha.themes.dashboard' -- alphaのダッシュボードテーマを読み込む

    -- ヘッダーを設定
    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    -- メニューを設定
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'), -- 新しいファイルを作成
      dashboard.button('SPC ee', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'), -- ファイルエクスプローラーを切り替え
      dashboard.button('SPC ff', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'), -- ファイルを検索
      dashboard.button('SPC fs', '  > Find Word', '<cmd>Telescope live_grep<CR>'), -- 単語を検索
      dashboard.button('SPC wr', '󰁯  > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'), -- 現在のディレクトリのセッションを復元
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'), -- NVIMを終了
    }

    -- 設定をalphaに送信
    alpha.setup(dashboard.opts)

    -- alphaバッファでの折りたたみを無効にする
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
