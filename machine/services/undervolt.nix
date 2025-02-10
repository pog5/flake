{ config, pkgs, ... }: {
  services.undervolt = {
    enable = true;
    coreOffset = -114;
    gpuOffset = -125;
  };
}
