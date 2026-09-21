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
- [ripgrep](https://github.com/BurntSushi/ripgrep) (`<leader>fg` の live grep と `<leader>ps` に必要。`rg` が PATH に無いとエラーになる)
  - `brew install ripgrep`。bottle が無い環境では tree-sitter CLI と同様にソースビルドになるので、リリースのバイナリを PATH に置く。
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

有効にしている LSP サーバー: `lua_ls` `bashls` `ts_ls` `eslint` `gopls` `terraformls` `jdtls` `pyright` `rust_analyzer`

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
| `<C-p>` | git 管理下のファイルを検索 (git 管理外のディレクトリでは `<leader>ff` と同じ動作) |
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

## ユースケース

### 補完 (nvim-cmp) の使い方

入力すると、補完メニューが自動で出る (AI 以外)。候補は 4 つのソースから集まり、右端のラベルで出どころが分かる。
左のアイコンは種別 (関数、変数、ファイルなど)。

| ラベル | 出どころ | 出るとき |
|---|---|---|
| `[AI]` | minuet-ai (Gemini) | `<A-y>` を押したとき。自動表示は無料枠を使い切りやすいので既定でオフ (`:Minuet cmp toggle` でオン)。候補は 1 つで、複数行のことがある |
| `[LSP]` | 言語サーバー | 関数、変数、型、メソッドなど。言語サーバーが付いているファイルで出る |
| `[Path]` | ファイルパス | `./` や `/` を打った後 |
| `[Buf]` | 開いているバッファの単語 | 同じファイル内の変数名などを打ち始めたとき |

**候補の採用の流れ**: `<C-n>` / `<C-p>` (または `↑` `↓`) で選んでから、`<CR>` (または `<C-y>`) で確定する。
何も選んでいない状態の `<CR>` は、確定ではなく普通の改行になる。`<Tab>` は割り当てていない。

| やりたいこと | 操作 |
|---|---|
| 関数名やメソッドを補完したい | そのまま入力を続ける。`[LSP]` の候補が出るので、`<C-n>` で選んで `<CR>` |
| 続きのコードを AI に書かせたい | コメントか関数のシグネチャを書いて `<A-y>`。`[AI]` の候補を選んで確定 |
| メニューが出ていない / 閉じてしまった | `<C-Space>` で手動で開く |
| メニューが邪魔 | `<C-e>` で閉じる (入力した文字は残る) |
| AI の自動表示を切り替えたい | `:Minuet cmp toggle` (既定はオフ)。オフでも `<A-y>` で手動の AI 補完は使える |
| ファイルパスを入力したい | `./src/` のように打つと `[Path]` の候補が出る |
| 同じファイルの変数名を再利用したい | 先頭を数文字打つと `[Buf]` の候補が出る |

**候補が出ないとき**: 1) `<C-Space>` を押す。2) `[LSP]` が出ないなら、ステータスラインの LSP 名を見る
(`No Active Lsp` なら言語サーバーが付いていない。`:checkhealth vim.lsp`)。
3) `[AI]` が出ないなら、`echo $GEMINI_API_KEY` でキーを確認し、無料枠のレート制限にかかっていないかも疑う。

### そのほかのプラグイン

| やりたいこと | 使うもの | 操作 |
|---|---|---|
| プロジェクトの構造を見たい、ファイルを作る・消す・名前を変える | nvim-tree | `<C-e>` で開き、ツリー内で `a` (作成。末尾 `/` でディレクトリ)、`d` (削除)、`r` (名前変更)、`H` (ドットファイルの表示切替)、`W` (全て閉じる)、`<Tab>` (プレビュー)、`<C-v>` / `<C-x>` (分割して開く)、`g?` (キー一覧)。`<C-q>` で閉じる |
| ファイル名をうろ覚えで開きたい | telescope | `<leader>ff` |
| この文字列はどこで使われている? | telescope | `<leader>fg` (入力しながら絞り込み)。ripgrep が必要 |
| git 管理下のファイルだけから探したい | telescope | `<C-p>` |
| 特定の文字列を一度だけ grep したい | telescope | `<leader>ps` で入力。ripgrep が必要 |
| 検索結果の操作 | telescope | `<C-n>` / `<C-p>` で移動、`<CR>` で開く、`<C-v>` / `<C-x>` で分割して開く、`<Esc>` で閉じる |
| 定義や使用箇所を見たい | LSP | `gd` (定義)、`gr` (参照一覧)、`gI` (実装)、`gT` (型定義)、`K` (説明) |
| 名前を全体で変えたい | LSP | `gn` |
| エラーの内容を読みたい | LSP | `ge` (詳細)、`g]` / `g[` (次 / 前のエラー) |
| import の追加や自動修正をしたい | LSP | `ga` |
| 整形したい | LSP | `gf` |
| どの行を変更したか確認したい | gitsigns | 左端に色が付く。詳細は `:Gitsigns preview_hunk`、戻すのは `:Gitsigns reset_hunk`、次の変更へは `:Gitsigns nav_hunk next` |
| この行を誰が書いたか知りたい | gitsigns | `:Gitsigns blame_line`。全行に常時表示するなら `:Gitsigns toggle_current_line_blame` |
| さっきの編集に戻りたい | undotree | `<leader>/` (Neovim 標準。編集の分岐を辿れる) |
| 今いるブロックの範囲を見たい | hlchunk | 自動 (カーソル位置のブロックとインデント線が強調される) |
| LSP の起動やインデックスの進み具合を知りたい | fidget | 自動 (右下に進捗が出る) |
| Markdown を整形して読みたい | render-markdown | 自動。切り替えは `:RenderMarkdown toggle` |
| 新しい言語の LSP を追加したい | mason | `:Mason` で確認し、`lua/config/lsp.lua` の `ensure_installed` に追加する |
| 新しい言語の色 (パーサー) を追加したい | nvim-treesitter | `:TSInstall <言語>`。色がおかしいときは `:TSUpdate` |
| 現在のモードや診断の数を見たい | lualine | 自動 (下部のステータスライン。相対パス、診断、LSP 名、branch、diff を表示) |

gitsigns は、キーマップを設定していない (コマンドで使う)。

## AI 補完 (minuet-ai)

`<A-y>` を押すと、補完メニューに Gemini の候補が並ぶ。LSP の候補も同じメニューに出る。
自動表示は、無料枠のクォータを使い切りやすいので既定でオフにしている (`cmp.enable_auto_complete = false`)。

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

うまく動かないときは、`lua/config/minuet.lua` に `notify = 'debug'` を足して、詳しい通知を出す。
自動表示のオン / オフは `:Minuet cmp toggle`、モデルの切り替えは `:Minuet change_model`。
AI 補完を止めたいときは、設定をコメントアウトせず自動表示をオフのままにする。`plugins/minuet.lua` が `nil` を返すと lazy.nvim が起動時にエラーを出し、`nvim-cmp` の依存 (`plugins/cmp.lua`) や `config/cmp.lua` にも minuet が残っている。

## 補足

- **`background` の自動判定を止めている** (`base.lua`)。Neovim は端末の背景色から `background` を自動で決める。
  返事が遅れると dark に切り替わって dayfox が外れ、色が崩れることがあったため。
- ヘルスチェックの `lazy` に luarocks の警告が出るが、luarocks を使うプラグインは無いので無視してよい。
