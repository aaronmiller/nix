{ pkgs, ... }:

{
  environment.etc."gitconfig".text = ''
    [core]
        excludesfile = /etc/gitignore

    [fetch]
        prune = true

    [init]
        defaultBranch = "main"

    [pull]
        rebase = true

    [push]
        autoSetupRemote = true

    [worktree]
        useRelativePaths = true
  '';

  environment.etc."gitignore".text = ''
    # macos
    .DS_Store

    # project management
    .worktrees/
  '';
}
