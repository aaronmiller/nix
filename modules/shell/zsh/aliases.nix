{ pkgs, ... }:

{
  environment.shellAliases = {
    code = "cd $CODE_DIR";
    devtools = "cd $DEVTOOLS_DIR";
    dotfiles = "cd $DOTFILES_DIR";
    groot = "cd $(git rev-parse --show-toplevel)";
  };
}
