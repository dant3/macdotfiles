#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

usage() {
cat << EOF
    usage: $0 options
    OPTIONS:
    -b install homebrew
    -l link dotfiles
    -s shell fix
    -f font antialiasing fix
    -r rebuild launch service database
EOF
}

fail() {
    echo '** something went wrong'
    exit 1
}

install_brew() {
    pushd ~ || fail
    mkdir .homebrew || fail
    curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C .homebrew || fail
    brew update || fail
    popd || fail
    echo "-- brew has been sucessfully installed"
}

create_symlink_for() {
    for filename in $1; do
        HOMEFILE="$HOME/$filename"
        if [ -f $HOMEFILE ] || [ -d $HOMEFILE ];
        then
            mkdir -p $SCRIPT_DIR/.backup/
            mv -v $HOME/$filename $SCRIPT_DIR/.backup/
        elif [ -L $HOMEFILE ]; # broken symlink
        then
            unlink $HOMEFILE
        fi
        ln -s $SCRIPT_DIR/$filename $HOME/ || fail
    done
}

link_dotfiles() {
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    pushd $SCRIPT_DIR || fail
    create_symlink_for ".bash*" || fail
    create_symlink_for ".git?*" || fail
    create_symlink_for ".hg?*" || fail
    create_symlink_for ".vimrc" || fail
    create_symlink_for ".vim" || fail
    create_symlink_for ".zsh*" || fail
    popd || fail
    pushd ~/.vim || fail
    git submodule update --init --recursive
    popd || fail
    cp -Rv $SCRIPT_DIR/.oh-my-zsh/* ~/.oh-my-zsh
    echo "-- dotfiles has been sucessfully linked"
}

shell_fix() {
    sudo sh -c 'echo set completion-ignore-case On >> /etc/inputrc' || fail
}

font_antialiasing_fix() {
    defaults -currentHost write -g AppleFontSmoothing -int 1 || fail
}

rebuild_launch_service_db() {
    /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r || fail
}

if [[ $# -eq 0 ]]; then
    usage
    exit 0
fi

while getopts "blgsfrh?" OPTION; do
    case $OPTION in
    b)
        install_brew
        ;;
    l)
        link_dotfiles
        ;;
    s)
        shell_fix
        ;;
    f)
        font_antialiasing_fix
        ;;
    r)
        rebuild_launch_service_db
        ;;
    *)
        usage
        ;;
    esac
done
