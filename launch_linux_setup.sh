#!/bin/bash

# 🚀 LAUNCH LINUX ANDROID SETUP 🚀
# =========================================
# 
# 🌟 Created by: Likhon Sheikh
# 📱 Platform: Android Linux Automation
# 🔥 Version: 1.0 (2025-12-13)
# 🌐 Telegram: @likhonsheikh
# 
# =========================================

# Simple Linux Android Launcher - Enhanced Version
# Quick launcher for the auto Linux Android setup
# Author: Likhon Sheikh
# Telegram: @likhonsheikh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_SCRIPT="$SCRIPT_DIR/auto_linux_android_setup.sh"

# 🎨 Enhanced Color Schemes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
PINK='\033[1;35m'
ORANGE='\033[1;33m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
BOLD='\033[1m'
BLINK='\033[5m'
RESET='\033[0m'

# 🔄 Animation functions
animate_text() {
    local text="$1"
    local delay="${2:-0.05}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo
}

rainbow_effect() {
    local colors=("$RED" "$ORANGE" "$YELLOW" "$GREEN" "$CYAN" "$BLUE" "$PURPLE" "$PINK")
    for i in {1..10}; do
        color_index=$((i % ${#colors[@]}))
        echo -ne "${colors[$color_index]}█${RESET}"
        sleep 0.1
    done
    echo
}

fire_effect() {
    for i in {1..3}; do
        echo -ne "${RED}${BLINK}🔥${RESET}"
        sleep 0.3
        echo -ne "\b\b\b"
    done
    echo -ne "${ORANGE}🔥 Android Linux Setup ${RED}🔥${RESET}\n"
}

# Check if setup script exists
if [[ ! -f "$SETUP_SCRIPT" ]]; then
    echo -e "${RED}${BLINK}❌ Error: Setup script not found at $SETUP_SCRIPT${RESET}"
    echo -e "${YELLOW}Please ensure auto_linux_android_setup.sh is in the same directory.${RESET}"
    echo -e "${CYAN}👨‍💻 Created by: Likhon Sheikh | 🌐 Telegram: @likhonsheikh${RESET}"
    return 1
fi

# Make setup script executable
chmod +x "$SETUP_SCRIPT"

# Enhanced author credit banner
show_author_banner() {
    clear
    fire_effect
    echo -e "${PURPLE}${BOLD}╔══════════════════════════════════════╗${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${WHITE}${BOLD}   🚀 LINUX ANDROID LAUNCHER 🚀   ${RESET}${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}╚══════════════════════════════════════╝${RESET}"
    echo
    rainbow_effect
    echo -e "${CYAN}${BOLD}    👨‍💻 Author: ${WHITE}Likhon Sheikh${RESET}"
    echo -e "${BLUE}${BOLD}    📱 Platform: ${LIGHT_BLUE}Android Linux Automation${RESET}"
    echo -e "${GREEN}${BOLD}    🌐 Telegram: ${LIGHT_GREEN}@likhonsheikh${RESET}"
    echo -e "${YELLOW}${BOLD}    🔥 Version: ${ORANGE}1.0${RESET}"
    echo -e "${PINK}${BOLD}    📅 Date: ${LIGHT_PINK}2025-12-13${RESET}"
    echo
    echo -e "${ORANGE}${BLINK}    ⚡ Choose your setup option below! ⚡${RESET}"
    echo
    rainbow_effect
    echo
}

# Enhanced function to show menu
show_menu() {
    echo -e "${WHITE}${BOLD}🚀 AVAILABLE SETUP OPTIONS:${RESET}"
    echo
    echo -e "${LIGHT_GREEN}1. 🎯 Full Setup (Recommended)${RESET}"
    echo -e "${BLUE}   └─ Complete Linux environment with smart detection${RESET}"
    echo
    echo -e "${LIGHT_GREEN}2. 🖥️  Setup with GUI${RESET}"
    echo -e "${BLUE}   └─ Full Linux environment with desktop interface${RESET}"
    echo
    echo -e "${LIGHT_GREEN}3. 🐧 Setup Specific Distribution${RESET}"
    echo -e "${BLUE}   └─ Choose Ubuntu, Debian, Arch, Fedora, or Kali${RESET}"
    echo
    echo -e "${LIGHT_GREEN}4. 🩺 Health Check${RESET}"
    echo -e "${BLUE}   └─ Check system status and installed components${RESET}"
    echo
    echo -e "${LIGHT_GREEN}5. 📖 Show Help${RESET}"
    echo -e "${BLUE}   └─ Display help information and documentation${RESET}"
    echo
    echo -e "${LIGHT_GREEN}6. 👋 Exit${RESET}"
    echo -e "${BLUE}   └─ Exit the launcher${RESET}"
    echo
    rainbow_effect
    echo -ne "${WHITE}${BOLD}🎮 Select option [1-6]: ${RESET}"
}

# Enhanced function to run full setup
run_full_setup() {
    echo -e "\n${GREEN}${BOLD}🚀 Running full Linux Android setup...${RESET}"
    echo -e "${BLUE}This will install and configure the best Linux environment for your device.${RESET}"
    echo -e "${CYAN}👨‍💻 Powered by: Likhon Sheikh${RESET}"
    echo
    rainbow_effect
    bash "$SETUP_SCRIPT"
}

# Enhanced function to run GUI setup
run_gui_setup() {
    echo -e "\n${GREEN}${BOLD}🖥️  Running Linux Android setup with GUI...${RESET}"
    echo -e "${BLUE}This will install Linux environment with GUI support.${RESET}"
    echo -e "${CYAN}👨‍💻 Powered by: Likhon Sheikh${RESET}"
    echo
    rainbow_effect
    bash "$SETUP_SCRIPT" --gui
}

# Enhanced function to setup specific distribution
run_distro_setup() {
    echo -e "\n${GREEN}${BOLD}🐧 Available Linux Distributions:${RESET}"
    echo
    echo -e "${ORANGE}1. 🟠 Ubuntu (Recommended)${RESET}"
    echo -e "${BLUE}   └─ Most popular, user-friendly Linux distribution${RESET}"
    echo
    echo -e "${ORANGE}2. 🔴 Debian${RESET}"
    echo -e "${BLUE}   └─ Stable and reliable, foundation of Ubuntu${RESET}"
    echo
    echo -e "${ORANGE}3. 🟣 Arch Linux${RESET}"
    echo -e "${BLUE}   └─ Rolling release, highly customizable${RESET}"
    echo
    echo -e "${ORANGE}4. 🔵 Fedora${RESET}"
    echo -e "${BLUE}   └─ Cutting-edge, Red Hat sponsored distribution${RESET}"
    echo
    echo -e "${ORANGE}5. ⚫ Kali Linux${RESET}"
    echo -e "${BLUE}   └─ Penetration testing and security auditing${RESET}"
    echo
    echo -ne "${WHITE}${BOLD}🎯 Select distribution [1-5]: ${RESET}"
    read -r choice
    
    case $choice in
        1) distro="ubuntu" ;;
        2) distro="debian" ;;
        3) distro="arch" ;;
        4) distro="fedora" ;;
        5) distro="kali" ;;
        *) 
            echo -e "${RED}${BLINK}❌ Invalid choice! Please select 1-5.${RESET}"
            return 
            ;;
    esac
    
    echo -e "\n${GREEN}${BOLD}🚀 Setting up $distro...${RESET}"
    echo -e "${CYAN}👨‍💻 Powered by: Likhon Sheikh${RESET}"
    echo
    rainbow_effect
    bash "$SETUP_SCRIPT" --distro "$distro" --gui
}

# Enhanced function to show help
show_help() {
    echo -e "\n${GREEN}${BOLD}📖 Displaying helpET}"
    echo -e "${CY information...${RESAN}👨‍💻 Powered by: Likhon Sheikh${RESET}"
    echo
    rainbow_effect
    bash "$SETUP_SCRIPT" --help
}

# Enhanced health check
run_health_check() {
    echo -e "\n${GREEN}${BOLD}🩺 Running health check...${RESET}"
    echo -e "${BLUE}Checking system status and installed components...${RESET}"
    echo -e "${CYAN}👨‍💻 Powered by: Likhon Sheikh${RESET}"
    echo
    rainbow_effect
    bash "$SETUP_SCRIPT" --health
}

# Enhanced exit function
goodbye() {
    echo -e "\n"
    fire_effect
    echo -e "${GREEN}${BOLD}👋 Thank you for using Android Linux Setup!${RESET}"
    echo -e "${CYAN}👨‍💻 Created by: Likhon Sheikh${RESET}"
    echo -e "${BLUE}🌐 Telegram: @likhonsheikh${RESET}"
    echo -e "${PURPLE}${BOLD}🚀 Keep exploring the power of Linux on Android! 🚀${RESET}"
    echo
    rainbow_effect
    return 0
}

# Enhanced invalid option handler
handle_invalid_option() {
    echo -e "\n${RED}${BLINK}❌ Invalid option! Please select 1-6.${RESET}"
    echo -e "${YELLOW}Try again...${RESET}"
    sleep 1
}

# Main menu loop - Enhanced version
while true; do
    show_author_banner
    show_menu
    read -r choice
    
    case $choice in
        1)
            run_full_setup
            echo
            echo -ne "${WHITE}${BOLD}⏸️  Press Enter to continue...${RESET}"
            read -r
            ;;
        2)
            run_gui_setup
            echo
            echo -ne "${WHITE}${BOLD}⏸️  Press Enter to continue...${RESET}"
            read -r
            ;;
        3)
            run_distro_setup
            echo
            echo -ne "${WHITE}${BOLD}⏸️  Press Enter to continue...${RESET}"
            read -r
            ;;
        4)
            run_health_check
            echo
            echo -ne "${WHITE}${BOLD}⏸️  Press Enter to continue...${RESET}"
            read -r
            ;;
        5)
            show_help
            echo
            echo -ne "${WHITE}${BOLD}⏸️  Press Enter to continue...${RESET}"
            read -r
            ;;
        6)
            goodbye
            break
            ;;
        *)
            handle_invalid_option
            ;;
    esac
done