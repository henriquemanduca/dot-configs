if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Bins  ------------------------------------------------------------------------

# Detekt
fish_add_path /home/henrique/Programas/detekt-cli-1.21.0/bin/

oh-my-posh --init --shell fish --config ~/.poshthemes/blue-owl.omp.json | source

# Configs ----------------------------------------------------------------------
alias src='source ~/.config/fish/config.fish && cl'
alias ed-fish='code ~/.config/fish/config.fish'
alias ed-fish-code='code ~/.config/fish/config.fish'
alias ed-hosts='sudo nvim /etc/hosts'
alias ed-nvim='nvim ~/.config/nvim/init.vim'

# Apps -------------------------------------------------------------------------

alias g='git'
alias gn='gitnow'
alias v='nvim'
alias lz='lazygit'
alias detekt-html='detekt-cli -r html:/home/henrique/detekt-reports/detekt.html'

# Commands ---------------------------------------------------------------------

alias l='ls'
alias ll='ls -lh'
alias la='ls -lah'
alias lr='ls -R'
alias lh='ls -d .*'

alias cl='clear'
alias p='pwd'

alias rm='rm -i'   # confirm removal
alias mv='mv -i'   # confirm move
alias rmf='rm -rf' # just delete it

alias fd-size='sudo du -sh' # folder size

alias ht='history'
alias htf='history | grep'

alias idf='ps aux | grep -i'
alias kid='sudo kill -9'  # -9: SIGKILL

# Apt --------------------------------------------------------------------------

alias up='clear && sudo apt update'
alias upl='clear && apt list --upgradable'

alias upu='sudo apt upgrade'
alias upd='sudo apt dist-upgrade'

alias upclean='sudo apt clean && sudo apt autoclean && sudo apt autoremove --purge'

alias inst='sudo apt install'
alias instd='sudo dpkg -i'

# Acoes ------------------------------------------------------------------------

alias cp-ngx-soft='yes | cp -r /home/henrique/Projetos/softfocus2/microfront/ngx-softfocus/*'

# Folders ----------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'

function home
    cd ~
    clear
end

function hm
    home
end

function Projetos
    cd ~/Projetos/
end

function pessoal
    Projetos
    cd pessoal/
end

function soft
    Projetos
    cd softfocus2/
end

function bkpd
    sudo rsync -aAXv . --dry-run --delete --exclude={/.git,/node_modules,/lost+found} ~/Projetos/backup > backup.log
end

function bkp
    sudo rsync -aAXv . --delete --exclude={/.git,/node_modules,/lost+found} ~/Projetos/backup > backup.log
end

# Repos ------------------------------------------------------------------------

function up-fish-repo
    rsync -av ~/.config/fish/config.fish ~/Projetos/pessoal/dot-configs/ 
    git -C ~/Projetos/pessoal/dot-configs add config.fish
    git -C ~/Projetos/pessoal/dot-configs commit -m "Update"
    git -C ~/Projetos/pessoal/dot-configs push
end

function up-keepass-repo
    git -C /home/henrique/Projetos/pessoal/keepass add manduca.kdbx
    git -C /home/henrique/Projetos/pessoal/keepass commit -m "Update"
    git -C /home/henrique/Projetos/pessoal/keepass push
end

# DOCKER -----------------------------------------------------------------------

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

# Kubernets --------------------------------------------------------------------

alias skf='clear && skaffold dev --port-forward'
alias skf-b='clear && skaffold build'

alias kube-svc='kubectl get svc'

# Local

alias lpods='kubectl get pods'
alias llogs='kubectl logs '
alias ldesc='kubectl describe pod '
alias lroll='kubectl rollout restart deployment '

alias kubepath='/usr/local/bin/kubectl --kubeconfig ~/Projetos/softfocus2/kubectl/kubectl_config_hml.conf'

set nameSpaceInterno 'credisol-interno'

# Interno

function ipods 
    kubepath get pods -n $nameSpaceInterno
end

function ipodsf
    ipods | grep $argv
end

function ilogs 
    kubepath logs $argv -n $nameSpaceInterno
end

function ilogsf
    ilogs (string split ' ' (ipodsf $argv))[1]    
end

function idesc 
    kubepath describe pod $argv -n $nameSpaceInterno
end

function idesf
    idesc (string split ' ' (ipodsf $argv))[1]    
end

function iroll 
    kubepath rollout restart deployment $argv -n $nameSpaceInterno
end

function irollf
    iroll (string split ' ' (ipodsf $argv))[1]    
end

# Homolog

function hpods 
    kubepath get pods
end

function hpodsf
    hpods | grep $argv
end

function hlogs 
    kubepath logs $argv
end

function hlogsf
    hlogs (string split ' ' (hpodsf $argv))[1]    
end

function hdesc 
    kubepath describe pod $argv
end

function hdesf
    hdesc (string split ' ' (hpodsf $argv))[1]    
end

function hroll 
    kubepath rollout restart deployment $argv
end

function hrollf
    hroll (string split ' ' (hpodsf $argv))[1]    
end

# MVN --------------------------------------------------------------------------

alias mvn-w='mvn wrapper:wrapper'
alias mvn-c='mvn compile jib:dockerBuild'

# Node -------------------------------------------------------------------------

alias rm-nm='rm -Rf node_modules/ && rm package-lock.json'

alias npm-st='cl && npm run start'
alias npm-i='cl && npm install'
alias npm-if='cl && npm install --force'

# Angular CLI ------------------------------------------------------------------

alias ng-b='cl && ng build'
alias ng-bw='cl && ng build --wath'

# Kasper -----------------------------------------------------------------------

alias kasp-su='sudo systemctl status kesl'
alias kasp-sp='sudo systemctl stop kesl'
alias kasp-sr='sudo systemctl restart kesl'
