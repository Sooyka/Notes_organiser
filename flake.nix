{
  description = "Notes organiser";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;

  outputs = { self, nixpkgs }: {

    defaultPackage."x86_64-linux" =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "Notatnik";
        src = self;

        installPhase = 
        ''
          mkdir -p $out/bin 
          install -t $out/bin Notatnik 
        '';
      };
   };
}
