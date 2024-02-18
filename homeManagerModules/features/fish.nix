{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  hasPackage = pname: lib.any (p: p ? pname && p.name == pname) config.home.packages;
  hasRipgrep = hasPackage "ripgrep";
  hasExa = hasPackage "eza";
  hasNeovim = config.programs.neovim.enable;
  hasKitty = config.programs.kitty.enable;
in {
  home.packages = with pkgs.fishPlugins; [
    done
  ];

  # direnv (works with devenv for shell hooks)
  programs.direnv = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      ls = mkIf hasExa "eza";
      exa = mkIf hasExa "eza";

      # misc
      n = "nvim";
      dots = "cd $HOME/.snowstorm";
      ns = "nix-search";
    };
    functions = {
      fish_greeting = "";
    };
    shellInit = ''
    '';
    interactiveShellInit =
      /*
      fish
      */
      ''
        # Kitty integration
        set --global KITTY_INSTALLATION_DIR "${pkgs.kitty}/lib/kitty"
        set --global KITTY_SHELL_INTEGRATION enabled
        source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
        set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"

        # Use vim bindings
        fish_vi_key_bindings
        set fish_cursor_default     block      blink
        set fish_curor_insert 	    line       blink
        set fish_cursor_replace_one underscore blink
        set fish_cursor_visual      block

        function fish_user_key_bindings
        	bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
        	bind -M insert \cf "tmux-sessionizer"
        	bind -M insert \cw "tmux-windownizer"

            # fzf bindings (CTRL-T, CTRL-R, and ALT-C)
            if command -s fzf-share >/dev/null
              source (fzf-share)/key-bindings.fish
            end

            fzf_key_bindings
        end

        function last_history_item
          echo $history[1]
        end

        # add bash's !! binding to fish
        abbr -a !! --position anywhere --function last_history_item

        # automatic shell hooks for dev work
        direnv hook fish | source
      '';
  };
}
