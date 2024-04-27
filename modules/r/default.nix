{ lib, config, pkgs, ... }: {

  imports = [
  ];

  options = {
  };

  config = {
    home.packages = with pkgs;
      # from https://discourse.nixos.org/t/how-to-install-rstudio-wrapper-packages-declaratively/30269/6
      # original documentation at https://nixos.wiki/wiki/R
      let
        R-with-my-packages = rWrapper.override{
          packages = with rPackages; [
            data_table
            tidyverse
            reshape2
            sandwich
            multiwayvcov
            extrafont
            forcats
            ggthemes
            dplyr
            tidyr
            AER
          ];
        };
      in
      [
        R-with-my-packages
      ];
  };
}
