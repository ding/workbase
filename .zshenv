############ -*- Mode: shell-script; coding: euc-jp -*- ####
# ~ippei/.zshenv
#   written by kishida@imat.eng.osaka-cu.ac.jp
# last-modified: 2006/06/11 23:18:30.
# ���������ѡ������۲��Ǥ��
# cf: man zshall, zshoptions
############################################################
# ~/.zshenv �ˤ�����Ū�ʵ�ǽ�ʳ�����ʬ�򵭽Ҥ��٤�
# �㤨�С�ssh remote ls �Ȥ��ǥ�⡼�ȥۥ��Ȥ˥��ޥ�ɤ��ꤲ�����
# ~/.zshenv �Τ�ͭ���� ~/.zshrc �ʤɤ�ͭ���ˤʤ�ʤ�
# ���ξ�� ~/.zshenv �� PATH �����꤬�ʤ���� ls �ϼ¹ԤǤ��ʤ�
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
#export LC_ALL="ja_JP.eucJP"	# subversion��ɬ��
#export LC_ALL="C"	# subversion��ɬ��
export LC_CTYPE="ja_JP.eucJP"	# jman �ʤ�
#export LC_CTYPE="ja_JP.UTF-8"
#export LC_CTYPE="ja_JP.EUC"	# ��subversion ����³�Ǥ��ʤ��ʤ�
#export LANG="C"
export LANG="ja_JP.eucJP" # vim �ǥ��顼����뤬�Ф��ʤ���.vimrc enc ���н�
#export LANG="ja_JP.EUC"
#export LANG="japanese" # vim �ǥ��顼���������Ф��ʤ���
#export LANG="ja_JP.UTF-8" # or ja_JP.UTF8
#export XMODIFIERS="@im=skkinput"
export GNUSTEP_USER_ROOT="$HOME/.GNUstep"

export LD_LIBRARY_PATH="/opt/intel_fc_80/lib:/opt/intel_fc_81/lib:\
/usr/lib:/usr/lib/compat/aout:\
/usr/X11R6/lib:/usr/X11R6/lib/aout:\
/usr/local/lib:/usr/local/lib/compat/pkg"

#### $PAGER	"less"  
# less -M �ϥڡ����Υ��ơ�����(���ڡ����ܤ�)��ɽ��
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
      export LANG=ja_JP.eucJP;   #w3m �Ȥ� mutt �Ȥ���ɬ��
      export LC_ALL=ja_JP.eucJP;;
    #vim �� TERM='kterm' �Ǥϥ��顼�����ʤ�
    #screen �� TERM='kterm-color' �Ǥϥ����ȥ�С��˾���ɽ���Ǥ��ʤ�
esac

#### EDITOR
export EDITOR='vi'
if which vim >& /dev/null ; then	
    alias vi="LC_ALL=ja_JP.EUC vim"
    export EDITOR="LC_ALL=ja_JP.EUC vim"
fi
 
####  path / PATH
# �����ƥफ���󶡤���� PATH ����ӥ桼�����������ʣ���θ��䤫�顢
# �ºݤ˥����ƥ��¸�ߤ���ǥ��쥯�ȥ���Ф��ƤΤ� PATH ���ɲä���
# ���κݽ�ʣ�����å���Ԥ���Ʊ��Υǥ��쥯�ȥ꤬�ޤޤ�ʤ��褦�ˤ��Ƥ���
userpath=( \			# ����˸���������
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
addpath=()			# ���ꤷ�����������Ƥ���������
for i in "${userpath[@]}"; do	# ���������ɲä��Ƥ���
    chksame=0
    if [ -d $i ]; then		# �����ƥ�˥ǥ��쥯�ȥ꤬¸�ߤ��ʤ�������Ф�
	for j in "${path[@]}"; do
	    if [ $i = $j ]; then # ��ʣ���Ƥ���ʤ��ʣ�ե饰��Ω�ƤƤ���
		chksame=1
		break
	    fi
	done
	if [ $chksame = 0 ] ; then # ��ʣ�ե饰��Ω�äƤʤ���м��������ɲ�
	    addpath=( $addpath $i )
	fi
    fi
done
path=( $path $addpath )
unset userpath addpath i chksame # �����

# for XCrySDen
XCRYSDEN_TOPDIR=/usr/local/xcrysden/XCrySDen-1.4.1bin-static
XCRYSDEN_SCRATCH=/tmp/xcrys_tmp
export XCRYSDEN_TOPDIR XCRYSDEN_SCRATCH
PATH="$XCRYSDEN_TOPDIR:$PATH:$XCRYSDEN_TOPDIR/scripts:$XCRYSDEN_TOPDIR/util"


#### �Ŀ���������ɤ߹���
if [ -e ~/.zshenv_private ]; then
    source ~/.zshenv_private
fi
