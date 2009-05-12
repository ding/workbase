############ -*- Mode: shell-script; coding: euc-jp -*- ####
# ~ippei/.zshenv
#   written by kishida@imat.eng.osaka-cu.ac.jp
# last-modified: 2006/06/11 23:18:30.
# 修正、改変、再配布何でも可
# cf: man zshall, zshoptions
############################################################
# ~/.zshenv には対話的な機能以外の部分を記述すべき
# 例えば、ssh remote ls とかでリモートホストにコマンドを投げる場合は
# ~/.zshenv のみ有効で ~/.zshrc などは有効にならない
# この場合 ~/.zshenv に PATH の設定がなければ ls は実行できない
############################################################
#### ARCHI
if [ -x /usr/bin/uname ] || [ -x /bin/uname ]; then
    case "`uname -sr`" in
        FreeBSD*); export ARCHI="freebsd" ;;
        Linux*);   export ARCHI="linux"   ;;
        CYGWIN*);  export ARCHI="cygwin"  ;;
        IRIX*);    export ARCHI="irix"    ;;
        OSF1*);    export ARCHI="osf1"    ;;
        *);        export ARCHI="dummy"   ;;
    esac
else
    export ARCHI="dummy"
fi

#### HOST
if [ -x /bin/hostname ]; then
    export HOST=`hostname`
fi;
export host=`echo $HOST | sed -e 's/\..*//'`

export UID
export SHELL=`which zsh`
export CC=`which gcc`
export JLESSCHARSET="japanese"
#export LC_ALL="ja_JP.eucJP"	# subversionに必要
#export LC_ALL="C"	# subversionに必要
export LC_CTYPE="ja_JP.eucJP"	# jman など
#export LC_CTYPE="ja_JP.UTF-8"
#export LC_CTYPE="ja_JP.EUC"	# ←subversion で接続できなくなる
#export LANG="C"
export LANG="ja_JP.eucJP" # vim でエラー：リルが出せない。.vimrc enc で対処
#export LANG="ja_JP.EUC"
#export LANG="japanese" # vim でエラー：ラリルレロが出せない。
#export LANG="ja_JP.UTF-8" # or ja_JP.UTF8
#export XMODIFIERS="@im=skkinput"
case "$ARCHI" in 
	cygwin*);	export LC_ALL=C;;
esac

#### $COLORTERM 
export COLORTERM=0
case "$TERM" in 
    xterm*);	COLORTERM=1 ;;  # putty
    mlterm*);	COLORTERM=1 ; TERM='kterm-color';;
    screen*);	COLORTERM=1 ;;
    ct100*);	COLORTERM=1 ;;	# TeraTermPro
    kterm*);	COLORTERM=1 ; TERM='kterm-color'
      export LANG=ja_JP.eucJP;   #w3m とか mutt とかに必要
      export LC_ALL=ja_JP.eucJP;;
    #vim は TERM='kterm' ではカラー化しない
    #screen は TERM='kterm-color' ではタイトルバーに情報表示できない
esac

#### EDITOR
export EDITOR='vi'
if which vim >& /dev/null ; then	
    alias vi="LC_ALL=ja_JP.EUC vim"
    export EDITOR="LC_ALL=ja_JP.EUC vim"
fi

#### 個人用設定を読み込む
if [ -e ~/.zshenv_private ]; then
    source ~/.zshenv_private
fi
