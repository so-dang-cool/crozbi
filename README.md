<img align="right" src="img/bing-crosby.jpg" width="256">

# $crozbi$

## $Clone$ $RepO, Zig$ $Build, Install$

Installer for _simple_ Zig-built-from-source executables.

crozbi works best for projects with standalone executables, simple (or no)
dependencies, and no other alternative documented on how to install them.

I made this because there are many interesting executables being created that
are Zig projects (or use build.zig) and I want to try them out before they
stabilize and land in a Linux distro or something.

### [Wiki](https://github.com/so-dang-cool/crozbi/wiki)

## $Usage$

```
crozbi 1.2

USAGE: crozbi REPO
       crozbi home
       crozbi uninstall EXE

crozbi is a script for installing Zig-built executables. To customize it, edit
the script or fork the repository for yourself.

See https://github.com/so-dang-cool/crozbi for discussion, wiki, issues, or to
fork the project for your own needs.

crozbi REPO
    Clone, zig build, and install whatever is produced by REPO. The clone
    and zig build happens in a directory prefixed by $XDG_DATA_HOME/crozbi/$REPO
    or if XDG_DATA_HOME is unset/empty then $HOME/.local/share/crozbi/$REPO

    If the REPO is in the format name/project then it's expanded as a github
    https url like https://github.com/name/project -- Other formats are passed
    to git clone directly.

    If the REPO is already cloned, instead of a git clone, a git pull will be
    performed.

    The build performed will simply be 'zig build' with no other arguments.

    After a build, crozbi will produce symbolic links in $HOME/.local/bin for any
    binaries found in a project-local zig-out/bin/ directory.

    Any conflicts are replaced with a warning.

crozbi home
    Prints the directory crozbi will use for cloning repositories.

crozbi uninstall EXE
    Uninstall EXE by deleting a symlink at $HOME/.local/bin/$EXE
```

## $Requirements$

1. Some POSIX-compliant `sh` (bash, zsh, dash, etc)
2. [git](https://git-scm.com/)
3. [zig](https://ziglang.org/)

## $Installing$

The recommended way to install crozbi for the first time ever is to run something
like this in bash:

```
CROZBI_BIN="$HOME/.local/bin"
CROZBI_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}/crozbi"
CROZBI_REPO="so-dang-cool/crozbi"

mkdir -p "$CROZBI_HOME"
git clone "https://github.com/$CROZBI_REPO" "$CROZBI_HOME/$CROZBI_REPO"
ln -s "$CROZBI_HOME/$CROZBI_REPO/zig-out/bin/crozbi" "$CROZBI_BIN/crozbi"
```

Minus a Zig build, that is basically everything crozbi does.

## $Updating$

With crozbi installed, you can update to the most recent version with:

```
crozbi so-dang-cool/crozbi
```

If you've forked the repository, update the REPO argument as needed.

## $Notes$ $on$ $safety$ $and$ $being$ $excellent$

The crozbi project makes zero guarantees of safety. Please be sure that you trust
a project before compiling it and executing it on your machine.

By using this software, you agree to not be a jerk. If someone has publically
shared their project on the internet, for you to use free of charge, but for
some reason or another that project cannot support crozbi, please treat them with
respect. (For intentionally malicious stuff, then sure, report it or whatev.)

Some projects will have requirements that are not compatible with crozbi, and
prevent the naive logic in this script from working. _(Examples: zigmod or
another package manager, using a different version of Zig than what you have
installed, requiring dependencies that aren't modeled, or having some difficult
to understand build process.)_

## $Etc$

Released under the terms of the [BSD 3-Clause license]()

A 2023 side quest of [J.R. Hill](https://so.dang.cool).

