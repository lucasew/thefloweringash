{target, triple}:
let
  nixpkgs = builtins.fetchTarball {
    name = "nixpkgs-unstable";
    url = "https://github.com/NixOS/nixpkgs/archive/4f3475b113c93d204992838aecafa89b1b3ccfde.tar.gz";
    sha256 = "158iik656ds6i6pc672w54cnph4d44d0a218dkq6npzrbhd3vvbg";
  };
  pkgsOriginal = import nixpkgs {};
  pkgsCross = pkgsOriginal.pkgsCross.${target};
in map (pkg: "${pkg}") (with pkgsCross; [
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
])
