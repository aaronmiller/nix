{ pkgs, ... }:

{
  environment.shellAliases = {
    code = "cd $CODE_DIR";
    devtools = "cd $DEVTOOLS_DIR";
    dotfiles = "cd $DOTFILES_DIR";
    groot = ''git rev-parse --show-toplevel >/dev/null 2>&1 && cd "$(git rev-parse --show-toplevel)"'';
  };
}
