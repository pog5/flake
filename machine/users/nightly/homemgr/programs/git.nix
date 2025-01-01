{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Nightly";
    userEmail = "pixel@nightly.eu.org";
  };
}
