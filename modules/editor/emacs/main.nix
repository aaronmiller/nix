{ pkgs, ... }:

{
  environment.systemPath = [
    "$HOME/.config/emacs/bin"
  ];
}
