-- 初期状態ではステータスラインへのIMEの表示
vim.g.show_ime_status = true

-- モジュールの初期化
-- このモジュールにはIMEの状態を操作・取得する関数
local M = {}

-- IME表示のトグル機能。ステータスラインのIME表示を切り替える
M.toggle_ime_display = function()
  -- IMEのステータスをトグルする
  vim.g.show_ime_status = not vim.g.show_ime_status
  -- ステータスライン再描画して変更をすぐに反映
  vim.cmd 'redrawstatus'
end

-- 現在のIMEの入力方法（例：日本語、ローマ字）を
-- ステータスライン用の文字列として返す関数
-- imselect.lua の修正
M.input_method = function()
  if not vim.g.show_ime_status then
    return ''
  end

  -- im-selectを使って現在のIMEの状態を取得
  local handle = io.popen 'im-select'
  local result = handle:read '*a'
  handle:close()

  -- 結果文字列から末尾の改行文字を削除
  result = result:gsub('\n$', '')

  -- 結果が "com.apple.keylayout.ABC" なら英数入力、それ以外は日本語入力として表示
  if result == 'com.apple.keylayout.ABC' then
    return ' ' .. '%#IME_Roman#[' .. '_A' .. ']%*'
  elseif result == 'com.google.inputmethod.Japanese.base' then
    return ' ' .. '%#IME_Japanese#[' .. 'あ' .. ']%*'
  else
    return '[Unknown]'
  end
end

-- モジュールを返す
return M
