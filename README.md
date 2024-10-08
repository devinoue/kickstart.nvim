# kickstart.nvim

## Introduction

[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)の folk リポジトリです。

kickstart のコアになる`lua/kickstart`以下はあまり変更せず、`lua/custom`以下に個人的に必要なプラグインを追加しています。

## 方針

Neovim は、Vim エディタをベースにした強力で拡張性の高いテキストエディタです。豊富なプラグインが存在し、Lua スクリプトを使って機能をカスタマイズできます。その反面、プラグインの更新が散漫に解決されており、使用し続けるための維持コストの高さが問題となります。

そのコストの高い部分は kickstart の更新に任せ、GitHub 経由で sync folk で維持し、自分がどうしても使いたい範囲だけ自分の手で更新を維持するようにしています。

## キーマップ

キーマップの変更は`lua/custom/plugins/keymap.lua`で行っています。

## 設定

その他の一般的な設定は`lua/custom/plugins/init.lua`で追加しています。
