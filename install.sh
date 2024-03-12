# =============================================
# 安装包和概述(英文是因为终端一开始无法解析中文)
# =============================================

# 定义包含备注的关联数组（字典）
declare -A base_packages
base_packages["git"]="Git tools"
base_packages["paru"]="AUR helper with minimal dependencies"
base_packages["zsh"]="zsh"

# fonts
declare -A fonts_packages
fonts_packages["wqy-zenhei"]="Chinese Font , WenQuanYi Zen Hei, an excellent Chinese font."
fonts_packages["adobe-source-han-serif-cn-fonts"]="Chinese Font ,Adobe Source Han Serif, an open-source Chinese-supporting font released by Adobe."
fonts_packages["noto-fonts-cjk"]="English Font ,Noto CJK font, containing fonts that support Chinese, Japanese, and Korean characters."
fonts_packages["noto-fonts-emoji"]="Noto Emoji font, containing a wide variety of emoji symbols."
fonts_packages["noto-fonts-extra"]="Noto Extra font, the additional extension fonts of the Noto font family."
fonts_packages["ttf-nerd-fonts-symbols"]="Nerd Fonts ,Display special icons on the waybar"
fonts_packages["ttf-dejavu"]="DejaVu Font , best terminal fonts, for alacritty "
fonts_packages["terminus-font"]="console fonts ter-*"

# 窗口管理器需要
declare -A wm_packages
wm_packages["hyprland-git"]="Hyprland window manager"
wm_packages["alacritty"]="Terminal emulator"
wm_packages["rofi"]="App Menu"
wm_packages["swaybg"]="wallapper"
wm_packages["waybar"]="Status bar"
wm_packages["dunst"]="Notification daemons"
wm_packages["grim"]="screenshot tools 1"
wm_packages["slurp"]="screenshot tools 2"
wm_packages["swappy"]="screenshot tools 3"
wm_packages["swaylock"]="lock screen"

# 输入法
declare -A fcitx5_packages
fcitx5_packages["fcitx5-im"]="Fcitx5 input method"
fcitx5_packages["fcitx5-chinese-addons"]="Chinese add-ons for Fcitx5 Input Method Framework"
fcitx5_packages["fcitx5-pinyin-zhwiki"]="Chinese dict"
fcitx5_packages["fcitx5-material-color"]="Windows skin , The best looking"

# 驱动
declare -A firmware_packages
firmware_packages["xf86-video-nouveau"]="NVidia Firmware ,Open source 3D acceleration driver"
firmware_packages["mesa"]="NVidia Firmware ,An open-source implementation of the OpenGL specification"
firmware_packages["xf86-input-libinput"]="Input Firmware , X.Org input driver for libinput"
firmware_packages["libinput"]="Input Firmware ,Input device management and event handling library"

# 部分工具
declare -A require_tools_packages
require_tools_packages["bluez"]="Bluetooth ,Official Linux Bluetooth protocol stack"
require_tools_packages["bluez-utils"]="Bluetooth ,Utilities for controlling the Bluetooth protocol stack"
require_tools_packages["brightnessctl"]="Backlight ,Tool to control backlight brightness"
require_tools_packages["acpi"]="Battery , Client for Advanced Configuration and Power Interface"
require_tools_packages["network-manager-applet"]="Network Tray ,GNOME front-end for NetworkManager"
require_tools_packages["udisks2"]="Disk , Disk management service"
require_tools_packages["polkit-gnome"]="gui authentication ,require"
require_tools_packages["arc-icon-theme"]="Arc icon theme. Official releases only"

# audio
declare -A audio_packages
audio_packages["pamixer"]="PulseAudio mixer command-line utility"
audio_packages["playerctl"]="Command-line utility to control media players"
audio_packages["pulseaudio"]="A featureful, general-purpose sound server"
audio_packages["alsa-utils"]="Utilities for configuring and using ALSA"
audio_packages["alsa-firmware"]="Firmware files for ALSA drivers"
audio_packages["sof-firmware"]="Firmware files for Sound Open Firmware (SOF) compatible audio hardware"
audio_packages["alsa-ucm-conf"]="ALSA Use Case Manager configuration files"
audio_packages["udev"]="Device manager for the Linux kernel"

# tools
declare -A tools_packages
tools_packages["google-chrome"]="Web browser developed by Google"
tools_packages["telegram-desktop"]="Telegram Desktop messaging app"
tools_packages["code"]="Visual Studio Code, a powerful code editor"
tools_packages["v2raya"]="A simple V2Ray client for Linux"
tools_packages["wps-office-cn"]="WPS Office suite (Chinese version)"
tools_packages["ttf-wps-fonts"]="WPS Office fonts package"
tools_packages["wps-office-mui-zh-cn"]="WPS Office multi-language support (Chinese)"
tools_packages["vmware-workstation"]="Virtualization software for running multiple operating systems on a single PC"
tools_packages["wl-clipboard"]="copy"

declare -A hacktools_packages
tools_packages["gnu-netcat"]="Netcat"
tools_packages["nmap"]="Nmap"

# 初始化
init_actions=(
    "paru -S --noconfirm archlinuxcn-keyring"
    "sudo pacman -Syy"
)


# 命令数组
actions=(
    "sudo mv $HOME/hypr/.config $HOME/"
    "sudo mv $HOME/hypr/etc/environment /etc/"
    "sudo rm -fr /etc/fonts"
    "sudo mv $HOME/hypr/etc/fonts /etc/"
    "sudo systemctl enable v2raya.service"
    "sudo systemctl start v2raya.service"
    "sudo systemctl enable bluetooth"
    "sudo systemctl start bluetooth"
    "sudo modprobe -a vmw_vmci vmmon"
    "sudo ln -s $HOME/.config/hypr/start_hypr.sh /usr/bin/start_hypr"
)

logo() {
    clear
    base_dir=$(pwd)
    logo=$(cat $base_dir/logo.txt)
    echo -e "\e[34m$logo\e[0m"
    echo
}

# =============================================
# 彩色显示
# =============================================
# 白色
debug() {
    if [ $# -eq 2 ]; then
        echo -e "[$1] $2"
    elif [ $# -eq 3 ]; then
        echo -e "[$1] [\e[33m$2\e[0m] $3"
    fi
}
# 蓝色
info() {
    if [ $# -eq 1 ]; then
        echo -e "\e[34m[+] $1\e[0m"
    elif [ $# -eq 2 ]; then
        echo -e "\e[34m[+] [\e[33m$1\e[0m\e[34m] $2\e[0m"
    fi
}
# 绿色
success() {
    if [ $# -eq 1 ]; then
        echo -e "\e[32m[*] \e[1m$1\e[22m\e[0m"
    elif [ $# -eq 2 ]; then
        echo -e "\e[32m[*] [\e[33m$1\e[0m\e[32m] \e[1m$2\e[22m\e[0m"
    fi
}
# 红色
error() {
    if [ $# -eq 1 ]; then
        echo -e "\e[31m[-] $1\e[0m"
    elif [ $# -eq 2 ]; then
        echo -e "\e[31m[-] [\e[33m$1\e[0m\e[31m] \e[1m$2\e[22m\e[0m"
    fi
}

# =============================================
# 执行的核心函数
# =============================================

# install "展示的分类名" "包列表(字典名字)"
install() {
    success "Installing '$1' list"
    echo "-------------------------------------------------------"
    local -n packages=$2 # 通过引用赋值将参数作为关联数组处理

    # 找到最长的键名长度 填充对齐用
    max_length=0
    for package in "${!packages[@]}"; do
        length=${#package}
        if ((length > max_length)); then
            max_length=$length
        fi
    done

    # 输出每个包及其备注，按照最长的键名长度进行格式化对齐
    num=1
    total=${#package}
    for package in "${!packages[@]}"; do
        padding_length=$((max_length - ${#package} + 2)) # 加2是为了添加括号和空格的长度
        padding=$(printf '%*s' $padding_length '')

        # 检查是否已安装
        if pacman -Q "$package" >/dev/null 2>&1; then
            echo -e "[$num/$total] [\e[33m$1\e[0m] \e[31m$package\e[0m ${padding} \e[32mAlready exists\e[0m (paru -S --noconfirm $package)"
        # 安装,若安装是失败就报错退出
        else
            echo -e "[$num/$total] [\e[33m$1\e[0m] \e[31m$package\e[0m ${padding} \e[32m${packages[$package]}\e[0m (paru -S --noconfirm $package)"
            if ! paru -S --noconfirm "$package" >/dev/null 2>&1; then
                error $package "Installation failed"
                exit 1
            fi
        fi
        ((num += 1))
    done
    # 打印空行和下面操作区别开来
    echo
}

# 执行安装后的系统操作,如服务开机启动等
do_actions() {
    success "Executing '$1' action list"
    echo "-------------------------------------------------------"
    local -n arr=$2 # 使用引用来传递数组变量
    num=1
    total=${#arr[@]}
    for action in "${arr[@]}"; do
        echo -e "[$num/$total] [\e[33m$1\e[0m] [\e[31m$action\e[0m]"
        eval "$action" >/dev/null 2>&1 # 使用 eval 执行字符串命令
        if [ $? -ne 0 ]; then
            error "$action" "exec error"
            exit 1
        fi
        ((num += 1))
    done
    echo
}

show_packages() {
    success "Show the packages of $1:"
    echo "-------------------------------------------------------"

    local -n package_container=$2 # 通过引用赋值将参数作为关联数组处理

    # 展示某个字典的所有包
    max_length=0
    for package in "${!package_container[@]}"; do
        length=${#package}
        if ((length > max_length)); then
            max_length=$length
        fi
    done
    for package in "${!package_container[@]}"; do
        padding_length=$((max_length - ${#package} + 2)) # 加2是为了添加括号和空格的长度
        padding=$(printf '%*s' $padding_length '')
        debug "*" "$package" "$padding${package_container[$package]}"
    done
    echo
}
# =============================================
# 执行逻辑
# =============================================
# 打印logo
logo
# 检查网络
if ! ping -q -c 1 -W 1 baidu.com >/dev/null 2>&1; then
    error "Please reconnect to the network and try again.(EN)"
    error "请连接网络后重试(CN)"
fi
# 检查archlinuxcn源
if ! grep -q "\[archlinuxcn\]" /etc/pacman.conf; then
    error "Please make sure to have configured the Arch Linux CN repository before executing this script.(EN)"
    error "请先配置好 ArchLinux CN 源后再执行该脚本(CN)"
    exit 1
fi

#初始化
do_actions "init" init_actions
# 安装base类别的包
install "base" base_packages
# 安装驱动
install "firmware" firmware_packages
# 安装fonts
install "fonts" fonts_packages
# 安装wm
install "wm" wm_packages
# 安装输入法
install "fcitx5" fcitx5_packages
# 安装蓝牙,亮度控制,GUI授权等必须的工具
install "require_tools" require_tools_packages
# 安装声音的驱动,控制器等
install "audio" audio_packages
# 如果重启后仍旧没有声音,可以重新安装udevi尝试一下(亲测有效)
info "If there's still no sound after the restart, you can try reinstalling udev(sudo pacman -S udev)."
echo
install "hack tools" hacktools_packages
# 安装常用工具,如浏览器,vscode,wps,vmware,pycharm,v2ray,telegram,discord等

# =============================================
# 工具包,可选择后期自动安装,下面是完全自己的配置了
# =============================================
show_packages tools_packages tools_packages
read -p "Press Y/y to install all of tools_packages(You can also install it manually):" choice
echo
if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
    install "tools" tools_packages
fi

success "Script Finish!"
