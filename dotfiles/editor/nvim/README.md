# nvim

Neovim の設定。プラグインマネージャーは [lazy.nvim](https://github.com/folke/lazy.nvim)。
動作確認は Neovim 0.12.5 (LSP は `vim.lsp.config` / `vim.lsp.enable` を使うので 0.11 以上が必要)。

## 前提

- Neovim 0.11 以上 (0.12 推奨)
- `git`、`make`、C コンパイラ (telescope-fzf-native と treesitter のパーサーのビルドに使う)
- [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/releases) 0.26.1 以上 (treesitter のパーサーのビルドに使う)
  - `brew install tree-sitter-cli`。ただし bottle が無い環境 (Intel Mac など) では Rust と LLVM をソースビルドして非常に長くなる。
    その場合は、リリースのバイナリを `~/.local/bin` に置く。
    ```bash
    curl -fsSL https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-macos-x64.gz | gunzip > ~/.local/bin/tree-sitter
    chmod +x ~/.local/bin/tree-sitter
    ```
    (Apple Silicon は `macos-arm64`、Linux は `linux-x64` など。ファイル名はリリースページで確認する)
- Nerd Font (アイコンとステータスラインの表示に使う)
- LSP サーバーは初回起動時に mason が入れる。パッケージによって `npm` や `go` が必要になる
- AI 補完を使う場合は Gemini の API キー (後述)

## 配置

`install.sh` の対象外なので、手動で symlink を張る。

```bash
ln -s "$(pwd)" ~/.config/nvim   # このディレクトリで実行
nvim                            # 初回起動でプラグインが入る
```

`lazy-lock.json` でプラグインのバージョンを固定している。更新は `:Lazy update`。

## 構成

```
.
├── init.lua              # lazy.nvim の bootstrap と読み込み
├── lazy-lock.json
└── lua
    ├── base.lua          # 基本オプションとペイン操作のキーマップ
    ├── plugins/*.lua     # プラグインの spec (何を入れるか)
    └── config/*.lua      # プラグインの設定 (どう使うか)
```

`plugins/foo.lua` から `config/foo.lua` を `require` する 1 対 1 の構成。

## プラグイン

| プラグイン | 役割 |
|---|---|
| [nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) | カラースキーム (`dayfox`) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | ステータスライン (Eviline 形式。色は dayfox のパレット) |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | ファイルツリー。引数なしで起動すると自動で開く |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ファイル検索と grep (fzf-native 付き) |
| [mason.nvim](https://github.com/mason-org/mason.nvim) / [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) / [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP サーバーの導入と有効化 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) / [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) / [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) / [cmp-path](https://github.com/hrsh7th/cmp-path) | 補完メニュー (AI、LSP、パス、バッファの候補) |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | 補完メニューのアイコンと、候補の出どころのラベル (`[AI]` `[LSP]` `[Path]` `[Buf]`) |
| [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) | AI 補完 (Gemini の無料枠) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | treesitter のパーサーの導入 (ハイライト自体は Neovim 標準) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | 変更行を左端に表示 |
| [hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim) | カーソル位置のブロックとインデント線を強調 |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | LSP の進捗表示 |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown の描画 |

有効にしている LSP サーバー: `lua_ls` `bashls` `ts_ls` `eslint` `gopls` `terraformls` `pyright` `rust_analyzer`

treesitter のパーサー: `bash` `go` `hcl` `javascript` `json` `python` `rust` `terraform` `tsx` `typescript` `yaml`
(`c` `lua` `vim` `vimdoc` `query` `markdown` `markdown_inline` は Neovim に同梱されている)。
初回起動時に自動でビルドされる。パーサーが無いファイルタイプは、従来のシンタックスハイライトのまま。

## キーマップ

leader は `Space`。

### ペイン (`base.lua`)

| キー | 動作 |
|---|---|
| `<leader>-` / `<leader>\` | 水平 / 垂直に分割 |
| `<leader>w` | 次のペインへ移動 |
| `<leader>r` / `<leader>l` | 幅を狭く / 広く |
| `<leader>u` / `<leader>b` | 高さを広く / 狭く |

### Undo ツリー (`base.lua`)

| キー | 動作 |
|---|---|
| `<leader>/` | Neovim 標準の `nvim.undotree` を開く |

### ファイルツリー

| キー | 動作 |
|---|---|
| `<C-e>` | 開く |
| `<C-q>` | 閉じる |

### 検索 (telescope)

| キー | 動作 |
|---|---|
| `<leader>ff` | ファイル名で検索 |
| `<leader>fg` | 文字列で検索 (live grep) |
| `<C-p>` | git 管理下のファイルを検索 |
| `<leader>ps` | 入力した文字列を grep |

### LSP

| キー | 動作 |
|---|---|
| `K` | hover |
| `gd` / `gD` | 定義 / 宣言へ移動 |
| `gr` | 参照一覧 |
| `gI` / `gT` | 実装 / 型定義へ移動 |
| `gn` | リネーム |
| `ga` | コードアクション |
| `gf` | フォーマット (Vim 標準の `gf` を上書きしている) |
| `ge` | 診断をフロート表示 |
| `g]` / `g[` | 次 / 前の診断へ移動 |

### 補完 (nvim-cmp)

| キー | 動作 |
|---|---|
| `<C-n>` / `<C-p>` | 候補を選ぶ |
| `<CR>` | 選んだ候補を確定 |
| `<C-e>` | メニューを閉じる |
| `<C-Space>` | メニューを手動で開く |
| `<A-y>` | AI 補完を手動で要求する |

`<A-y>` が効かないときは、ターミナル側で Option を Meta として送る設定にする。
## AI 補完 (minuet-ai)

入力が止まると、補完メニューに Gemini の候補が並ぶ。LSP の候補も同じメニューに出る。

1. [Google AI Studio](https://aistudio.google.com/) で API キーを取る。
2. 環境変数 `GEMINI_API_KEY` に入れる。**`~/.zshrc` ではなく `~/.zshrc.local` に書く。**
   ```bash
   echo 'export GEMINI_API_KEY="..."' >> ~/.zshrc.local
   ```
   `install.sh` を使うと `~/.zshrc` はこのリポジトリの `sh/zshrc` への symlink になる。
   そこへ追記すると、キーがリポジトリに入ってしまう。
3. ターミナルを開き直して nvim を起動する。

設定は `lua/config/minuet.lua`。`api_key` にはキーそのものではなく、環境変数の名前を書く。
モデルは `gemini-3.5-flash` で、無料枠のレート制限に収まるようにリクエストを少なく小さくしている。
無料枠では、編集中のコードが Google に送られる。機密性の高いコードでは無効にすること。

うまく動かないときは `:Minuet log` を見る。

## 補足

- **`background` の自動判定を止めている** (`base.lua`)。Neovim は端末の背景色から `background` を自動で決める。
  返事が遅れると dark に切り替わって dayfox が外れ、色が崩れることがあったため。
- ヘルスチェックの `lazy` に luarocks の警告が出るが、luarocks を使うプラグインは無いので無視してよい。
