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
    - 非同期通信プラグイン

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
   





