{ config, lib, pkgs, ... }: {
  time.timeZone = "Europe/Sofia";

  i18n = {
    defaultLocale = "bg_BG.UTF-8";
    extraLocaleSettings = { LC_TIME = "en_GB.UTF-8"; };
  };
}
