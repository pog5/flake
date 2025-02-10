{ config, pkgs, lib, ...}:
{
	nixpkgs.overlays = [
		(self: super: {
		  signal-desktop = super.signal-desktop.overrideAttrs (old: {
		    preFixup = old.preFixup + ''
		      gappsWrapperArgs+=(
		        --add-flags "--enable-features=UseOzonePlatform"
		        --add-flags "--ozone-platform=wayland"
		        --add-flags "--use-tray-icon"
		      )
		    '';
		  });
		})
	];
}
