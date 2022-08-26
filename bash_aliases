alias src='source ~/.bashrc'

# Apps --------------------------------------
alias g='git'

# Commands ----------------------------------
alias cl='clear'

alias rm='rm -i'            # confirm removal
alias cp='cp -i'            # confirm copy
alias mv='mv -i'            # confirm move
alias rmf='rm -rf'          # just delete it

alias fsize='sudo du -sh'   # folder size

alias ht='history'
alias htg='history | grep'

alias fpid='ps aux | grep -i'
alias kid='sudo kill -9' 		# -9: SIGKILL

# Configs -----------------------------------
alias hts='sudo nano /etc/hosts'

# Apt ---------------------------------------
alias up='sudo apt update'
alias upl='apt list --upgradable'
alias upd='sudo apt dist-upgrade'

alias upclean='sudo apt clean && sudo apt autoclean && sudo apt autoremove --purge'

alias insta='sudo apt install'
alias instd='sudo dpkg -i'

# Folders -----------------------------------
alias ..='cd ..'
alias ...='cd ../..'

alias dev='cd /home/henrique/Desenvolvimento/'

function ondev() {
  dev && cd "$1";  
}

# Docker ------------------------------------
alias dk='docker'
alias dks='docker start'
alias dkt='docker stop'
alias dkmsdown='cd ~/Projetos/microservices/microservice-docker && docker-compose down'

alias lzd='lazydocker'

# Minikube ----------------------------------
alias skaf='skaffold dev --port-forward'
alias kbs='minikube start'
alias kbt='minikube stop'
alias kbip='minikube ip'
alias kbip2='kubectl get svc'
