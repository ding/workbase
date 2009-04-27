############ -*- Mode: shell-script; coding: euc-jp -*- ####
# ~ippei/.zshrc
#   written by kishida@imat.eng.osaka-cu.ac.jp
# last-modified: 2006/06/14 11:35:21.
# ���������ѡ������۲��Ǥ��
# cf: man zshall, zshoptions
############################################################
#### ɾ���ѥ��ڡ���
#autoload -U predict-on # ���ޥ�ɤ�ͽ¬����(�ҥ��ȥꢪ�����䴰)
#zle -N predict-on
#zle -N predict-off
#bindkey '^Xp' predict-on    # [C-x p] ��ͭ����
#bindkey '^X^p' predict-off  # [C-x C-p] ��̵����
#predict-on
# ���򤤤�����ɡ����ޥ�ɥ饤�����Ƭ����ä��Խ�����Ȥ��˥�������ʹߤ����ƾä���Τ�����

autoload -U zmv
# % zmv '(*).jpeg' '$1.jpg'
# % zmv '(**/)foo(*).jpeg' '$1bar$2.jpg'
# % zmv -n '(**/)foo(*).jpeg' '$1bar$2.jpg' # �¹Ԥ����ѥ�����ɽ���Τ�
# % zmv '(*)' '${(L)1}; # ��ʸ������ʸ��
# % zmv -W '*.c.org' 'org/*.c' #��(*)�ס�$1�פ��*�פǺѤޤ�����
alias mmv='noglob zmv -W'  # �����Υ������Ȥ����ݤʤΤ�
# % mmv *.c.org org/*.c
#zmv -C # ��ư�ǤϤʤ����ԡ�(zcp �Ȥ��ƻȤ���ˡ�⤢��ߤ���������)
#zmv -L # ��ư�ǤϤʤ����(zln �Ȥ��ƻȤ���ˡ�⤢��ߤ���������)

zstyle ':completion:*' use-compctl false # compctl��������Ѥ��ʤ�

# �ǥե���ȤǤ�桼��̾�� /etc/passwd ���顢�ۥ���̾�� /etc/hosts ����> �䴰�������äƤ���
#zstyle ':completion:*' users-hosts bar:foo.example.com funa@daemon

#  ��λ�����ɤǿ����Ѥ���
#PROMPT='%{%(?.$fg[green].$fg[red])%}PROMPTSTRING%{$reset_color%}'
#��������ȡ���λ�����ɤ� 0 �ΤȤ����п��������ǤϤʤ��Ȥ�(=�۾ｪλ)���ֿ��ˤʤ롣

 
############################################################

# redo?
# ���
# cd -[tab] �ǥǥ��쥯�ȥꥹ���å���ƤӽФ���
# <1-20> �ѥ�����ޥå�
# ESC C-h �Ƕ��ڤ�ʸ���ޤǤΥХå����ڡ���
# killall���ޥ��
# ***/ �����󥯤�é��
# C-x g �磻��ɥ�����Ÿ����̤�ߤ�
# a=aiueo; echo $a[1] # ����ΰ���
# setopt multios(�ǥե����)��ʣ��������쥯�ȡ��ѥ���(��ls > 1.txt > 2.txt | less��)

#### �ʲ��˽񤫤�Ƥʤ������Х���ɤ� man zshzle �� STANDARD WIDGETS �򻲾�
# ESC-q (push-line)�ǥ��쥯�ȥꥹ���å�
# C-x C-x       (exchange-point-and-mark)C-SPACE �ǥޡ��������Ľ�˥�����
# ESC-T (transpose-words)�����������
# ESC-. (insert-last-word)ľ�����ޥ�ɤκǸ�ΰ�����ƤӽФ�(�����֤��Ȥ���)���Ķ��ѿ� _ ��Ʊ��
# ESC-U (up-case-word)����������֡�ñ�콪ü�ޤǤ���ʸ�����ѹ�
# ESC-L (down-case-word)����������֡�ñ�콪ü�ޤǤ�ʸ�����ѹ�
# ESC-' (quote-line)���ޥ�ɹ����Τ� '��' �ǳ��
# ESC-" (quote-region)�ޡ����������֡�����������֤� '��' �ǳ��
# (̤������)      (expand-cmd-path)���ޥ�ɤ�ե�ѥ���Ÿ��
# C-x C-=       (what-cursor-position)����������֤ˤ���ʸ�������ɤ�8��10��16��ɽ��������������֤�ɽ��
# C-[   ESC ������
# ESC-n (digit-argument)�������Ϥβ������(�㡧[ESC-4][ESC-0]-)
# ESC C-_       (copy-prev-word)��������κ��ˤ���ñ��򥳥ԡ����ƥڡ����Ȥ���
# C-x C-o       (overwrite-mode)�����������Υ⡼���ڤ��ؤ�

# �Ŀ�Ū�����Х���ɤ˻Ȥ��� C-�����Х����
# C-o, C-q, C-s
# C-c, C-g ��������Υ��ޥ�ɤ��ä��Ƥ��ޤ��Τ򲿤Ȥ�����
# C-i   TAB �Ǥ���
# C-w   �ײ���
# C-v   �ü�ʸ�����֤���C-v C-i �ʤ饿��ʸ����C-v C-j �ʤ����ʸ�����֤���
# C-x �ϥ��ޥ�ɤ�Ĵ�٤롣(C-x g �ߤ�����)
# ��C-t ��ʸ�����줫���ϻȤ����꤬�ɤ��ʤ��ΤǤ���ʤ� �� screen �˻���
#### C-j or C-m �ɤ��餫���ɤ������櫓�ǤϤʤ���skkinput �� C-j ��Ȥ�

#### �᡼������å�
## autoload -U colors; colors   # ���Τ���ˡ����ꤷ�Ƥʤ���Ф��Ƥ���
# MAILCHECK=300                 # 300����˥����å�
## MAILPATH="/var/mail$USER"    # �����å�����᡼��ܥå���
# MAILPATH="/var/mail$USER?{fg[red]}New mail"   # ��å������ȿ����ѹ�

## --enable-maildir-support ����ꤷ�ƥ���ѥ��뤹���Maildir �����Ǥ��ǽ
# MAILPATH="$HOME/Maildir?{fg_bold[red]}New mail in $_" # ��$_�פ��ѹ����줿file
## : �Ƕ��ڤ��ʣ���Υ᡼�륹�ס��������å��Ǥ���
# MAILPATH="$HOME/Maildir?{fg_bold[red]}New mail in $_:$HOME/Maildir-foo?{fg_bold[green]}New mail in $_:"

# �Ķ��ѿ� $TERM �� gentoo �����줿�ǥե���ȤǤ� linux �ˤʤäƤ���

############################################################
# �Ķ��ѿ��ϼ�� ~/.zshenv �˵���
# ~/.zshrc �˵��Ҥ���Τϡ����󥿥饯�ƥ��֥�����Ȥ��Ƥ�����

# ���̤κ��粽�����ʤ��ʤ�Τ�����
#if [ ! $TERM = "screen"  ]; then; screen; fi

autoload -U colors; colors      # ${fg[red]}�����Υ��顼�񼰤�ͭ����

hosts=( localhost `hostname` )
#printers=( lw ph clw )
umask 002
cdpath=( ~ )                    # cd �Υ������ѥ�
#fpath=($fpath ~/.zfunc )       # zsh�ؿ��Υ������ѥ�

#�������ȥǥ��쥯�ȥ�˸��䤬�ʤ����Τ� cdpath ��Υǥ��쥯�ȥ�����
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# cf. zstyle ':completion:*:path-directories' hidden true
# cf. cdpath ��Υǥ��쥯�ȥ���䴰���䤫�鳰���

#���䴰�����羮ʸ������̤��ʤ�
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' #C-w �Ǥ�ñ����ڤ�Ȥ���ǧ�������ʸ��
#        ��*?_-.[]~=/&;!#$%^(){}<>�ע�WORDCHARS �Υǥե������

#### history
HISTFILE="$HOME/.zhistory"      # ����ե�����
HISTSIZE=10000           # ��������¸����� $HISTFILE �κ��祵������
SAVEHIST=10000                  # ��¸�������������

#### option, limit, bindkey
setopt extended_history         # ���ޥ�ɤγ��ϻ���ȷв���֤���Ͽ
setopt hist_ignore_dups         # ľ���Υ��ޥ�ɤ�Ʊ��ʤ����Ͽ���ʤ�
setopt hist_ignore_all_dups     # ��Ͽ�ѥ��ޥ�ɹԤϸŤ�������
setopt hist_reduce_blanks # ;ʬ�ʶ���ϵͤ����Ͽ(������㤤��Ͽ���ɤ�)
#setopt append_history  # zsh ��λ��������˥ե�����˵�Ͽ(�ǥե����)
#setopt inc_append_history # Ʊ�塢���������ޥ�ɤ����Ϥ��������ǵ�Ͽ
setopt share_history    # �ҥ��ȥ�ζ�ͭ��(append�ϤȰۤʤ���ɤ߹������ס���������ꤹ��� append �Ϥ�����)
setopt hist_no_store            # history���ޥ�ɤ���Ͽ���ʤ�
setopt hist_ignore_space # ���ޥ�ɹ���Ƭ������λ���Ͽ���ʤ�(ľ��ʤ�иƤ٤�)


setopt list_packed              # �䴰����ꥹ�Ȥ�ͤ��ɽ��
setopt print_eight_bit          # �䴰����ꥹ�Ȥ����ܸ��Ŭ��ɽ��
#setopt menu_complete  # 1���ܤ�TAB ���䴰�����������ɽ����������������
setopt no_clobber               # ��񤭥�����쥯�Ȥζػ�
setopt no_unset                 # ̤����ѿ��λ��Ѥζػ�
setopt no_hup                   # logout���˥Хå����饦��ɥ���֤� kill ���ʤ�
setopt no_beep                  # ���ޥ�����ϥ��顼��BEEP���Ĥ餵�ʤ�

setopt extended_glob            # ��ĥ�����
setopt numeric_glob_sort        # ��������ͤȲ�ᤷ�ƾ��祽���Ȥǽ���
setopt auto_cd                  # ��1�������ǥ��쥯�ȥ���� cd ���䴰
setopt correct                  # ���ڥ�ߥ��䴰
setopt no_checkjobs             # exit ���˥Хå����饦��ɥ���֤��ǧ���ʤ�
#setopt ignore_eof              # C-d��logout���ʤ�(C-d���䴰�ǻȤ�����)
setopt pushd_to_home        # �����ʤ�pushd��$HOME�����(ľ��dir�ؤ� cd - ��)
setopt pushd_ignore_dups        # �ǥ��쥯�ȥꥹ���å��˽�ʣ����ʪ�ϸŤ�������
#setopt pushd_silent   # pushd, popd ���٤˥ǥ��쥯�ȥꥹ���å�����Ȥ�ɽ�����ʤ�
setopt interactive_comments     # ���ޥ��������Υ����Ȥ�ǧ���
#setopt rm_star_silent          # rm * ���������ɤ���ʹ�����˼¹�
#setopt rm_star_wait            # rm * �λ��� 10�ôֲ��⤷�ʤ�
#setopt chase_links             # �����Υѥ����Ѵ����Ƥ���¹ԡ�
# setopt sun_keyboard_hack      # SUN�����ܡ��ɤǤ��ѽ� typo ` �򥫥С�����


#limit   coredumpsize    0       # �����ե�������Ǥ��ʤ��褦�ˤ���

stty    erase   '^H'
stty    intr    '^C'
stty    susp    '^Z'

#### bindkey
# bindkey "�����Ƥ�������" �¹Ԥ����뵡ǽ��̾��
bindkey -e    # emacs �������Х����(�Ķ��ѿ� EDITOR ��ȿ�Ǥ��뤬�����ä���ͥ��)
bindkey '^I'    complete-word   # complete on tab, leave expansion to _expand

bindkey '^P' history-beginning-search-backward # ��Ƭ�ޥå��Υҥ��ȥꥵ����
bindkey '^N' history-beginning-search-forward # ��Ƭ�ޥå��Υҥ��ȥꥵ����

# tcsh����Ƭ�ޥå��Υҥ��ȥꥵ����(�������뤬����)
# ���ؤȻפ�������������֤��Խ����뤳�Ȥ�¿�����������ؤ� C-e �Ǥ������٤뤷
# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end

# run-help ���ƤФ줿����zsh ���������ޥ�ɤξ��ϳ������� zsh �Υޥ˥奢��ɽ��
[ -n "`alias run-help`" ] && unalias run-help
autoload run-help

#### completion
_cache_hosts=(localhost $HOST hashish loki3 mercury
  Li He Pt Au Ti{1,2} Ni{1,2} Co{1..8} Zn{1..8}
  192.168.0.1 192.168.1.1
)
#_cache_hosts=(`perl -ne  'if (/^([a-zA-Z0-9.-]+)/) { print "$1\n";}' ~/.ssh/known_hosts`)
# ��(_cache_hosts) ~/.ssh/known_hosts ���鼫ưŪ�˼�������

autoload -U compinit; compinit -u
compdef _tex platex             # platex �� .tex ��


############################################################
## �ץ��ץ�����
unsetopt promptcr       # ���ԤΤʤ����Ϥ�ץ��ץȤǾ�񤭤���Τ��ɤ�
setopt prompt_subst             # ESC���������פ�ͭ���ˤ���

#if [ $TERM = "kterm-color" ] || [ $TERM = "xterm" ]; then
if [ $COLORTERM = 1 ]; then
  if [ $UID = 0 ] ; then 
    PSCOLOR='00;04;31'
  else
    if [ $host = 'hashish' ] ; then
        PSCOLOR='00;04;35'
    elif [ $host = 'mercury' ] ; then
        PSCOLOR='00;04;36'
    elif [ $host = 'Pt' ] ; then
        PSCOLOR='00;04;32'
    else
        PSCOLOR='00;04;33'
    fi
  fi
  RPS1=$'%{\e[${PSCOLOR}m%}[%~]%{\e[00m%}'    # ���ץ��ץ�
  #PS1=$'%{\e]2; %m:%~ \a'$'\e]1;%%: %~\a%}'$'\n%{\e[${PSCOLOR}m%}%n@%m %#%{\e[00m%} '
  #PS1=$'%{\e]2; %m:%~ \a'$'\e]1;%%: %~\a%}'$'\n%{\e[${PSCOLOR}m%}%n@%m ${WINDOW:+"[$WINDOW]"}%#%{\e[00m%} ' #kterm
  PS1=$'%{\e]2; %m:%~ \a'$'\e]1;%%: %~\a%}'$'\n%{\e[${PSCOLOR}m%}%n@%m ${WINDOW:+"[$WINDOW]"}%#%{\e[00m%} '
  # 1���ܤ� $'...' �� ��\e]2;��kterm �Υ����ȥ��\a��
  # 2���ܤ� $'...' �� ��\e]1;�֥�������Υ����ȥ��\a��
  # 3���ܤ� $'...' ���ץ��ץ�
  #
  # \e �� ESC ������(���֤�ɬ�פ����뤫��
  # emacs �Ǥ� C-q ESC, vi �Ǥ� C-v ESC �����Ϥ���
  #       \e[00m  ������֤�
  #       \e[01m  ����    (0�Ͼ�ά��ǽ�äݤ�)
  #       \e[04m  ��������饤��
  #       \e[05m  blink(����)
  #       \e[07m  ȿž
  #       \e[3?m  ʸ�����򤫤���
  #       \e[4?m  �طʿ��򤫤���
  #               ?= 0:��, 1:��, 2:��, 3:��, 4:��, 5:��, 6:��, 7:��
else    
  PS1="%n@%m %~ %# "
fi

############################################################
## alias & function

#### less
alias less="$PAGER"
alias m=less
alias -g L="| less"
alias -g M="| less"
alias les="less"        # for typo


#### man
if which jman >& /dev/null; then
  alias man="LC_ALL=ja_JP.eucJP jman"
fi

#### ps
if [ $ARCHI = "irix" ]; then
  alias psa='ps -ef'
else; 
  alias psa='ps auxw'
fi
function pst() {                # CPU ����Ψ�ι⤤������8��
  psa | head -n 1
  psa | sort -r -n +2 | grep -v "ps -auxww" | grep -v grep | head -n 8
}
function psm() {                # ������ͭΨ�ι⤤������8��
  psa | head -n 1
  psa | sort -r -n +3 | grep -v "ps -auxww" | grep -v grep | head -n 8
}
function psg() {
  psa | head -n 1
  psa | grep $* | grep -v "ps -auxww" | grep -v grep
}

#### ls
#### dircolor
if (which dircolors >& /dev/null) && [ -e $HOME/.dircolors ]; then
  eval `dircolors $HOME/.dircolors` # ��������
fi
if which gnuls >& /dev/null ; then
  alias ls="gnuls -F --color=auto --show-control-char"
  alias lscolor='gnuls -F --color=always --show-control-char'
  # �䴰�ꥹ�Ȥ򥫥顼��
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  #zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} �Ǥ��ɤ���
elif [ $ARCHI = "linux" ]; then
  alias ls="ls -F --color=auto --show-control-char"
  alias lscolor='ls -F --color=always --show-control-char'
  # �䴰�ꥹ�Ȥ򥫥顼��
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
  # alias ls="ls -F"
  alias ls='ls --show-control-chars --color=auto'
  alias lscolor='ls -F'
fi
alias kls='ls'
alias qls='ls' # Shift-PageUp ��ȴ����ΤˤĤ� q ���ǤäƤ��ޤ��Τ����
alias sl='ls'
alias s='ls'
alias lf='ls'
alias l='ls'
alias la='ls -a'
alias ll='ls -al'
function lsl() { lscolor $* | less }
function lll() { lscolor -la $* | less }

#### command
alias df='df -h'
if [ $ARCHI = "linux" ]; then
  alias du='du -h --max-depth=1' # �ʹ֤��ɤ��ɽ����, ����1�γ��ؤޤ�ɽ��
else
  alias du='du -h -d 1'          # �ʹ֤��ɤ��ɽ����, ����1�γ��ؤޤ�ɽ��
fi
alias mv='mv -iv'
#alias  memo    'skkfep -viesc -e jvim3 ~/memo.txt'
function kterm() { /usr/X11R6/bin/kterm -sb -sl 500 -km euc -title kterm@$HOST $* & }
function mlterm() { command mlterm --term=mlterm $* & }
alias mutt='mutt -f ~/Maildir/inbox'
alias xcalc='xcalc &'
alias xterm='xterm &'
#alias w3m="LANG='ja_JP.EUC' w3m -X"
alias xinit='ssh-agent xinit'
alias bell="echo '\a'"
alias scr="screen -xR"
alias view="vim -R"
# short name
alias h='head'
alias t='tail'
alias g='grep'
alias j='jobs'

## global alias
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g C='| cat -n'
alias -g W='| wc'
alias -g ....='../..'
alias -g each_alphabet="a b c d e f g h i j k l m n o p q r s t u v w x y z"
alias -g each_ALPHABET="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
alias -g each_hiragana="�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��\
  �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��\
  �� �� �� �� �� �� �� �� �� �� ��"
alias -g each_katakana="�� �� �� �� �� �� �� �� �� �� �� �� �� �� ��\
  �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��\
  �� �� �� �� �� �� �� �� �� �� ��"
#for example, for i in alphabet ; mv $i* $i/


function cd() { builtin cd $@ && ls; }
alias cd..='cd ..'
alias cd../='cd ..'
function emacs() {command emacs $* &}
alias emasc=emacs
function gv() { command gv $* & }
function gimp() { command gimp $* & }
function mozzila() { command mozilla $* & }
function xdvi() { command xdvi $* & }
#function mpg321() { command mpg321 -s $* | esdcat & }
#function h() { history $* | head -29 | less }
function howm.rb () { nice command howm.rb $* -y -t -H | w3m -T text/HTML }
alias cp='cp -iv'
alias dos2unix="nkf --unix -O --overwrite" # euc-jp, LF
alias unix2dos="nkf --windows -O --overwrite" # shift-jis, CRLF

# bell
function cvsup()       { command cvsup $*       ; echo '\a' }
function make()        { command make $*        ; echo '\a' }
function pkgdb()       { command pkgdb $*       ; echo '\a' }
function portinstall() { command portinstall $* ; echo '\a' }
function emerge()      { command emerge $*      ; echo '\a' }
function rsync()       { command rsync $*       ; echo '\a' }
function tar()         { command tar $*         ; echo '\a' }
function ./configure() { command ./configure $* ; echo '\a' }

function dd()          { command dd $*          ; echo '\a' }

function rm() {
  if [ -d ~/.trash ]; then
    local DATE=`date "+%y%m%d-%H%M%S"`
    mkdir ~/.trash/$DATE
    for i in $@; do
      # �оݤ� ~/.trash/ �ʲ��ʥե�����ʤ�� /bin/rm ��ƤӽФ�������
      if [ -e $i ]; then
        mv $i ~/.trash/$DATE/
      else 
        echo "$i : not found"
      fi
    done
  else
    /bin/rm $@
  fi
}

function finalgrep () {
  local GREPWORD=$1
  shift
  for i in $* ; do
    grep --with-filename $GREPWORD $i | tail -n 1
  done
}

function google() {
  local str opt 
  if [ $# != 0 ]; then # ������¸�ߤ����
    for i in $*; do
      str="$str+$i"
    done    
    str=`echo $str | sed 's/^\+//'` #��Ƭ�Ρ�+�פ���
    opt='search?num=50&hl=ja&ie=euc-jp&oe=euc-jp&lr=lang_ja'
    #opt='search?num=50&hl=ja&ie=utf-8&oe=utf-8&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m http://www.google.co.jp/$opt #�������ʤ���� $opt �϶��ˤʤ�
  # mozilla -remote openURL\(http::/www.google.co.jp/$opt\) # ̤�ƥ���
}
alias ggl=google

function wiki() {
  local str
  if [ $# = 0 ]; then # ������¸�ߤ����
    str="����:Random"
  else
    str=$*
  fi
  w3m http://ja.wikipedia.org/wiki/`echo $str | nkf -w` # utf-8 ���Ѵ�
}
alias wk=wiki

function jpguess() { # ���ܸ�ʸ�������ɤ��¬
  echo "use nkf -g"
  #for i in $* ; do ; echo -n $i ; cat $i | coco -q ; done
  #utf-8 �ե�����򿩤碌��� *sjis*unix ��������
  #��ʬ���Ĥ��Ƥؤ�äݤ�
}

#### time
REPORTTIME=8                    # CPU��8�ðʾ�Ȥä����� time ��ɽ��
TIMEFMT="\
    The name of this job.             :%J
    CPU seconds spent in user mode.   :%U
    CPU seconds spent in kernel mode. :%S
    Elapsed time in seconds.          :%E
    The  CPU percentage.              :%P"

#### ������δƻ�
# log ���ޥ�ɤǤ����򸫤뤳�Ȥ��Ǥ���
watch=(notme) # (all:������notme:��ʬ�ʳ����桼��̾,@�ۥ���̾��%ü��̾
              # (��󡨶�����ڤꡢ�Ҥ��ƽ񤯤�AND���)
LOGCHECK=60                     # �����å��ֳ�[��]
WATCHFMT="%(a:${fg[blue]}Hello %n [%m] [%t]:${fg[red]}Bye %n [%m] [%t])"
# ���Ǥϡ�a (�����󤫥������Ȥ�)�Ǿ��ʬ�����Ƥ���
# %(a:���Υ�å�����:���Υ�å�����)
# a,l,n,m,M �����ѤǤ��롣
# ���Ȥ����ü�ʸ��
# %n    �桼��̾
# %a    ������/�������Ȥ˱����ơ�logged on��/��logged off��
# %l    ���Ѥ��Ƥ���ü��̾
# %M    Ĺ���ۥ���̾
# %m    û���ۥ���̾
# %S��%s        ���δ֤�ȿž
# %U��%u        ���δ֤򥢥�����饤��
# %B��%b        ���δ֤�����
# %t,%@ 12����ɽ���λ���
# %T    24����ɽ���λ���
# %w    ����(���� ��)
# %W    ����(��/��/ǯ)
# %D    ����(ǯ-��-��)


############################################################
## �Ŀ;����ޤ�����
if [ -e ~/.zshrc_private ]; then
  source ~/.zshrc_private
fi
#### end of ~ippei/.zshrc #########################################
