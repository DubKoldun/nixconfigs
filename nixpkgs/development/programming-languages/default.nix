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
        #  stack cabal            # builders
        
        microlens              # A tiny lens library with no dependencies
        unordered-containers   # containers for lab
        
        hlint
        stylish-haskell        # prettyfier
        
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
        gradle

        /* python */
        (python38.withPackages (ps: with ps; [ virtualenv pip numpy librosa numba ]))

        /* python2 */
        /* (python2.withPackages (ps: with ps; [ pip ])) */

        /* dotnet */
        /* mono5
        dotnet-sdk_3
        omnisharp-roslyn
        dotnetCorePackages.netcore_3_1
        dotnetCorePackages.aspnetcore_3_1 */
    ];
}