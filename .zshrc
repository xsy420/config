export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="rkj-repos"
#ZSH_THEME="random"
#ZSH_THEME="agnoster"
#ZSH_THEME="jaischeema"
#ZSH_THEME="humza"
#ZSH_THEME_RANDOM_CANDIDATES=(
#	robbyrussell
#	#rkj-repos
#	jaischeema
#	)

if [[ `/usr/bin/ls -A /mnt ` ]] ; then
  ZSH_THEME="agnoster"
else
  ZSH_THEME="robbyrussell"
  # 如果Linux安装了xorg-xinit,设置开机自启
  if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ -f /usr/bin/startx ]; then
    exec startx
  fi
fi

# 如果没有安装zsh插件，自动clone

if [[ ! -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]] ; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi
if [[ ! -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]] ; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

plugins=(
	alias-finder
	archlinux
	docker
	git
	history
	mvn
	npm
	z
	zsh-autosuggestions
	zsh-syntax-highlighting
	)

source $ZSH/oh-my-zsh.sh

if [[ `/usr/bin/ls -A /mnt ` ]] ; then
	alias cmd='/mnt/c/Windows/System32/cmd.exe'
	alias wsl='/mnt/c/Windows/System32/wsl.exe'
	alias net='/mnt/c/Windows/System32/net.exe'
	alias reboot='shutdown.exe /r /t 0'
  	alias winget='/mnt/c/Users/12597/AppData/Local/Microsoft/WindowsApps/winget.exe'
	alias wsls='wsl --shutdown'
	alias wslr='wsl --unregister'
	alias docker='/mnt/c/Program\ Files/Docker/Docker/resources/bin/docker.exe'
  	alias gh='/mnt/c/Program\ Files/GitHub\ CLI/gh.exe'
	alias python.exe='/mnt/d/py/venv/Scripts/python.exe'
  password=`cat /mnt/e/mysql-8.0.26-winx64/PASSWORD`
	if [[ -f /usr/sbin/mysql ]] ; then
		alias ml='mysql -uroot -p'$password
		alias wml='/mnt/e/mysql-8.0.26-winx64/bin/mysql.exe -uroot -p'$password
	else
		alias ml='/mnt/e/mysql-8.0.26-winx64/bin/mysql.exe -uroot -p'$password
	fi
	alias pipInstall='python.exe -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
	if ! echo $PATH | grep -q "/mnt/d/py/venv/Scripts" ; then
		export PATH=$PATH:/mnt/d/py/venv/Scripts
	fi
	# 映射wsl的ip地址到localhost
	ipaddr=$(ip a | grep 'inet ' | grep 'eth0' | awk '{print $2}' | awk -F/ '{print $1}')
	sed -i '/localhost/d' /mnt/c/Windows/System32/drivers/etc/hosts
	echo "$ipaddr localhost" >> /mnt/c/Windows/System32/drivers/etc/hosts
fi

alias c='printf "\033c"'
alias hc='history -c && c'
alias ls='exa -g --icons'
unalias la
#alias ls='ls --color=auto'
#alias vim8='/home/test/.local/bin/vim'
#alias vim=vim8
alias vi=nvim
alias pipinstall='python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
alias ttyd='ttyd zsh'
alias mwget='mwget -n20'
#alias s=screenfetch
alias s=neofetch
alias ra=ranger
alias q='omz reload'
alias lg='lazygit'
if ! echo $LD_LIBRARY_PATH | grep -q "/usr/local/lib64" ; then
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64
fi
export JAVA_HOME=/opt/jdk
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib:$CLASSPATH
if ! echo $PATH | grep -q $JAVA_HOME ; then
	export PATH=$PATH:$JAVA_HOME/bin:${JRE_HOME}/bin
fi
#export GO_HOME=/usr/local/go
export GOPROXY=https://goproxy.io
export RANGER_LOAD_DEFAULT_RC=FALSE
#if ! set | grep -q TMUX ; then
#	tmux
#fi

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR='/usr/bin/nvim'
alias javadebug='java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y'

if ! echo $PATH | grep -q ~/.local/bin; then
	export PATH=$PATH:~/.local/bin
fi

if [ -f /usr/bin/npm ] ; then
  if [ -f /usr/bin/cnpm ] ; then
  else
    echo 'installing cnpm'
    sudo npm install -g cnpm -registry=https://registry.npm.taobao.org
  fi
fi

# Big Data
# Hadoop
export HADOOP_HOME=/opt/hadoop
export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native
export JAVA_LIBRARY_PATH=${HADOOP_HOME}/lib/native
if ! echo $PATH | grep -q $HADOOP_HOME ; then
	export PATH=$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
fi
# Spark
export SPARK_HOME=/opt/spark
if ! echo $PATH | grep -q $SPARK_HOME ; then
	export PATH=$PATH:${SPARK_HOME}/bin
fi
alias start-spark.sh=${SPARK_HOME}/sbin/start-all.sh
alias stop-spark.sh=${SPARK_HOME}/sbin/stop-all.sh
# Scala
export SCALA_HOME=/opt/scala
if ! echo $PATH | grep -q $SCALA_HOME ; then
	export PATH=$PATH:${SCALA_HOME}/bin
fi
# export TERM=xterm-color
alias sc=scala
# Maven
export MAVEN_HOME=/opt/maven
if ! echo $PATH | grep -q $MAVEN_HOME ; then
	export PATH=$PATH:$MAVEN_HOME/bin
fi
#if ! ps -x | grep -q /init ; then
#	s
#fi

# NLTK

if ! echo $PATH | grep -q /root/nltk_data ; then
	export PATH=$PATH:/root/nltk_data
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == */root/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/root/.fzf/bin"
fi

if [[ -d /root/.fzf ]] ; then
  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "/root/.fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  # ------------
  source "/root/.fzf/shell/key-bindings.zsh"
fi
