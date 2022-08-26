if status is-interactive
    # Commands to run in interactive sessions can go here
end

oh-my-posh init fish --config ~/.poshthemes/blue-owl.omp.json | source

alias src='source ~/.config/fish/config.fish'

# Apps --------------------------------------
alias g='git'
alias nt='nautilus'
alias el='exa --long --header --icons'

# Commands ----------------------------------
alias cl='clear'

#alias rm='rm -i'            	# confirm removal
alias cp='cp -i'            	# confirm copy
alias mv='mv -i'            	# confirm move
alias rmf='rm -rf'          	# just delete it

alias fsize='sudo du -sh'   	# folder size

alias ht='history'
alias htg='history | grep'

alias fpid='ps aux | grep -i'
alias kid='sudo kill -9' 	# -9: SIGKILL

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

alias prj='cd /home/henrique/Projetos/'

# DOCKER ------------------------------------
alias dk='docker'
alias dks='docker start'
alias dkt='docker stop'

# Minikube ----------------------------------
alias skaf='skaffold dev --port-forward'
alias skafb='skaffold build'

alias kbs='minikube start'
alias kbt='minikube stop'

alias kbip='minikube ip'
alias kbip2='kubectl get svc'

# Node ----------------------------------
alias nrs='npm run start'
alias rmnm='rm -Rf node_modules/ && rm package-lock.json'
alias ni='npm install'
alias nif='npm install --force'
