{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = yank;
        extraConfig = ''
          set -g @yank_action 'copy-pipe'
        '';
      }
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-show-location false
          set -g @dracula-show-battery false
          set -g @dracula-show-left-icon "session"
          set -g @dracula-refresh-rate 30
          set -g @dracula-plugins "cpu-usage ram-usage"
          set -g @dracula-show-left-icon-colors "dark_purple dark_purple"
        '';
      }
      {
        plugin = better-mouse-mode;
        extraConfig = ''
          set-option -g mouse on
        '';
      }
    ];

    shell = "${pkgs.fish}/bin/fish";

    extraConfig = ''
      set -s escape-time 0

      bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"

      # plugins
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux

      unbind C-b
      set-option -g prefix C-Space
      bind-key C-Space send-prefix
      set -g status-style 'bg=#333333 fg=#5eacd3'

      bind r source-file ~/.tmux.conf
      set -g base-index 1

      set -g renumber-windows on
      set -g status-position top
      set -g default-terminal "${config.home.sessionVariables.TERMINAL}"
      set -g default-terminal "screen-256color"
      set-window-option -g mode-keys vi
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      bind -r D neww -c "#{pane_current_path}" "[[ -e TODO.md ]] && nvim TODO.md || nvim ~/.dotfiles/personal/todo.md"

      # forget the find window.  That is for chumps
      bind-key -r f run-shell "tmux new ~/.local/bin/tmux-sessionizer"

      # kitty-scrollback.nvim related
      bind [ run-shell 'kitty @ kitten /nix/store/m34xk9v4lgcyia8mxca80jn80xcw8i88-vim-pack-dir/pack/myNeovimPackages/start/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py --env "TMUX=$TMUX" --env "TMUX_PANE=#{pane_id}"'

      # osc52 related
      set -s set-clipboard external
      set -g allow-passthrough on
    '';
  };
}
