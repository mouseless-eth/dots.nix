{pkgs, ...}: {
  programs.git = {
    package = pkgs.git;
    enable = true;
    userName = "mous";
    userEmail = "97399882+mouseless-eth@users.noreply.github.com";
  };
}
