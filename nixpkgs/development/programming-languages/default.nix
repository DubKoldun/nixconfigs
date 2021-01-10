{ pkgs, ... }:

{   
    home.packages = with pkgs; [    
        # languages related
        /* c++ */
        gcc
        gdb
        glibc
        cmake
        valgrind
  

        /* haskell */
        (ghc.withPackages (ps: with ps; [
        Cabal                  # builders
       
        microlens              # A tiny lens library with no dependencies
        unordered-containers   # containers for lab
        
        hlint
        stylish-haskell        # prettyfier

        cabal2nix              # Convert Cabal files into Nix build instructions
        cabal-install
        
        hspec hedgehog tasty   # testing
        tasty-hedgehog         # testing
        tasty-hspec            # testing
        
        alex                   # generating lexical analysers in Haskell
        happy                  # parser generator for Haskell
        ] )
        )

        /* kotlin */
        kotlin

        /* java */
        # openjdk
        maven
        gradle

        /* python */
        (python38.withPackages (ps: with ps; [
             virtualenv 
             pip        #
             numpy      #
             librosa    # work with audio
             numba      #
             pandas     # db work
             ipykernel  # IPython Kernel for Jupyter
             notebook   # The Jupyter HTML notebook is a web-based notebook environment for interactive computing
             jupyter_client
             pyzmq
             pytorch
             torchvision
             Keras
             tensorflow-estimator
             seaborn
            #  xgboost
             pybindgen
             ]))

        /* python2 */
        /* (python2.withPackages (ps: with ps; [ pip ])) */

        /* perl */
        perl

        /* dotnet */
        /* mono5
        dotnet-sdk_3
        omnisharp-roslyn
        dotnetCorePackages.netcore_3_1
        dotnetCorePackages.aspnetcore_3_1 */
    ];
}