# dotfiles

macOS を主体に、Ubuntu など Linux にも当てられる設定ファイル集。

## 使い方

```bash
git clone https://github.com/Toyo-Daichi/Toyo-Daichi.git
cd Toyo-Daichi/dotfiles
./install.sh --dry-run   # 何が起きるか確認
./install.sh             # symlink を張る
exec zsh
```

- 既存のファイルは `~/.dotfiles_backup/<日時>/` に退避されます。
- マシン固有の設定 (Android SDK, conda など) は `~/.zshrc.local` に書きます。初回に `sh/zshrc.local.example` がコピーされます。
- `editor/nvim` は `install.sh` の対象外です。

## 構成

| パス | 配置先 |
|---|---|
| `sh/zshrc` | `~/.zshrc` |
| `sh/bashrc` | `~/.bashrc` (zsh が使えない環境向けの最小構成) |
| `sh/aliases` | `~/.aliases` |
| `tmux/tmux.conf` | `~/.tmux.conf` |
| `editor/vim/vimrc` | `~/.vimrc` |
| `prompt/oh-my-zsh/p10k.zsh` | `~/.p10k.zsh` |

## 前提

- zsh (Ubuntu なら `sudo apt install zsh && chsh -s "$(command -v zsh)"`)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) と Nerd Font。`~/powerlevel10k` に clone すれば `zshrc` が見つけます。
  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  ```
- nvm を使う場合は `nvm alias default` を `lts/*` ではなく `vX.Y.Z` の具体的なバージョンにしておく (起動を速くするため、`zshrc` が PATH に直接通します)。
