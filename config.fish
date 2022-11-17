if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Bins  ------------------------------

# Detekt
fish_add_path /home/henrique/Programas/detekt-cli-1.21.0/bin/

oh-my-posh --init --shell fish --config ~/.poshthemes/blue-owl.omp.json | source

# Configs -----------------------------
alias src='source ~/.config/fish/config.fish'
alias edit-fish='nvim ~/.config/fish/config.fish'
alias edit-hosts='sudo nvim /etc/hosts'
alias edit-nvim='nvim ~/.config/nvim/init.vim'

# Apps --------------------------------

alias g='git'
alias gn='gitnow'
alias v='nvim'
alias lz='lazygit'
alias detekt-html='detekt-cli -r html:/home/henrique/detekt-reports/detekt.html'

# Commands -----------------------------

alias l='ls'
alias ll='ls -lh'
alias la='ls -lah'
alias lr='ls -R'
alias lh='ls -d .*'

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

alias up='clear && sudo apt update'
alias upl='clear && apt list --upgradable'

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
    clear
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
    cd softfocus2/
end

function bkpd
    sudo rsync -aAXv . --dry-run --delete --exclude={/.git,/node_modules,/lost+found} ~/Projetos/backup > backup.log
end

function bkp
    sudo rsync -aAXv . --delete --exclude={/.git,/node_modules,/lost+found} ~/Projetos/backup > backup.log
end

# Repos -----------------------------

function update-fish-repo
    rsync -av ~/.config/fish/config.fish ~/Projetos/pessoal/dot-configs/ 
    git -C ~/Projetos/pessoal/dot-configs add config.fish
    git -C ~/Projetos/pessoal/dot-configs commit -m "Update"
    git -C ~/Projetos/pessoal/dot-configs push
end

function update-keepass-repo
    git -C /home/henrique/Projetos/pessoal/keepass add manduca.kdbx
    git -C /home/henrique/Projetos/pessoal/keepass commit -m "Update"
    git -C /home/henrique/Projetos/pessoal/keepass push
end

# DOCKER -----------------------------

alias dk='docker'
alias dkst='docker start'
alias dksp='docker stop'

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

alias skaf='clear && skaffold dev --port-forward'
alias skafb='clear && skaffold build'

alias ksvc='kubectl get svc'

alias lpods='kubectl get pods'
alias llogs='kubectl logs '
alias ldesc='kubectl describe pod '
alias lrest='kubectl rollout restart deployment '

alias hpods='kubectl --kubeconfig kubectl_config_hml.conf get pods'
alias hlogs='kubectl --kubeconfig kubectl_config_hml.conf logs'
alias hdesc='kubectl --kubeconfig kubectl_config_hml.conf describe pod'
alias hrest='kubectl --kubeconfig kubectl_config_hml.conf rollout restart deployment '

# Node ----------------------------------

alias nrst='npm run start'
alias rmnm='rm -Rf node_modules/ && rm package-lock.json'

alias ni='npm install'
alias nif='npm install --force'

# Kasper -------------------------------

alias kaspSu='sudo systemctl status kesl'
alias kaspSp='sudo systemctl stop kesl'
alias kaspSt='sudo systemctl restart kesl'

