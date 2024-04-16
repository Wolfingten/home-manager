{
  # from https://github.com/vimjoyer/nvim-nix-video/blob/main/flake.nix
  description = "Flake for Obsidian neovim plugin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    obsidian-nvim.url = "github:epwalsh/obsidian.nvim";
    obsidian-nvim.flake = false;
#    molten-nvim.url = "github:benlubas/molten-nvim";
#    molten-nvim.flake = false;
    jupytext-nvim.url = "github:GCBallesteros/jupytext.nvim/6c9a8721bb24ffc3845632f22aa32b4cfe7ac814";
    jupytext-nvim.flake = false;
#    codeium-vim.url = "github:Exafunction/codeium.vim";
#    codeium-vim.flake = false;
    r-nvim.url = "github:R-nvim/R.nvim";
    r-nvim.flake = false;
    notebookNavigator-nvim.url = "github:GCBallesteros/NotebookNavigator.nvim";
    notebookNavigator-nvim.flake = false;
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      homeConfigurations."wolfingten" =
        inputs.home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [ ./home.nix ];
	  extraSpecialArgs = { inherit inputs; };
	};
      };
}
