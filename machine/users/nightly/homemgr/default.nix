{
  config,
  pkgs,
  ...
}:
{
  home = {
    username = "nightly";
    homeDirectory = "/home/nightly";
    stateVersion = "24.11";
  };

  imports = [
    ./env.nix
    ./packages.nix

    ./desktop/fonts.nix
    ./desktop/cursor.nix
    ./desktop/locale.nix
    ./desktop/qt.nix

	./services/ssh-agent.nix
    
    ./programs/git.nix
    ./programs/direnv.nix
    ./programs/fish.nix
    #./programs/helix.nix
    ./programs/vscode.nix
    #./programs/tofi.nix
    ./programs/brave.nix
    ./programs/kitty.nix
    #./programs/hyprland.nix
    ./programs/waybar.nix
    ./programs/tealdeer.nix
    ./programs/mpv.nix
    #./programs/ghostty.nix
    ./programs/micro.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.home-manager.enable = true;
}
