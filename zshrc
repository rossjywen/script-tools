echo "source script-tools/zshrc"

alias ls='ls -G'
alias ll='ls -lh'
alias du='du -h'
alias df='df -h'
alias grep='grep --color=auto'

#echo $0 $0 is not current shell name

# google search "zsh $PS1"
if [ -n "$ZSH_EVAL_CONTEXT" ]
then
	echo "in zsh update \$PS1 as $PS1"
	export PS1="%F{6}%n%F{11}@%F{8}%m %F{blue}%10~ %F{black}%# "
else
	export PS1="\s-\v \w $ "
	echo "in bash update \$PS1 as $PS1"
fi

export PATH=$PATH:/opt/homebrew/bin/
export PATH=$PATH:~/code/script-tools/

