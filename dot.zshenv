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

#### �Ŀ���������ɤ߹���
if [ -e ~/.zshenv_private ]; then
    source ~/.zshenv_private
fi
