{system, targetTriple}:
let
   nixpkgs = builtins.fetchTarball { 
    url = "https://github.com/NixOS/nixpkgs/archive/a86b1f48bf373706e5ef50547ceeaeaec9ee7d34.tar.gz";
    sha256 = "1anzjsvldr4zhvy6iym9asx6m4vlx9wximx1ar4jvav31g9h1yr3";
  };
  pkgsArm = import nixpkgs {
        config = {};
        overlays = [];
        inherit system;
    };
  pkgs = import nixpkgs {
    overlays = [(self: super: {
      inherit (pkgsArm) llvmPackages_7 llvmPackages_9;
    })];
    crossSystem = {
      config = targetTriple;
    };
  };
in (pkgs.nixos {
    fileSystems."/".device  = pkgs.lib.mkDefault "/dev/sda1";
    boot.loader.grub.device = pkgs.lib.mkDefault "/dev/sda";
    environment.systemPackages = with pkgs; [
       # essentials
       bash
       binutils
       busybox
       bzip2
       coreutils
       curl
       gettext
       nix
       patchelf
       stdenv
       texinfo
       which
       xz
       zlib

       # sanity check
       hello

       # common interpreters, compilers and dev tools
       autoconf
       automake
       bison
       cargo
       clang
       clang_9 # current latest clang
       expect
       flex
       ghc
       go
       guile
       help2man
       llvm
       llvm_9 # current latest llvm
       lua
       perl
       python2
       python3
       ruby
       rustc
       swig
       tcl
       tk

       # common build systems and tools
       cmake
       meson
       ninja
       pkg-config

       # commonly used tools
       asciidoc
       direnv
       e2fsprogs
       file
       gdb
       git
       gnupg
       ncdu
       neofetch
       pandoc
       sqlite
       sysstat
       tcpdump
       tio
       tmux
       tree
       unzip
       vim
       xterm

       # common libraries
       cairo
       db
       expat
       gmp
       gnutls
       isl
       libelf
       libffi
       libmpc
       libxml2
       libxslt
       mesa
       mpfr
       ncurses
       npth
       openssl
       pango
       pcre
       readline

       # kernels
       linux
       linux_latest

       # nix specific tooling
       cachix
       lorri
       nix-diff
     ];
}).config.system.build.toplevel
