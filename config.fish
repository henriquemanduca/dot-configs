if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Bins  ------------------------------

# Detekt
fish_add_path /home/henrique/Programas/detekt-cli-1.21.0/bin/

oh-my-posh --init --shell fish --config ~/.poshthemes/blue-owl.omp.json | source

alias src='source ~/.config/fish/config.fish'
alias edit-fish='nvim ~/.config/fish/config.fish'

# Configs -----------------------------
alias edit-hosts='sudo nvim /etc/hosts'

# Apps --------------------------------

alias g='git'
alias v='nvim'
alias detekt-html='detekt-cli -r html:/home/henrique/detekt-reports/detekt.html'

# Commands -----------------------------

alias cl='clear'

alias rm='rm -i'          # confirm removal
alias cp='cp -i'          # confirm copy
alias mv='mv -i'          # confirm move
alias rmf='rm -rf'        # just delete it

alias fsize='sudo du -sh' # folder size

alias ht='history'
alias htg='history | grep'

alias fpid='ps aux | grep -i'
alias kid='sudo kill -9'  # -9: SIGKILL

# Apt ---------------------------------

alias up='sudo apt update'
alias upl='apt list --upgradable'

alias upu='sudo apt upgrade'
alias upd='sudo apt dist-upgrade'

alias upclean='sudo apt clean && sudo apt autoclean && sudo apt autoremove --purge'

alias insta='sudo apt install'
alias instd='sudo dpkg -i'

# Folders -----------------------------

alias ..='cd ..'
alias ...='cd ../..'

function home
    cd ~
end

function projs
    cd ~/Projetos/
end

function pess
    projs
    cd pessoal/
end

function soft
    projs
    cd softfocus/
end

function bkpd
    sudo rsync -aAXv . --dry-run --delete --exclude={/dev/*,/lost+found}  /backup
end

function bkp
    sudo rsync -aAXv . --delete --exclude={/dev/*,/lost+found}  /backup
end

# Repos -----------------------------

function update-fish-repo
    rsync -av ~/.config/fish/config.fish ~/Projetos/pessoal/dot-configs/ 
    git -C ~/Projetos/pessoal/dot-configs add config.fish
    git -C ~/Projetos/pessoal/dot-configs commit -m "Update"
    git -C ~/Projetos/pessoal/dot-configs push
end

# DOCKER -----------------------------

alias dk='docker'
alias dks='docker start'
alias dkt='docker stop'

function ptst
   soft
   cd databases-on-docker/
   docker compose -f postgres12postgis3.yml up -d
   home
end

function ptsp
    soft
    cd databases-on-docker/
    docker compose -f postgres12postgis3.yml down
    home
end

# Kubernets -----------------------------

alias skaf='skaffold dev --port-forward'
alias skafb='skaffold build'

alias kbip2='kubectl get svc'

# Node ----------------------------------

alias nrs='npm run start'
alias rmnm='rm -Rf node_modules/ && rm package-lock.json'

alias ni='npm install'
alias nif='npm install --force'
