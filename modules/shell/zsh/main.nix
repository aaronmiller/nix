{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableFzfCompletion = true;
    enableFzfHistory = true;
    enableSyntaxHighlighting = true;
    histSize = 10000;

    interactiveShellInit = ''
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

      ZSH_TMUX_AUTOSTART=true

      plugins+=(
        alias-finder
        aliases
        brew
        git
        tmux
      )

      source $ZSH/oh-my-zsh.sh

      ${builtins.readFile ./static/functions.zsh}
      ${builtins.readFile ./static/hooks.zsh}

      unalias ls 2>/dev/null
      alias ls='ls --color=auto'
    '';

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
