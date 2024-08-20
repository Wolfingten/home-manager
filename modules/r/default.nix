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
            jmuOutlier
            plotrix
            tidymv
            gamlss
            gsubfn
            lmerTest
            rsample
            ggrepel
            IRkernel
            # to tell jupyter about R kernel, run IRkernel::installspec() in R
            # when jupyter can not be found error:
            # 1. Run system.file('kernelspec', package = 'IRkernel') in R to find location of R kernel.
            # 2. Run jupyter kernelspec install /home/USERNAME/R/VERSION/IRkernel/kernelspec --name 'R' --user to install manually, replace path with output of first command.
            # 3. Check with jupyter kernelspec list and restart jupyter.
            # https://stackoverflow.com/questions/44056164/jupyter-client-has-to-be-installed-but-jupyter-kernelspec-version-exited-wit
          ];
        };
      in
      [
        R-with-my-packages
      ];
  };
}
