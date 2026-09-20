#!/usr/bin/env bash
# dotfiles を $HOME に symlink で配置する (macOS / Ubuntu 共通)
#
#   ./install.sh            配置する
#   ./install.sh --dry-run  何が起きるかだけ表示する
#
# - 既にリンク済みのものは何もしない
# - 既存のファイルは ~/.dotfiles_backup/<日時>/ に退避してからリンクする
# - editor/nvim は対象外 (別途 ~/.config/nvim に配置する)

set -eu

DRY_RUN=0
case "${1:-}" in
  "") ;;
  -n | --dry-run) DRY_RUN=1 ;;
  -h | --help)
    sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'
    exit 0
    ;;
  *)
    echo "usage: $0 [--dry-run]" >&2
    exit 1
    ;;
esac

REPO="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles_backup/$(date +%Y%m%d-%H%M%S)"

# リポジトリ内のパス:配置先
LINKS=(
  "sh/zshrc:$HOME/.zshrc"
  "sh/bashrc:$HOME/.bashrc"
  "sh/aliases:$HOME/.aliases"
  "tmux/tmux.conf:$HOME/.tmux.conf"
  "editor/vim/vimrc:$HOME/.vimrc"
  "prompt/oh-my-zsh/p10k.zsh:$HOME/.p10k.zsh"
)

run() {
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  (dry-run) $*"
  else
    "$@"
  fi
}

backed_up=0
for entry in "${LINKS[@]}"; do
  src="$REPO/${entry%%:*}"
  dest="${entry#*:}"

  if [ ! -e "$src" ]; then
    echo "skip   $dest (リポジトリに $src がありません)"
    continue
  fi

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok     $dest"
    continue
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "backup $dest -> $BACKUP/"
    run mkdir -p "$BACKUP"
    run mv "$dest" "$BACKUP/"
    backed_up=1
  fi

  echo "link   $dest -> $src"
  run mkdir -p "$(dirname "$dest")"
  run ln -s "$src" "$dest"
done

# マシン固有の設定用。リンクではなくコピーし、既にあれば触らない
if [ ! -e "$HOME/.zshrc.local" ]; then
  echo "copy   $HOME/.zshrc.local (from sh/zshrc.local.example)"
  run cp "$REPO/sh/zshrc.local.example" "$HOME/.zshrc.local"
fi

echo
if [ "$DRY_RUN" -eq 1 ]; then
  echo "dry-run のため、何も変更していません。"
  exit 0
fi
echo "完了。"
if [ "$backed_up" -eq 1 ]; then
  echo "退避した元ファイルは $BACKUP にあります。"
  echo "元の .zshrc にあったマシン固有の設定 (PATH など) は ~/.zshrc.local に移してください。"
fi
echo "反映するには: exec zsh"
