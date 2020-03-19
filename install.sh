#!/bin/bash
dir=`dirname $0`
dothome=`realpath $dir`
home=`realpath ~`

make_sym() {
    if [[ -f $2 || -d $2 ]]; then
        echo "'$2' already exists, delete? ([y]es/[n]o/[e]xit)"
        read delete
        if [ $delete == 'y' ]
        then
            if [[ -L $2 || -f $2 ]]
            then
                rm $2
            else
                rm -r $2
            fi
        elif [ $delete == 'n' ]
        then
            echo "Skipping '$2'..."
            return
        else
            exit 1
        fi
    fi

    ln -s $1 $2
}

install_neomutt () {
    gpg -o "$dothome/neomutt/alias" "$dothome/neomutt/alias.gpg"
    gpg -o "$dothome/neomutt/mailboxes" "$dothome/neomutt/mailboxes.gpg"
    make_sym "$dothome/neomutt" "$home/.config/neomutt"
}

make_sym "$dothome/bashrc" "$home/.bashrc"
make_sym "$dothome/nvim" "$home/.config/nvim"
make_sym "$dothome/ctags" "$home/.ctags"
make_sym "$dothome/ncmpcpp" "$home/.ncmpcpp"
make_sym "$dothome/spacemacs" "$home/.spacemacs"
make_sym "$dothome/kitty" "$home/.config/kitty"
make_sym "$dothome/mailcap" "$home/.mailcap"
make_sym "$dothome/offlineimaprc" "$home/.offlineimaprc"
make_sym "$dothome/mbox2org/mbox2org.py" "$home/.local/bin/mbox2org"
install_neomutt
