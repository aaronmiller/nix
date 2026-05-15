{ pkgs, ... }:

{
  environment.variables = {
    CODE_DIR = "$HOME/code";
    DEVTOOLS_DIR = "$HOME/devtools";
    DOTFILES_DIR = "$HOME/dotfiles";
    EDITOR = "vim";
    GIT_CONFIG_SYSTEM = "/etc/gitconfig";
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";
  };
}
