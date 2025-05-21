# プラグイン一覧

### プラグインマネージャー
- [Lazy](https://github.com/folke/lazy.nvim)
  - プラグインマネージャー
  - 使い方
  ```bash
  :Lazy
  ```
  
### 各種プラグイン
```bash
|-- cmp.lua
|-- comment.lua
|-- fidget.lua
|-- gitsigns.lua
|-- guard.lua
|-- icon.lua
|-- indent-blackline.lua
|-- lsp.lua
|-- lualine.lua
|-- nightfox.lua
|-- noice.lua
|-- nvim-tree.lua
|-- nvim-treesitter.lua
|-- scrollbar.lua
|-- telescope.lua
`-- undotree.lua
```

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - 補完プラグイン

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
  - コメントアウトを扱うプラグイン
  - 使い方
  ```bash
  :gcc # line
  :gbc # block
  ```
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
  - LSP通信のステータスを分かりやすくしてくれるプラグイン

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - 各コードのGitStatusを提示してくれるプラグイン

- [nvimdev/guard.nvim](https://github.com/nvimdev/guard.nvim)
  - formatterとLinterのプラグイン

- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
  - 各プラグインで使われるアイコン表記のプラグイン
  - 前提 : NerdFontが入っていること

- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  - インデントを表現するプラグイン

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  -  LSのインストールを簡単にしてくれるプラグイン
  - 使い方
  ```
  :Mason
  ```
  
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - masonでinstallした設定を自動化するプラグイン
  - 使い方 : 記述しておくと、勝手にinstall/setupが始まる

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - VimModeステータスを表示するステータス

- [EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)
  - カラースキームのプラグイン

- [folke/noice.nvim](https://github.com/folke/noice.nvim)
  - VimCommandsや通知をリッチにするプラグイン

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
  - `vi`を起動すると、ツリー上のディレクトリを展開できるプラグイン
  - 使い方
  ```bash
  <Ctrl-e> # Open
  <Ctrl-q> # Close
  ```

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - syntaxを言語レベルで判明して表現するプラグイン 

- [petertriho/nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
  - スクロールバーを提示するプラグイン

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - ファイル一覧や文字列でファイル間を検索できるプラグイン
  - 使い方
  ```bash
  <space> ff # カスタム設定、ファイル検索
  <space> fg # カスタム設定、ファイル内の文字列検索
  ```

- [mbbill/undotree](https://github.com/mbbill/undotree)
  - 閉じるまでのファイル変化を追うプラグイン
  - 使い方
  ```
  <space> "/" # カスタム設定、Tree構造の変化が見れる
  ```