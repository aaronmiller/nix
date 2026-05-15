{ pkgs, ... }:

{
  environment.systemPath = [
    "$HOME/.local/bin"
  ];
}
