function do_ls() {
  printf '\033[H\033[2J'
  ls --color=auto -lah
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd do_ls
