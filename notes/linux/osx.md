---
title: OSX Shell Tips
---

# Key Repeat Rate

Add days to your lifespan by Increasing the key repeat rate. Run the following in the terminal then restart.  Protip by [Michael Musson](https://www.linkedin.com/in/michael-m-a37b1932/).

```sh
defaults write -g InitialKeyRepeat -int 13 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

# A better way to search text: `ack`

Install `ack`:

`brew install ack`

Search files for text, super fast and returns results in a very nice way. By default will search recursively from the current directory and it skips unimportant files by default.

`ack "search string"`


# Keyboard Tricks (OS X)
Set your option key to `Esc+`  in iTerm under Profiles>Keys

![](iterm_escape.png)


1. `control-W` delete word backwards
2. `option-D` delete word forwards
3. `control-K` delete until end of line

# My `.zshrc` file

Stored at `~/.zshrc`

I used to have [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) but it made my shell too slow. This is good enough for me.

```bash
# #speed startup time https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
####

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{157}%1~%f%b %F{231}%# '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{141}(%b)%r%f'
zstyle ':vcs_info:*' enable git

alias ls="colorls"
alias python="python3"

# install jupyter kernel with pipenv
function install-jupyter {
  if [ -n "${PIPENV_ACTIVE+1}" ]; then
    VENV_NAME=`echo ${VIRTUAL_ENV} | cut -d '/' -f 7`
    echo "creating Jupyter kernel named $VENV_NAME"
    pipenv install --skip-lock ipykernel
    python -m ipykernel install --user --name=$VENV_NAME
  fi
}

## automatically activate pipenv shell upon cd
function auto_pipenv_shell {
    if [ ! -n "${PIPENV_ACTIVE+1}" ]; then
        if [ -f "Pipfile" ] ; then
            pipenv shell
        fi
    fi
}

function cd {
    builtin cd "$@"
    auto_pipenv_shell
}

#extra stuff
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
GREP_OPTIONS="--color=always";export GREP_OPTIONS
__git_files () { 
    _wanted files expl 'local files' _files     
}
```
