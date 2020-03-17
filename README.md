# Setup
## Archlinux Packages required

### Official

```
$ sudo pacman -S emacs clang kitty ncmpcpp ctags neomutt nvim offlineimap cyrus-sasl-gssapi krb5 gpg
```

### AUR

   - [metals](https://aur.archlinux.org/packages/metals/)
   - [python2-gssapi](https://aur.archlinux.org/packages/python2-gssapi/)

## Installing spacemacs

```
$ git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

## Installing the dotfiles

```
$ ./install.sh
```
