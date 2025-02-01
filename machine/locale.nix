{ config, lib, pkgs, ... }: {
  time.timeZone = "Europe/Sofia";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = { LC_TIME = "en_GB.UTF-8"; };
  };
}
