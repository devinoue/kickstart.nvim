-- lua/custom/lua/floating-ime.lua

-- IMEの状態を取得する関数
local function get_ime_status()
  -- im-selectを使って現在のIMEの状態を取得
  local handle = io.popen 'im-select'
  local result = handle:read '*a'
  handle:close()

  -- 結果文字列から末尾の改行文字を削除
  result = result:gsub('\n$', '')

  -- IMEの状態に基づいて表示を切り替える
  if result == 'com.apple.keylayout.ABC' then
    return '_A'
  elseif result == 'com.google.inputmethod.Japanese.base' then
    return 'あ'
  else
    return '[Unknown]'
  end
end

-- フローティングウィンドウIDを保持する変数
local floating_win = nil
-- 前回の更新時刻を保持する変数
local last_update_time = vim.loop.hrtime()

-- 更新の間隔をミリ秒単位で指定（ここでは100ms）
local update_interval = 100 * 1000000 -- 100ms = 100 * 1e6 nanoseconds

-- Floating Windowを作成または更新する関数
local function show_ime_status()
  local current_time = vim.loop.hrtime()

  -- 一定時間経過していなければ更新しない
  if current_time - last_update_time < update_interval then
    return
  end

  -- IMEの状態を取得
  local ime_status = get_ime_status()

  -- フローティングウィンドウが既に存在する場合は削除
  if floating_win and vim.api.nvim_win_is_valid(floating_win) then
    vim.api.nvim_win_close(floating_win, true)
  end

  -- ウィンドウのバッファを作成
  local buf = vim.api.nvim_create_buf(false, true)

  -- バッファにIMEの状態を表示
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { ime_status })

  -- カーソル位置を取得
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- Floating Windowの設定
  local opts = {
    relative = 'cursor',
    row = 1, -- カーソルの下に表示
    col = 0, -- カーソルの列と同じ
    width = 3, -- ウィンドウの幅
    height = 1, -- ウィンドウの高さ
    style = 'minimal',
    border = 'rounded', -- ウィンドウに枠をつける
    focusable = false, -- フォーカスを持たせない
  }

  -- 新しいフローティングウィンドウを作成
  floating_win = vim.api.nvim_open_win(buf, false, opts)

  -- 最後の更新時刻を更新
  last_update_time = current_time
end

-- カーソルが移動するたびにFloating Windowを更新するが、間引きする
vim.api.nvim_create_autocmd('CursorMoved', {
  callback = function()
    show_ime_status()
  end,
})
