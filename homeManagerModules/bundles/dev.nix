{
  lib,
  pkgs,
  ...
}: {
  myHomeManager.git.enable = lib.mkDefault true;
  myHomeManager.tmux.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    lazygit
  ];
}
