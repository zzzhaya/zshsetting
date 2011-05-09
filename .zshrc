# The following lines were added by compinstall
zstyle :compinstall filename '/home/hayata/.zshrc'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' list-colors ''
autoload -U colors
colors

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt appendhistory autocd extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

PROMPT="YUKI.N%# "
PROMPT2="%_%# "
RPROMPT="[%~ %n@%m]"
setopt transient_rprompt # 消える

setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 
#  複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history


setopt auto_pushd 
setopt correct 
setopt list_packed 
setopt nolistbeep 

# http://hatena.g.hatena.ne.jp/hatenatech/20060517
setopt no_hup # terminal切ってもbackground jobsを続ける
setopt print_eight_bit  # 補完候補リストの日本語を適正表示
setopt magic_equal_subst # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt print_eightbit # 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる

## global alias
#alias -g L="| less"
#alias -g G="| grep"
alias pld="perldoc"
alias ls="ls -Ga"
alias sl="ls -lGa"
#alias gvim="LIBUIM_USER_SCM_FILE=~/.uim-gvim gvim"
alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# Ctrl+D では終了しないようになる（exit, logout などを使う）
setopt ignore_eof

# 色を使う
setopt prompt_subst

# globを拡張する。
setopt extended_glob
#http://subtech.g.hatena.ne.jp/cho45/20080617/1213629154
typeset -A abbreviations
abbreviations=(
"L"    "| $PAGER"
"G"    "| grep"

"HEAD^"     "HEAD\\^"
"HEAD^^"    "HEAD\\^\\^"
"HEAD^^^"   "HEAD\\^\\^\\^"
"HEAD^^^^"  "HEAD\\^\\^\\^\\^\\^"
"HEAD^^^^^" "HEAD\\^\\^\\^\\^\\^"
)

magic-abbrev-expand () {
	local MATCH
	LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9^]#}
	LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
}

magic-abbrev-expand-and-insert () {
	magic-abbrev-expand
	zle self-insert
}

magic-abbrev-expand-and-accept () {
	magic-abbrev-expand
	zle accept-line
}

no-magic-abbrev-expand () {
	LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-insert
zle -N magic-abbrev-expand-and-accept
zle -N no-magic-abbrev-expand
bindkey "\r"  magic-abbrev-expand-and-accept # M-x RET はできなくなる
bindkey "^J"  accept-line # no magic
bindkey " "   magic-abbrev-expand-and-insert
bindkey "."   magic-abbrev-expand-and-insert
bindkey "^x " no-magic-abbrev-expand


# 10分後に自動的にログアウトする。
#setopt autologout=10

# http://kitaj.no-ip.com/tdiary/20060927.html#p02
#function cdup() {
#   echo
#   cd ..
#   zle reset-prompt
#}
#zle -N cdup
#bindkey '\^' cdup

#http://www.jmuk.org/diary/2007/02/23/2
setopt SUN_KEYBOARD_HACK

