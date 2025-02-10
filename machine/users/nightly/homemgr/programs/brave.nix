{ config, pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "enamippconapkdmgfgjchkhakpfinmaj"; } # sponsorblock
      # { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # dearrow
    ];
    commandLineArgs = [
      "--enable-features=VaapiVideoDecodeLinuxGL"
      "--ignore-gpu-blocklist"
      "--overlay-scrollbars"
      "--enable-zero-copy"
    ];
  };
}
