if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias cdt='cd ~/code/work/typekit'
alias cdl='cd ~/code/work/fp-lambdas'
alias ll='ls -al'
alias cdo='cd ~/code/work/typekit-ops'
alias gst='git status'
alias ggpush="git push origin HEAD"
alias be="bundle exec"
alias prod_user='export adobe_id=54528C8657FD2F510A49411D@AdobeID; export token=$(~/tools/ims-access-token -e prod -u lizgene@adobe.com -p Testingtesting123!)'
alias gundo="git reset --soft 'HEAD^'"
alias ltkc="cd ~/Work/typekit-ops/chef; bundle exec knife node list | grep tkc"
alias graphlab="source activate gl-env"
alias reload="source ~/.bash_profile"
alias startwork="klam-ext --force get production && klam-ext --force get staging && ssh-out"
alias glol="git log --oneline --graph --decorate --all"
alias python='python3'
alias server='RAILS_SSL=true bundle exec rails s'
alias tpa='terraform taint aws_instance.jumphost; terraform plan -out=.terraformplan'
alias realssh='mv ~/.ssh/config ~/.ssh/config-klam; mv ~/.ssh/config-real ~/.ssh/config'
alias klamssh='mv ~/.ssh/config ~/.ssh/config-real; mv ~/.ssh/config-klam ~/.ssh/config'
alias get-klammed='klam-ext getssh staging; klam-ext getssh production'
alias delete-merged-branches='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias get-very-klammed='klam-ext getssh production --1h -f; klam-ext getssh staging --1h -f'
alias tfplan='terraform plan -out=.terraformplan | landscape'
alias vaultmembers='ldapsearch -LLL -H ldap://ldap.ut1.adobe.net:389 -x -ZZ -D cn=$USER,ou=Users,o=adbe -W -b cn=dme_AF_Operations,ou=Groups,o=adbe'

export GOPATH=/Users/lizgene/code/work/go
export VAULT_ADDR=https://vault.or1.adobe.net/

# colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Prompt w/ git branch.
export PS1='\h:\w \u \[\033[35m\]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\\\\\1\ /`\[\033[37m\]\n>\[\033[00m\] '

alias be='bundle exec'
alias ll='ls -AlG'

# For when you forget to open ssh-out.
alias ssh-out='open https://sanjose-ssh-out.corp.adobe.com'
# alias original-ssh=`which ssh`
# alias ssh=ssh_with_timeout
#ssh_with_timeout() {
#  original-ssh -o ConnectTimeout=3 $@ || ssh-out
# }

# Tab completion for known SSH hosts.
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh
complete -F _complete_ssh_hosts csshX
complete -F _complete_ssh_hosts scp

# csshx to multiple hosts with environment and role. For example: "tkssh dev webserver"
tkssh() {
  cd ~/work/typekit-ops/chef
  csshx `bundle exec knife search node "chef_environment:$1 AND role:$2" | sort | grep Name | awk '{print $3}' | tr '\n' ' '`
  cd -
}

# nodesearch vpcrelstage vpcjobrunner
nodesearch() {
  cd ~/work/typekit-ops/chef
  bundle exec knife search node "chef_environment:$1 AND role:$2"
  cd -
}

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# added by Anaconda2 4.4.0 installer
export PATH="/Users/lizgene/anaconda/bin:$PATH"

export KLAM_MFA_ENABLED=true
export KLAM_EXT_PROFILE_PREFIX=''
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/opt/mariadb@10.0/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
