{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    ((pkgs.emacs.override {
      withNativeCompilation = true;
    }).overrideAttrs (old: {
      pname = "custom-emacs";
      version = "751a14a4";

      patches = [];
      src = inputs.emacs-src;

      nativeBuildInputs = (old.nativeBuildInputs or []) ++ (with pkgs; [
        autoconf
        automake
        texinfo
      ]);

      preConfigure = ''
        ./autogen.sh
      '' + (old.preConfigure or "");

      CFLAGS = "-O3 -std=gnu17";
      OBJCFLAGS = "-O3 -std=gnu17";

      enableParallelBuilding = true;

      configureFlags = (old.configureFlags or []) ++ [
        "--with-native-compilation=aot"
        "--disable-ns-self-contained"
      ];
    }))
  ];
}
