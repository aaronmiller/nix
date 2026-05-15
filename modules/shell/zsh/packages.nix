{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.oh-my-zsh
    pkgs.zsh-powerlevel10k
  ];
}
