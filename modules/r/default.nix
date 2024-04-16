{ lib, config, pkgs, ... }: {

  imports = [
  ];

  options = {
  };

  config = {
    home.packages = with pkgs; [
      R
    ];
  };

}
