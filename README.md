# Setup
## Archlinux Packages required

### Official

```
$ sudo pacman -S emacs clang kitty ncmpcpp ctags neomutt nvim offlineimap cyrus-sasl-gssapi krb5 gpg \
                 python-jedi python-language-server
```

### AUR

   - [metals](https://aur.archlinux.org/packages/metals/)
   - [python2-gssapi](https://aur.archlinux.org/packages/python2-gssapi/)
   - [cquery](https://aur.archlinux.org/packages/cquery/)
   - [bear](https://aur.archlinux.org/packages/bear/)

## Python packages

```
$ sudo pip3 install importmagic epc 
$ pip3 install --user ical2orgpy
```

# Installation 
## Spacemacs
```
$ git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

## Dotfiles

```
$ ./install.sh
```

## neovim
Setup all the plugins, after starting nvim for the first time.
```
:PlugInstall
```

# Workflow

## Setting up C project

```
$ git clone https://git.qemu.org/git/qemu.git src/
$ mkdir -p src/build
$ cd src/build
$ ../configure --target-list=riscv64-softmmu --cc=clang --enable-debug
$ bear make
```
This will create a compile_commands.json file, which will be consumed by emacs.
