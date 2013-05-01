#export PATH=/usr/local/bin:$PATH
export DISPLAY=:0.0

export LC_CTYPE="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

export EDITOR="/usr/bin/vim"
export SVN_EDITOR=$EDITOR

# set locale for subversion
export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

export CLICOLOR=1

# make sure /usr/local/bin is search before others
export PATH="${HOME}/bin":"/usr/local/bin":${PATH}:"${HOME}/.gem/ruby/1.8/bin":"/Applications/OpenOffice.org.app/Contents/MacOS:/usr/local/Cellar/multimarkdown/3.6/Support/Utilities"

export PS1="\u@\h \w> "

###################
# ### Shortcuts ###
###################

# File operations
alias mvi="mv -i"

# Rsync with preserving permissions and progress indicator
alias rzync="rsync --exclude '.svn' -avz --progress"

# Encryption
alias encrypt="openssl enc -aes-256-cbc -a -salt -in"
alias decrypt="openssl enc -d -aes-256-cbc -a -in"

# Subversion
alias svc="svn st | grep -E '^( ?M|A|D|!|~|\?)'"
alias svu="svn update"
alias svd="svn diff --diff-cmd colordiff.pl"
alias sve="svn propedit svn:externals"
alias svi="svn propedit svn:ignore"
alias svll="svu -N . && svn log --limit 1"    # last log

# Git
alias gst='git status'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gl='git pull'
alias gpom="git pull origin master"
alias gp='git push'
alias gd='git diff'
alias gb='git branch'
alias gba='git branch -a'
alias gdl='git branch -d'

# Encrypted Disk Images
alias mount_data='hdiutil attach ~/Volumes/Data.sparsebundle'
alias mount_business='hdiutil attach ~/Volumes/Business.sparsebundle'

# Requires GNU source-highlight
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Misc
alias findname="find ./ -name"
alias sorted_du="du -ks * | sort -nr | cut -f2 | xargs du -sh"
alias ltr="ls -ltr"
alias gvim="mvim"
alias dirdiff="diff -r -q -x .DS_Store -x .svn -x .git -x .gitmodules -x .gitignore"

# Graphical diff
alias svndiff="svn diff --diff-cmd ~/bin/shiftforsvndiff -x opendiff"
alias gitdiff="git difftool -t opendiff"
alias mvimdiff="mvim -d"

# Postgres
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop"

# Markdown
function mdv {
    if [ -z "$1" ]; then
        echo "Usage: mdv <multimarkdown file>"
    else

    multimarkdown "$1" > "tmp_$1.html" && open "tmp_$1.html"
    sleep 2
    rm "tmp_$1.html"

    fi
}

# Bring open files to front rather than opening a 2nd time.
# Also need to set the following in MacVim->Preferences->General:
#    Open files from applications: in the current window: with a tab for each file
function mvim {
    open -a MacVim.app $@
    if [ $? -eq 1 ]; then
        `which mvim` $@
    fi
}

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git diff since my last commit
function gitchanged {
    GIT_USER=`git config --global user.name`

    COMMITID=`git --no-pager log -1 --no-merges --author="$GIT_USER" --pretty=oneline $1 | cut -d" " -f1`

    git diff $COMMITID HEAD $1
}

# GUI version of gitchanged
function gitxchanged {
    has_output=`gitchanged $1`
    if [ -n "$has_output" ]; then
        gitchanged $1 | gitx
    fi    
}

# GO
export GOROOT=/usr/local/go

# Grep color
export GREP_OPTIONS='--color=auto'

# Grep shorthands
alias rgrep_rb="grep -ir --include=*.rb"
alias grepir="grep -ir"
