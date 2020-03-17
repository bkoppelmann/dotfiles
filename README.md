# Setup
## Archlinux Packages required

### Official

```
$ sudo pacman -S emacs clang kitty ncmpcpp ctags neomutt nvim offlineimap cyrus-sasl-gssapi krb5 gpg \
                 python-jedi
```

### AUR

   - [metals](https://aur.archlinux.org/packages/metals/)
   - [python2-gssapi](https://aur.archlinux.org/packages/python2-gssapi/)

## Python packages

```
$ sudo pip3 install importmagic epc 
```

## Installing spacemacs

```
$ git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

## Installing the dotfiles

```
$ ./install.sh
```
