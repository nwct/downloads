 
linux(){
notice=`curl -s http://www.lu8.win/downloads/frp/gonggao | sed -n 's/gonggao\=//p'`
versiontime=`curl -s http://www.lu8.win/downloads/frp/gonggao | sed -n 's/versiontime\=//p'`
banquan(){
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      欢迎使用linux & mac 系统的frpc启动脚本，                            ::"
echo "::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                    ::"
echo "::      转载请不要删除本信息！      http://www.lu8.win                      ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      作者：☆夢幻煋涳☆        QQ:372763861      $versiontime            ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo "$notice"
echo ""   
}



config_server(){
echo "配置要连接的服务器信息："
server_addr_default="frp.lu8.win"
server_port_default="7000"
privilege_token_default="frp888"

read -p  "服务器地址（默认：$server_addr_default）:" server_addr
read -p  "服务器端口（默认：$server_port_default）:" server_port
read -p  "特权密码（默认：$privilege_token_default）:" privilege_token

cat > "frpc.ini" <<EOF
[common]
server_addr = ${server_addr:-$server_addr_default}
server_port = ${server_port:-$server_port_default}
privilege_token = ${privilege_token:-$privilege_token_default}
log_file = frpc.log
log_level = info
log_max_days = 3

EOF
echo ""
read -p  "配置完成，按回车键继续配置本地信息！"
}
config_client_http_https(){
echo "配置 $type 模式映射（请记住 访问域名 以便启动后访问）："
suiji=$RANDOM
if 	[ "$suiji" = "" ];then 
suiji=1$(date "+%M%S")
fi
local_ip_default="127.0.0.1"
local_port_default="80"
read -p  "本地IP（默认：$local_ip_default）:" local_ip
read -p  "本地端口（默认：$local_port_default）:" local_port
read -p  "访问域名（默认：${custom_domains:-$suiji}.${server_addr:-$server_addr_default}）:" custom_domains
cat >> "frpc.ini" <<EOF
[$type_$suiji]
privilege_mode = true
type = $type
local_ip = ${local_ip:-$local_ip_default}
local_port = ${local_port:-$local_port_default}
use_gzip = true
use_encryption = true
authentication_timeout = 0
custom_domains = ${custom_domains:-$suiji.${server_addr:-$server_addr_default}}
#host_header_rewrite = $custom_domains

EOF

echo ""
read -p  "配置完成，按回车键继续选择！"
 

}


config_client_tcp_udp(){
echo "配置 $type 模式映射（请记住 远程端口 以便启动后访问）："
suiji=$RANDOM
if 	[ "$suiji" = "" ];then 
suiji=1$(date "+%M%S")
fi
local_ip_default="127.0.0.1"
local_port_default="22"
remote_port_default=$suiji

read -p  "本地IP（默认：$local_ip_default）:" local_ip
read -p  "本地端口（默认：$local_port_default）:" local_port
read -p  "远程端口（默认：$remote_port_default）:" remote_port
cat >> "frpc.ini" <<EOF
[$type_$suiji]
privilege_mode = true
type = $type
local_ip = ${local_ip:-$local_ip_default}
local_port = ${local_port:-$local_port_default}
use_gzip = true
use_encryption = true
authentication_timeout = 0
remote_port = ${remote_port:-$remote_port_default}

EOF
echo ""
read -p  "配置完成，按回车键继续选择！"
}


config_client_stcp_xtcp(){
echo "配置 $type 模式映射（请保持服务端和访问端的 sk 相同）："
suiji=$RANDOM
if 	[ "$suiji" = "" ];then 
suiji=1$(date "+%M%S")
fi
local_ip_default="127.0.0.1"
local_port_default="80"
sk_default=$suiji
echo ""
for num in "V v"
do
read -p "要配置 $type 模式的访问端请输入v, 否则直接回车配置为服务端." num
done
if [ "$num" == "V" -o "$num" == "v" ]; then {
role=visitor 
echo ""
echo -e "\033[31m 当前配置的是 $type 模式的访问端 \033[0m"
echo ""
} else {
role=server 
echo ""
echo -e "\033[31m 当前配置的是 $type 模式的服务端 \033[0m"
echo ""
}
fi
	
read -p  "本地IP（默认：$local_ip_default）:" local_ip
read -p  "本地端口（默认：$local_port_default）:" local_port
read -p  "sk（默认：$sk_default）:" sk

if [ "$role" = "server" ];then {
role_info=""
servername=""
visitor=""
local_ip_info=local_ip
local_port_info=local_port
} else {
visitor="_visitor"
read -p  "请输入要访问的服务端隧道名称:" server_name
servername="server_name = $server_name"
role_info="role = visitor"
local_ip_info=bind_addr
local_port_info=bind_port
}
fi

cat >> "frpc.ini" <<EOF
[$type_$suiji$visitor]
type = $type
sk = ${sk:-$sk_default}
$local_ip_info = ${local_ip:-$local_ip_default}
$local_port_info = ${local_port:-$local_port_default}
$role_info
$servername
EOF
echo ""
read -p  "配置完成，按回车键继续选择！"
}

banbencheck(){
	#新版本为token
	versionnew="0.18.0"

	versionnew1=`echo $versionnew|awk -F "." '{print $1}'`
	versionnew2=`echo $versionnew|awk -F "." '{print $2}'`
	versionnew3=`echo $versionnew|awk -F "." '{print $3}'`
	
	version=`./frpc -v`
	version1=`echo $version|awk -F "." '{print $1}'`
	version2=`echo $version|awk -F "." '{print $2}'`
	version3=`echo $version|awk -F "." '{print $3}'`

	authentication="privilege_token"
	
	if [ $version1 -gt $versionnew1 ]; then
	authentication="token"
	fi

	if [ $version2 -gt $versionnew2 -a $version1 -ge $versionnew1 ]; then
	authentication="token"
	fi
	
	if [ $version3 -ge $versionnew3 -a $version2 -ge $versionnew2 -a $version1 -ge $versionnew1 ]; then
	authentication="token"
	fi
	
	
	
	if [ $authentication = "token" ];then
	sed -i 's/privilege_token/token/g' frpc.ini
	sed -i -e "s/privilege_mode = true//g" frpc.ini
	fi
}

run(){
	kill -9 $(pidof frpc)
	rm -rf frpc.log
	banbencheck
	clear
	banquan
	echo ""
	echo "后台运行frpc中..."
	echo ""
	chmod 777 frpc
	nohup ./frpc -c ./frpc.ini & exit | exit
	sleep 3
	cat frpc.log
	echo ""
	ver=`./frpc -v`
	echo "目前使用的frpc程序版本是：$ver"
	echo ""
	read -p  "以上是运行日志，按回车键查看映射后的相关信息！"
	echo ""	
	clear
	banquan
	echo ""
	sed -n 's/type \= /穿透的类型\:/p;s/custom_domains \= /穿透后的域名为\:/p;s/remote_port \= /穿透后的端口为\:/p' frpc.ini
	echo ""	
	read -p  "以上是映射信息，按回车键退出当前显示！"
	echo ""	
	config
}

start_up_1(){

			clear
			banquan
			lujing=$(pwd)
			if [ $lujing = "/" ];then
			lujing=""
			fi
			rc_local=$(find / -name rc.local -type f)
			if [ $rc_local = "" ];then
			rc_local=$(find / -name rc -type f)
			fi
			
			echo "以下是前期已经添加过的frpc开机启动信息："
			sed -n '/frpc/p' "$rc_local"
			sed -i '/此条frpc开机启动 由 ☆夢幻煋涳☆ 制作/d' "$rc_local"
			cat "$rc_local" | grep "exit"
			if [ $? -eq 0 ];then	
			sed -i '/exit/i\'$lujing'\/frpc \-c '$lujing'\/frpc.ini \&	\#此条frpc开机启动 由 ☆夢幻煋涳☆ 制作 http\:\/\/www.lu8.win' "$rc_local" 	
			else
			sed -i '$a\'$lujing'\/frpc \-c '$lujing'\/frpc.ini \&	\#此条frpc开机启动 由 ☆夢幻煋涳☆ 制作 http\:\/\/www.lu8.win' "$rc_local"
			fi
			echo ""
			echo "已将 '$lujing/frpc -c $lujing/frpc.ini &' 添加至开机启动文件 $rc_local"
			echo ""
			chmod 777 $rc_local
			echo "请按回车键返回配置列表"
			read
			config

}

start_up_2(){
			
			clear
			banquan
			lujing=$(pwd)
			if [ $lujing = "/" ];then
			lujing=""
			fi		
			init=$(find / -name init.d -type d|awk 'NR==1{print}')
			
			
			
cat > "$init/frpc" <<EOF
#!/bin/sh  
START=50
PIDF=\` ps  -A | grep frpc | awk '{print \$1}'\`

case "\$1" in
			
start)
		
		rm -rf $lujing/frpc.log
		touch $lujing/frpc.log
		nohup $lujing/frpc -c $lujing/frpc.ini &
		echo "frps启动完成"			
		;;

stop)
		kill -3 \$PIDF
		rm -rf $lujing/frpc.log
		touch $lujing/frpc.log
		echo "frps已经关闭"		
		;;

restart)
		\$0 stop
		sleep 1
		\$0 start
		;;

status)
		ps -fe|grep $lujing/frpc.ini |grep -v grep
		if [ \$? -ne 0 ]
		then 
		echo "frpc未启动"
		else
		echo "frpc已启动"
		cat $lujing/frpc.log
		fi
		;;
esac

EOF

chmod 777 $init/frpc
			
			
			
			rc3=$(find / -name rc3.d -type d|awk 'NR==1{print}')
			if [ $rc3 = "" ];then
			rc3=$(find / -name rc.d -type d|awk 'NR==1{print}')
			fi
			
			rm -rf $rc3/S50frpc
			sleep 1
			ln -s $init/frpc $rc3/S50frpc
			
	echo "添加开机启动成功！"		
			

}


config(){
	clear
	banquan
	echo " 请选择你要的操作："
	echo "     1、配置要连接的服务器"
	echo "     2、配置http模式映射"
	echo "     3、配置https模式映射"
	echo "     4、配置tcp模式映射"
	echo "     5、配置udp模式映射"
	echo "     6、配置stcp模式映射"
	echo "     7、配置xtcp模式映射"
	echo "     8、配置完成后台启动程序"
	echo "     9、更换frpc程序版本"
	echo "     a、将frpc加入开机启动"
	echo "     b、退出"
	echo ""
	echo " 备注：配置过程中若使用默认值，请直接按回车键!"
	echo ""
	read num
	case "$num" in
		[1] )
			config_server
			config			
		;;
		[2] )
			type=http
			config_client_http_https
			config			
		;;
		[3] )
			type=https
			config_client_http_https
			config			
		;;
		[4] )
			type=tcp
			config_client_tcp_udp
			config			
		;;
		[5] )
			type=udp
			config_client_tcp_udp
			config			
		;;
		[6] )
			type=stcp
			config_client_stcp_xtcp
			config			
		;;
		[7] )
			type=xtcp
			config_client_stcp_xtcp
			config			
		;;
		[8] )
			if [ ! -f frpc ];then
				version_select
			fi
			
			run
		;;
		[9] )
			kill -9 $(pidof frpc)
			rm -rf frpc
			version_select
			run
		;;
		[a] )
			start_up_2
			
		;;
		[b] )
			rm $0 & exit
			
		;;
		*) echo "选择错误，退出";;
	esac
config
}


download(){
			clear
			banquan
			echo ""
			echo "正在为你下载 $os 系统 $version 版frpc程序"
			echo ""
			curl -# -o frpc http://www.lu8.win/downloads/frp/$os/$version/frpc
			if [ $? == 0 ];then				
				run
				else				
				echo "下载失败,请到http://www.lu8.win手动下载程序。"
				echo ""
				echo "请按回车键返回配置"
				read
				config
			fi
}



os_select(){
	clear
	banquan
	CPU=`uname -m`
	OS=`uname -s`
	
	if [ "$CPU" = "i686" -o "$CPU" = "x86_64" ];then
				
			if [ "$OS" = "Darwin" ];then
				
				ECHOcolor6="-e"
				ECHOstart6="\033[33m"
				ECHOend6="\033[0m"
				echo "\033[33m 你的系统是:$OS CPU架构:$CPU 建议选择选项 6 \033[0m"
				
			else
				
				ECHOcolor1="-e"
				ECHOstart1="\033[33m"
				ECHOend1="\033[0m"
				echo -e "\033[33m 你的系统是:$OS CPU架构:$CPU 建议选择选项 1 \033[0m"
			fi
				
	fi
	CPUinfo=`uname -m|grep arm`
	if [ "$CPUinfo" != "" ];then
				
				ECHOcolor2="-e"
				ECHOstart2="\033[33m"
				ECHOend2="\033[0m"
				echo -e "\033[33m 你的系统是:$OS CPU架构:$CPU 建议选择选项 2 \033[0m"
	fi
	CPUinfo=`uname -m|grep mips`
	if [ "$CPUinfo" != "" ];then
				
				ECHOcolor5="-e"
				ECHOstart5="\033[33m"
				ECHOend5="\033[0m"
				echo -e "\033[33m 你的系统是:$OS CPU架构:$CPU 建议选择选项 5 \033[0m"
	fi
	
	echo ${ECHOcolor5} ${ECHOstart5} ${ECHOend5}
	
	echo ""
	echo ""
	echo "请选择你的系统类型："
	echo ""
	echo ${ECHOcolor1} "${ECHOstart1}1、linux${ECHOend1}"
	echo ${ECHOcolor2} "${ECHOstart2}2、linux-arm${ECHOend2}"
	echo ${ECHOcolor3} "${ECHOstart3}3、linux-mips${ECHOend3}"
	echo ${ECHOcolor4} "${ECHOstart4}4、linux-mipsle${ECHOend4}"
	echo ${ECHOcolor5} "${ECHOstart5}5、linux-mips32le${ECHOend5}"
	echo "${ECHOstart6}6、mac os${ECHOend6}"
	echo ""
	echo "     备注：直接按回车键返回配置"
	echo ""
	read num
	case "$num" in
		[1] )
			os=linux
			download
		;;
		[2] )
			os=linux-arm
			download
		;;
		[3] )
			os=linux-mips
			download
		;;
		[4] )
			os=linux-mipsle
			download
		;;
		[5] )
			os=linux-mips32le
			download
		;;
		[6] )
			os=mac
			download
		;;
		
		*) echo "选择错误，退出";;
	esac
config
}
	
	

version_select(){

	clear
	banquan
	echo ""
	echo "未检测到该目录下有frpc程序，请下载..."
	echo ""
	echo "请选择你要下载的frpc的版本："
	echo ""
	echo "     1、V 0.9.3 "
	echo "     2、V 0.16.1"
	echo "     3、V 0.21.0"
	echo ""
	echo "     备注：直接按回车键返回配置"
	echo ""
	read num
	case "$num" in
		[1] )
			
			version=0.9.3
			os_select
			
		;;
		[2] )
		
			version=0.14.1
			os_select
			
		;;
		[3] )
		
			version=0.21.0
			os_select
			
		;;
		*) echo "选择错误，退出";;
	esac
os_select
}

config
clear 
}
linux
