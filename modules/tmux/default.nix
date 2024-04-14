{ lib, config, pkgs, ... }: {

  imports = [
  ];

  options = {
  };

  config  = {
    programs.tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      clock24 = false; # default
      customPaneNavigationAndResize = false; # default
      disableConfirmationPrompt = false; # default
      escapeTime = 0;
      extraConfig = /* bash */ ''
        # sane pane split commands
        bind \\ split-window -h
        bind - split-window -v
        unbind '"'
        unbind %

        # switch panes using Alt-arrow without prefix
        bind h select-pane -L
        bind l select-pane -R
        bind k select-pane -U
        bind j select-pane -D

        set -g status off

        # get true colors in tmux https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
        set -g default-terminal "tmux-256color"
        set -ag terminal-overrides ",xterm-256color:RGB"
      '';
      historyLimit = 5000;
      keyMode = "vi";
      mouse = true;
      newSession = false; # default
      plugins = with pkgs.tmuxPlugins; [
        onedark-theme
      ];
      prefix = "M-a";
      resizeAmount = 5; # default
      reverseSplit = false; # default
      secureSocket = true; # default
      sensibleOnTop = true; # default
      shell = null; # default
      #terminal = "xterm-256color";
      tmuxinator.enable = false; # default
      tmuxp.enable = false; # default
    };
  };
}
