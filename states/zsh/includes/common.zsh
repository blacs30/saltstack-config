# Browser.
# --------
if [[ "$OSTYPE" == darwin* ]]; then
    export BROWSER='open'
fi

# Editors.
# --------
export EDITOR='/usr/local/bin/subl'
export VISUAL='/usr/local/bin/subl'
export PAGER='less'
export MANPAGER=less
export MANWIDTH=${MANWIDTH:-80}
export COLORTERM="yes"

# Opens file in EDITOR.
function edit() {
    local dir=$1
    [[ -z "$dir" ]] && dir='.'
    $EDITOR $dir
}
alias e=edit


# Language.
# ---------
if [[ -z "$LANG" ]]; then
    export LANGUAGE=en_GB.UTF-8
    export LC_ALL=en_GB.UTF-8
    export LC_CTYPE=en_GB.UTF-8
    export LC_ALL=en_GB.UTF-8
    #eval "$(locale)"
fi


# Execute commands for each file in current directory.
function each() {
    for dir in *; do
        # echo "${dir}:"
        cd $dir
        $@
        cd ..
    done
}


# Find files and exec commands at them.
# $ find-exec .coffee cat | wc -l
# # => 9762
function find-exec() {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# Better find(1)
function ff() {
  find . -iname "*${1:-}*"
}

# Count code lines in some directory.
# $ loc py js css
# # => Lines of code for .py: 3781
# # => Lines of code for .js: 3354
# # => Lines of code for .css: 2970
# # => Total lines of code: 10105
function loc() {
  local total
  local firstletter
  local ext
  local lines
  total=0
  for ext in $@; do
    firstletter=$(echo $ext | cut -c1-1)
    if [[ firstletter != "." ]]; then
      ext=".$ext"
    fi
    lines=`find-exec "*$ext" cat | wc -l`
    lines=${lines// /}
    total=$(($total + $lines))
    echo "Lines of code for ${fg[blue]}$ext${reset_color}: ${fg[green]}$lines${reset_color}"
  done
  echo "${fg[blue]}Total${reset_color} lines of code: ${fg[green]}$total${reset_color}"
}

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# $ size dir1 file2.js
function size() {
  # du -sh "$@" 2>&1 | grep -v '^du:' | sort -nr
  du -shck "$@" | sort -rn | awk '
      function human(x) {
          s="kMGTEPYZ";
          while (x>=1000 && length(s)>1)
              {x/=1024; s=substr(s,2)}
          return int(x+0.5) substr(s,1,1)
      }
      {gsub(/^[0-9]+/, human($1)); print}'
}

# $ git log --no-merges --pretty=format:"%ae" | stats
# # => 514 a@example.com
# # => 200 b@example.com
function stats() {
  sort | uniq -c | sort -r
}


# $ aes-enc file.zip
function aes-enc() {
  openssl enc -aes-256-cbc -e -in $1 -out "$1.aes"
}

# $ aes-dec file.zip.aes
function aes-dec() {
  openssl enc -aes-256-cbc -d -in $1 -out "${1%.*}"
}

# Converts a.mkv to a.m4v.
function mkv2mp4() {
  for file in "$@"; do
    ffmpeg -i $file -map 0 -c copy "${file%.*}.m4v"
  done
}

function mkv2mp4_1() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:1 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

function mkv2mp4_2() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:2 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

function mkv2mp4_3() {
  for file in "$@"; do
    ffmpeg -i $file -map 0:0 -map 0:3 -c copy -c:s mov_text "${file%.*}.m4v"
  done
}

# Adds subs from a.srt to a.m4v.
function addsubs() {
  for file in "$@"; do
    local raw="${file%.*}"
    local old="$raw.m4v"
    local new="$raw-sub.m4v"
    ffmpeg -i $old -i $file -map 0 -map 1 -c copy -c:s mov_text $new
    mv $new $old
    rm $file
  done
}


# Shortens GitHub URLs. By Sorin Ionescu <sorin.ionescu@gmail.com>
function gitio() {
  local url="$1"
  local code="$2"

  [[ -z "$url" ]] && print "usage: $0 url code" >&2 && exit
  [[ -z "$code" ]] && print "usage: $0 url code" >&2 && exit

  curl -s -i 'http://git.io' -F "url=$url" -F "code=$code"
}

# Monitor IO in real-time (open files etc).
function openfiles() {
  sudo dtrace -n 'syscall::open*:entry { printf("%s %s",execname,copyinstr(arg0)); }'
}

# 4 lulz.
function compute() {
  while true; do head -n 100 /dev/urandom; sleep 0.1; done \
    | hexdump -C | grep "ca fe"
}

# Load 8 cores at once.
function maxcpu() {
  dn=/dev/null
  yes > $dn & yes > $dn & yes > $dn & yes > $dn &
  yes > $dn & yes > $dn & yes > $dn & yes > $dn &
}

# $ retry ping google.com
function retry() {
  echo Retrying "$@"
  $@
  sleep 1
  retry $@
}

# Open curr dir in preview.app.
function preview() {
  local item=$1
  [[ -z "$item" ]] && item='.'
  open $1 -a 'Preview'
}

# Less.
# -----
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
    export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# ==================================================================
# Show man page in Preview.app.
# $ manp cd
function manp {
    local page
    if (( $# > 0 )); then
        for page in "$@"; do
            man -t "$page" | open -f -a Preview
        done
    else
        print 'What manual page do you want?' >&2
    fi
}



# Set GPG TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ];
then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
fi

# Commonly used directories.
dev="$HOME/Developer"
as="$HOME/Library/Application Support"

# Temporary Files.
if [[ -d "$TMPDIR" ]]; then
    export TMPPREFIX="${TMPDIR%/}/zsh"
    if [[ ! -d "$TMPPREFIX" ]]; then
        mkdir -p "$TMPPREFIX"
    fi
fi

# Show current Finder directory.
function finder {
    osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# Gets password from OS X Keychain.
# $ get-pass github
function get-pass() {
    keychain="$HOME/Library/Keychains/login.keychain"
    #security -q find-generic-password -g -l $@ $keychain 2>&1 |\
        security -q find-generic-password -g -l $@ $keychain |\
            awk -F\" '/password:/ {print $2}';
}


# Report how long a command took, if it took more than a second
export REPORTTIME=5

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor

# You can cd into a directory by typing its name, no cd required
setopt AUTOCD
setopt autopushd pushdignoredups PUSHD_SILENT PUSHD_TO_HOME

# No completion for backup files
zstyle ':completion:*:complete:-command-::*' ignored-patterns '*\~'

# Fuzzy completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

autoload -Uz compinit
compinit -u

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

BROWSER=''
unset BROWSER

if [[ "$OSTYPE" == darwin* ]] && [[ -n "$ITERM_SESSION_ID" ]] ; then
   source ~/.iterm2_shell_integration.`basename $SHELL`
fi

##########################
### Disabled
##########################
# POWERLEVEL9K_OK_ICON='✓'
#
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
#
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#
# POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="008"
# POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="007"
# DEFAULT_USER="rawkode"
#
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir dir_writable vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d/%m/%Y}"
#
# POWERLEVEL9K_DISABLE_RPROMPT=true
#
# POWERLEVEL9K_MODE="nerdfont-complete"
