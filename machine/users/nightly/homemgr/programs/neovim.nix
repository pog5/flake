{ config, pkgs, lib, ...}:
{
  programs.nvf.enable = true;
  programs.nvf.settings = {
	vim.viAlias = true;
	vim.vimAlias = true;
	vim.lsp = {
 	  enable = true;
	};
  };
}
