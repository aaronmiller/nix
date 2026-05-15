{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.btop
    pkgs.cacert
    pkgs.coreutils
    pkgs.curl
    pkgs.devenv
    pkgs.direnv
    pkgs.fd
    pkgs.fzf
    pkgs.ghostty-bin
    pkgs.git
    pkgs.gnupg
    pkgs.gnutls
    pkgs.ipcalc
    pkgs.jq
    pkgs.keychain
    pkgs.nix-direnv
    pkgs.nmap
    pkgs.pkg-config
    pkgs.pwgen
    pkgs.ripgrep
    pkgs.stow
    pkgs.subnetcalc
    pkgs.tree
    pkgs.tree-sitter
    pkgs.typst
    pkgs.vim
    pkgs.watchexec
    pkgs.yq-go
  ];
}
