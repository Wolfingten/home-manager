{ lib, config, pkgs, inputs, ... }: {

  imports = [
    ./../editorconfig/default.nix
  ]; # import other modules here

  options = {
  };

  config = {
    nixpkgs = {
       overlays = [
         (final: prev: {
           vimPlugins = prev.vimPlugins // {
             obsidian-nvim = prev.vimUtils.buildVimPlugin {
               name = "obsidian-nvim";
               src = inputs.obsidian-nvim;
             };
             jupytext-nvim = prev.vimUtils.buildVimPlugin {
               name = "jupytext-nvim";
               src = inputs.jupytext-nvim;
             };
#             codeium-vim = prev.vimUtils.buildVimPlugin {
#               name = "codeium-vim";
#               src = inputs.codeium-vim;
#             };
#             molten-nvim = prev.vimUtils.buildVimPlugin {
#               name = "molten-nvim";
#               src = inputs.molten-nvim;
#             };
             r-nvim = prev.vimUtils.buildVimPlugin {
               name = "r-nvim";
               src = inputs.r-nvim;
             };
             notebookNavigator-nvim = prev.vimUtils.buildVimPlugin {
               name = "notebookNavigator-nvim";
               src = inputs.notebookNavigator-nvim;
             };
           };
         })
       ];
     };
   programs.neovim = {
      enable = true;
      extraLuaConfig = (builtins.readFile ./configs/settings.lua);
      extraPackages = with pkgs; [
        # optional dependencies for telescope-nvim
        ripgrep
        fd
        # langauge servers
        pyright
        nil
        lua-language-server
      ];
      plugins = with pkgs.vimPlugins; [
      ### syntax highlighting
      # home-manager example: https://git.daniel-siepmann.de/danielsiepmann/nixpkgs/src/branch/main/hom  e/programs/neovim.nix
        {
          plugin = nvim-treesitter.withPlugins (p: with p; [
            bash
            c
            lua
            python
            query
            vim
            vimdoc
            nix
            markdown
            markdown_inline
            r
            rnoweb
          ]);
          type = "lua";
          config = builtins.readFile(./configs/treesitter.lua);
        }
        ### lsp and autocomplete setup
        # neovim guide: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
        # home-manager example: https://github.com/donovanglover/nix-config/blob/master/home/neovim.nix (  nice way of enabiling all lsps)
        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile(./configs/lsp.lua);
        }
        {
          plugin = nvim-cmp;
        }
        cmp-nvim-lsp # connects language server and completion engine
        luasnip # add snippets
        cmp_luasnip # connect snippets and completion engine
        friendly-snippets # third party snippets
        plenary-nvim
        {
          plugin = telescope-nvim;
          type = "lua";
          config = (builtins.readFile ./configs/telescope.lua);
        }
        {
          plugin = molten-nvim;
          type = "lua";
          config = (builtins.readFile ./configs/molten.lua);
        }
#        iron-nvim
#        toggleterm-nvim
        {
          plugin = jupytext-nvim;
          type = "lua";
          config = (builtins.readFile ./configs/jupytext.lua);
        }
        {
          plugin = obsidian-nvim;
          type = "lua";
          config = (builtins.readFile ./configs/obsidian.lua);
        }
        {
          plugin = onedark-nvim;
          type = "lua";
          config = (builtins.readFile ./configs/onedark.lua);
        }
        codeium-vim
        r-nvim
        {
          plugin = notebookNavigator-nvim;
          type = "lua";
          config = (builtins.readFile ./configs/notebookNavigator.lua);
        }
        hydra-nvim
#        {
#          plugin = quarto-nvim;
#          type = "lua";
#          config = (builtins.readFile ./configs/quarto.lua);
#        }
#        otter-nvim
      ];
    };
  };
}


