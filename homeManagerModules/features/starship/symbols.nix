{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  programs.starship = {
    enableFishIntegration = true;
    settings = {
      aws.symbol = mkDefault "aws ";
      battery.full_symbol = mkDefault "󰁹";
      battery.charging_symbol = mkDefault "󰂄";
      battery.discharging_symbol = mkDefault "󰂃";
      battery.unknown_symbol = mkDefault "󰂑";
      battery.empty_symbol = mkDefault "󰂎";
      cmake.symbol = mkDefault "cmake ";
      conda.symbol = mkDefault "conda ";
      crystal.symbol = mkDefault "cr ";
      dart.symbol = mkDefault "dart ";
      directory.read_only = mkDefault "ro ";
      docker_context.symbol = mkDefault "docker ";
      dotnet.symbol = mkDefault "dotnet ";
      elixir.symbol = mkDefault "exs ";
      elm.symbol = mkDefault "elm ";
      erlang.symbol = mkDefault "erlang ";
      gcloud.symbol = mkDefault "gloud ";
      git_branch.symbol = mkDefault " ";
      git_commit.tag_symbol = mkDefault " ";
      git_status.format = mkDefault "([$all_status$ahead_behind]($style) )";
      git_status.conflicted = mkDefault "󰅰 ";
      git_status.ahead = mkDefault " ";
      git_status.behind = mkDefault " ";
      git_status.diverged = mkDefault "󰃻 ";
      git_status.untracked = mkDefault " ";
      git_status.stashed = mkDefault " ";
      git_status.modified = mkDefault " ";
      git_status.staged = mkDefault " ";
      git_status.renamed = mkDefault " ";
      git_status.deleted = mkDefault " ";
      golang.symbol = mkDefault " ";
      helm.symbol = mkDefault "⎈ ";
      hg_branch.symbol = mkDefault " ";
      java.symbol = mkDefault "java ";
      julia.symbol = mkDefault "jl ";
      kotlin.symbol = mkDefault "kotlin ";
      kubernetes.symbol = mkDefault "☸ ";
      lua.symbol = mkDefault "lua ";
      memory_usage.symbol = mkDefault "󰍛 ";
      nim.symbol = mkDefault "󰆥 ";
      nix_shell.symbol = mkDefault " ";
      nodejs.symbol = mkDefault "nodejs ";
      openstack.symbol = mkDefault "󰊓 ";
      package.symbol = mkDefault " ";
      perl.symbol = mkDefault " ";
      php.symbol = mkDefault " ";
      purescript.symbol = mkDefault "<≡> ";
      python.symbol = mkDefault "🐍";
      ruby.symbol = mkDefault " ";
      rust.symbol = mkDefault "rs ";
      shlvl.symbol = mkDefault " ";
      status.symbol = mkDefault " ";
      status.not_executable_symbol = mkDefault " ";
      status.not_found_symbol = mkDefault "󰍉 ";
      status.sigint_symbol = mkDefault " ";
      status.signal_symbol = mkDefault " ";
      swift.symbol = mkDefault " ";
      terraform.symbol = mkDefault "𝗧 ";
      vagrant.symbol = mkDefault "𝗩 ";
      zig.symbol = mkDefault "zig ";
    };
  };
}
