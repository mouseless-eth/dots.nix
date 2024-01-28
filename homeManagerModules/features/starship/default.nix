{config, ...}: {
  imports = [./symbols.nix];

  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      character = {
        error_symbol = "❯";
        success_symbol = "❯";
      };

      git_status = {
        deleted = "x";
        modified = "*";
        staged = "/";
        stashed = "=";
      };
    };
  };
}
