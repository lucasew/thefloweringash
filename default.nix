let
   nixpkgs= builtins.fetchGit { 
    url = "https://github.com/Fuseteam/nixpkgs";
    rev = "40c44fdd019cb96f2989818516a2aed4cb7e3464";
  };
  pkgs = import nixpkgs {
    systems = [
       "x86_64-linux"
       "armv7l-linux"
       "aarch64-linux"
    ];
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
