{ pkgs, ... }:

{
  environment.etc."gitconfig".text = ''
    [core]
        excludesfile = /etc/gitignore

    [init]
        defaultBranch = "main"

    [pull]
        rebase = true

    [push]
        autoSetupRemote = true
  '';

  environment.etc."gitignore".text = ''
    # macos
    .DS_Store

    # project management
    .worktrees/
  '';
}
