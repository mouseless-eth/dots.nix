{pkgs, ...}: {
  xdg.configFile = {
    "hypr/scripts/workspacer".source = builtins.fetchGit {
      url = "https://github.com/CarloCattano/workspacer.git";
      rev = "17dbc259c1663732dd66d795ef1118701a6d4673";
    };
    #"hypr/scripts/workspace_listener.sh".source = builtins.fetchGit {
    #  url = "https://github.com/CarloCattano/workspacer/workspace_listener.sh";
    #  rev = "17dbc259c1663732dd66d795ef1118701a6d4673";
    #};
  };

  home.packages = with pkgs; [
    socat
    (pkgs.python311.withPackages (ppkgs: [
      ppkgs.pygobject3
    ]))
    gobject-introspection
    gtk3
    glib
    pkg-config
  ];
}
