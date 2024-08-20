with import <nixpkgs> {};
let
  pythonEnv = python3.withPackages (ps: with ps; [
    jupyter
    ipykernel
    numpy
    rpy2
    stanza
  ]);
  pythonKernelName = "py-shell";
  rEnv= rWrapper.override{ packages = with rPackages; [
    ggplot2
    IRkernel
    ];
  };
  rKernelName = "r-shell";
in mkShell {
  packages = [
    pythonEnv
    rEnv
  ];
  shellHook = /*shell*/ ''
    ${pythonEnv}/bin/python3 -m ipykernel install --user --name ${pythonKernelName}
    ${jupyter}/bin/jupyter kernelspec install ${rPackages.IRkernel}/library/IRkernel/kernelspec --user --name ${rKernelName}
  '';
#    jupyter kernelspec install ${pythonEnv}/share/jupyter/kernels/python3 --name ${pythonKernelName} --user
#    export PATH=${pkgs.R}/lib/R:$PATH
#  '';
}
