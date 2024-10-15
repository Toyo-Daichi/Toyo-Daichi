# プラグイン一覧

### プラグインマネージャー
- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
  - プラグインマネージャー
  - 使い方
  ```
  On VimCommand
  :PackerSync
  ```

### IDE
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  -  LSのインストールを簡単にしてくれるプラグイン
  - 使い方
  ```
  On VimCommand
  :Mason
  ```
  
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - masonでinstallした設定を自動化するプラグイン
  - 使い方  
  記述しておくと、勝手にinstall/setupが始まる
  - depends on plugin
    - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    - LSP (Language Server Protocol)、LSと通信するためのプラグイン

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - VimModeステータスを表示するステータス
  - depends on plugin
    - [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
    - nvim上で表現されるアイコン

- [mbbill/undotree](https://github.com/mbbill/undotree)
  - 閉じるまでのファイル変化を追うプラグイン
  - 使い方
  ```
  On VimCommand
  <space> "/" // カスタム設定、Tree構造の変化が見れる
  ```
  - depends on plugin
    - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

- [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
  - masonでinstallしたlinterやfomatterの設定をしそれらを動かすためのプラグイン
  - depends on plugin
    - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
    - 非同期通信プラグイン

- [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
  - 変数の定義元へのjumpや、docのhover、変数・関数のrenameなど、built-in LSPが本来もつ機能をより手軽に使えるようにしてくれるプラグイン
  - depends on plugin
      - 'nvim-tree/nvim-web-devicons',   
      - 'nvim-treesitter/nvim-treesitter'
        - `syntax on`以上のカラースキームを用意

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - LSP単独では補完機能がないので、補完エンジンプラグイン
  - related plugin
    - [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
      - 変数や関数の補完
    - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
      - bufferに出てくる単語を補完
    - [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
      - ファイルやディレクトリのpathを補完
    - [lspkind](https://github.com/onsails/lspkind.nvim)
      - 補完画面でのアイコン搭載

### ファイル管理
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
  - `vi`を起動すると、ツリー上のディレクトリを展開できるプラグイン
  - 使い方
  ```
  On VimCommand
  :NvimTreeOpen
  ```
  - depends on plugin
    - [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - ファイル一覧や文字列でファイル間を検索できるプラグイン
  - 使い方
  ```
  On VimCommand
  <space> FF // カスタム設定、ファイル検索
  <space> FG // カスタム設定、ファイル内の文字列検索
  ```
  - depends on plugin
    - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
  - 頻出で使うファイルをあらかじめリストアップしておくプラグイン
  - 使い方
  ```
  On VimCommand
  <space> a // カスタム設定、現状ファイルのリストアップ
  <Ctrl> e // カスタム設定、保存ファイルのリスト
  ```
  - depends on plugin
    - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
   





