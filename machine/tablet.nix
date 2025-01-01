{ config, pkgs, lib, ... }: {
  services.libinput.enable = true;

  hardware.opentabletdriver.enable = true;

  environment.etc = {
    "libinput/local-overrides.quirks".text = ''
      [OpenTabletDriver Virtual Tablets]
      MatchName=OpenTabletDriver*
      AttrTabletSmoothing=0
    '';
  };
}
