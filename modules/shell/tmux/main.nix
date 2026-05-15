{ pkgs, ... }:

let
  current-pane-hostname = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "current-pane-hostname";
    version = "latest";
    src = pkgs.fetchFromGitHub {
      owner = "soyuka";
      repo = "tmux-current-pane-hostname";
      rev = "master";
      sha256 = "sha256-t5jRUvwiwym6f7vfKD/D0Vu1UXpxRMCLNyBbY0nZciw=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    enableMouse = true;
    enableSensible = true;
    enableVim = true;

    extraConfig = ''
      # Plugins
      run-shell ${pkgs.tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux
      run-shell ${pkgs.tmuxPlugins.nord}/share/tmux-plugins/nord/nord.tmux

      # Shell Configuration
      set -g default-shell "${pkgs.zsh}/bin/zsh"

      # QoL Settings
      set -g set-clipboard on
      set -g history-limit 10000
      set-window-option -g pane-base-index 1
      set-window-option -g pane-border-status bottom
      set-window-option -g pane-border-format ""

      # Custom Keybindings
      bind-key l choose-tree -Zsw
      bind-key w kill-pane
      bind -r "," swap-window -d -t -1
      bind -r "." swap-window -d -t +1
      bind -r C-k clear-history
      bind -r O select-pane -t -1

      set -g status-left-length 20
      set -g status-left "#[fg=black,bg=cyan,bold] #S #[fg=cyan,bg=black]"

      set -g status-right-length 150
      set -g status-right "#[fg=cyan,bg=black]#[fg=black,bg=cyan] ϟ #(pmset -g batt | awk '/InternalBattery/ {print $3}' | tr -d ';') #[fg=black,bg=cyan]#[fg=cyan,bg=black]#[fg=black,bg=cyan] %Y-%m-%d #[fg=black,bg=cyan] %H:%M:%S #[fg=black,bg=cyan]#[fg=cyan,bg=black]#[fg=black,bg=cyan,bold] #H "

      set -g window-status-separator ""
      set -g window-status-format "#[fg=black,bg=#5a7eae] #I  #W #F #[fg=#5a7eae,bg=black]"
      set -g window-status-current-format "#[fg=black,bg=cyan] #I  #W #F #[fg=cyan,bg=black]"

      # Current Pane Hostname Plugin
      run-shell ${current-pane-hostname}/share/tmux-plugins/current-pane-hostname/current_pane_hostname.tmux
    '';
  };
}
