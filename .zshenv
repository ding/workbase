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
export MANPATH="/usr/local/man:/usr/X11R6/man:/usr/share/man"
export NLSPATH="/usr/local/man:/usr/X11R6/man:/usr/share/man"
export INFOPATH="$HOME/info:/usr/share/info:/usr/local/info"
export HTTP_HOME="$HOME/.w3m/bookmark.html" # for w3m
export FTP_PASSIVE_MODE="NO"
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
export GNUSTEP_USER_ROOT="$HOME/.GNUstep"

export LD_LIBRARY_PATH="/opt/intel_fc_80/lib:/opt/intel_fc_81/lib:\
/usr/lib:/usr/lib/compat/aout:\
/usr/X11R6/lib:/usr/X11R6/lib/aout:\
/usr/local/lib:/usr/local/lib/compat/pkg"

#### $PAGER	"less"  
# less -M はページのステータス(何ページ目か)の表示
if which jless >& /dev/null ; then
    export PAGER="jless -RM --quiet -x2"
elif which less >& /dev/null ;  then
    export PAGER="less -RM --quiet -x2"
else
    export PAGER="more -x2"
fi

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
 
####  path / PATH
# システムから提供される PATH およびユーザが定義する複数の候補から、
# 実際にシステムに存在するディレクトリに対してのみ PATH に追加する
# この際重複チェックを行い、同一のディレクトリが含まれないようにしている
userpath=( \			# 配列に候補を入れる
    $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin \
    $HOME/bin $HOME/private/bin \
    $HOME/tanaka-share/trunk/ruby \
    /usr/X11R6/bin /usr/games \
    /usr/bsd /usr/bin/X11 /usr/bin/X11 /usr/i18n/bin /home/program/bin \
    /usr/users/program/msi/MS21/CASTEP/bin \
    /usr/people/msi/cerius2_4.2MS/bin \
    /usr/opt/MPI195/bin /usr/local/MPICH/bin \
    /usr/home/program/VASP/bin /usr/home/program/msi/MS22/CASTEP/bin \
    /cygdrive/d/DVXA/EXEC \
	)
addpath=()			# 確定した候補を入れていく受け皿
for i in "${userpath[@]}"; do	# 受け皿に追加していく
    chksame=0
    if [ -d $i ]; then		# システムにディレクトリが存在しなければ飛ばす
	for j in "${path[@]}"; do
	    if [ $i = $j ]; then # 重複しているなら重複フラグを立てておく
		chksame=1
		break
	    fi
	done
	if [ $chksame = 0 ] ; then # 重複フラグが立ってなければ受け皿に追加
	    addpath=( $addpath $i )
	fi
    fi
done
path=( $path $addpath )
unset userpath addpath i chksame # 後始末

# for XCrySDen
XCRYSDEN_TOPDIR=/usr/local/xcrysden/XCrySDen-1.4.1bin-static
XCRYSDEN_SCRATCH=/tmp/xcrys_tmp
export XCRYSDEN_TOPDIR XCRYSDEN_SCRATCH
PATH="$XCRYSDEN_TOPDIR:$PATH:$XCRYSDEN_TOPDIR/scripts:$XCRYSDEN_TOPDIR/util"


#### 個人用設定を読み込む
if [ -e ~/.zshenv_private ]; then
    source ~/.zshenv_private
fi
