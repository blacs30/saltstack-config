export GOPATH=$HOME/Development
export PATH=$PATH:~/.composer/vendor/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/bin
typeset -gU cdpath fpath mailpath manpath path
typeset -gUT INFOPATH infopath

# Set the the list of directories that cd searches.
cdpath=(
    $cdpath
)

# Set the list of directories that info searches for manuals.
infopath=(
    /usr/local/share/info
    /usr/share/info
    $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
    /usr/local/share/man
    /usr/share/man
    $manpath
)

for path_file in /etc/manpaths.d/*(.N); do
    manpath+=($(<$path_file))
done
unset path_file

# Set the list of directories that Zsh searches for programs.
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages
path=(
    /usr/local/{bin,sbin}
    /usr/local/opt/ruby/bin
    /usr/local/lib/python2.7/site-packages
    /usr/local/share/npm/bin
    /usr/{bin,sbin}
    /{bin,sbin}
    $path
)

for path_file in /etc/paths.d/*(.N); do
    path+=($(<$path_file))
done
unset path_file
