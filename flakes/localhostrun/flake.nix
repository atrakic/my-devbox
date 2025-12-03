{
    description = "A script to expose local services via localhost.run";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = nixpkgs.legacyPackages.${system};
            in
            {
                packages = {
                    localhostrun = pkgs.stdenv.mkDerivation {
                        pname = "localhostrun";
                        version = "1.0.0";
                        
                        src = ./.;
                        
                        buildInputs = with pkgs; [ bash openssh ];
                        
                        installPhase = ''
                            mkdir -p $out/bin
                            cp localhostrun.sh $out/bin/localhostrun
                            chmod +x $out/bin/localhostrun
                        '';
                        
                        meta = with pkgs.lib; {
                            description = "Script to expose local services via localhost.run";
                            license = licenses.mit;
                            platforms = platforms.unix;
                        };
                    };
                    
                    default = self.packages.${system}.localhostrun;
                };
                
                apps = {
                    localhostrun = flake-utils.lib.mkApp {
                        drv = self.packages.${system}.localhostrun;
                    };
                    
                    default = self.apps.${system}.localhostrun;
                };
                
                devShells.default = pkgs.mkShell {
                    buildInputs = with pkgs; [ bash openssh ];
                };
            });
}
