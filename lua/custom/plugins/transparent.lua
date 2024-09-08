return {
    'xiyaowong/transparent.nvim',
    lazy = false, -- 遅延読み込みを無効化
    priority = 1000, -- 可能な限り早く読み込む
    config = function()
        require("transparent").setup({
            enable = true, -- 起動時に透明化を有効にする
            extra_groups = { -- 透明化を適用したいグループを追加
                "Normal",
                "NormalNC",
                "Comment",
                "LineNr",
                "Folded",
                "NonText",
                "SpecialKey",
                "VertSplit",
                "SignColumn",
                "EndOfBuffer",
                "NeoTreeNormal", -- Neo-treeの通常表示
                "NeoTreeNormalNC", -- Neo-treeの非アクティブ時表示
            },
            exclude = {}, -- 透明化したくないグループをここに追加
        })
    end
}