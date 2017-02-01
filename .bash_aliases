alias a='./a.out'
alias xd='od -tx1'
alias 1r='gcc -xc -'
alias ascii='man ascii'
alias src='source ~/.bashrc'
alias mrogue='~/builds/rogue5.4.5/rogue'
alias sl='~/builds/sl/sl'
alias memo='cat > /dev/null'
alias chmodx='chmod +x'
alias pd="pushd"
alias srv="python -m http.server"

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias main='vim main.c'

alias scrsht='import -window root /tmp/$(date +%s).png'
alias fcscrsht='import -window "$(xdotool getwindowfocus -f)" /tmp/$(date +%s).png'

alias grec='grep --color=always'
alias grecnt='grep --color=always -n -T'

alias histep='history | grep'
alias psaxep='ps ax | grep'

alias lc='ls --color=always'
alias lesser='less -R'

alias p8='ping 8.8.8.8'
alias google='w3m https://google.co.jp'

alias C='export LANG=C'
alias ja='export LANG=ja_JP.UTF-8'

alias sdn='sudo shutdown -h now'
alias mount='sudo mount'

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
