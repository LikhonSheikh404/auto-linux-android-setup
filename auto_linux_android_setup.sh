#!/bin/bash

# 🚀 AUTO LINUX ANDROID SETUP SCRIPT 🚀
# =========================================
# 
# 🌟 Created by: Likhon Sheikh
# 📱 Platform: Android Linux Automation
# 🔥 Version: 1.0 (2025-12-13)
# 🌐 Telegram: @likhonsheikh
# 
# =========================================

# Auto Linux Android Setup Script - Enhanced Version
# Automatically detects, installs, and configures the best Linux environment for Android
# Author: Likhon Sheikh
# Version: 1.0
# Date: 2025-12-13
# Telegram: @likhonsheikh

set -e

# 🎨 Enhanced Color Schemes & Animations
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
UNDERLINE='\033[4m'
BLINK='\033[5m'
RESET='\033[0m'

# 🔄 Animation functions
animate_text() {
    local text="$1"
    local delay="${2:-0.1}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo
}

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$temp"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

rainbow_line() {
    local width=50
    local colors=("$RED" "$ORANGE" "$YELLOW" "$GREEN" "$CYAN" "$BLUE" "$PURPLE" "$PINK")
    for ((i=0; i<width; i++)); do
        color_index=$((i % ${#colors[@]}))
        echo -ne "${colors[$color_index]}█${RESET}"
        sleep 0.01
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

# Enhanced logging functions with animations
log() {
    echo -ne "${GREEN}[${RESET}"
    animate_text "$(date '+%H:%M:%S')" 0.02
    echo -ne "${GREEN}]${RESET} ${WHITE}${BOLD}✅${RESET} $1${NC}"
    echo
}

warn() {
    echo -ne "${YELLOW}[${RESET}"
    animate_text "WARNING" 0.03
    echo -ne "${YELLOW}]${RESET} ${ORANGE}${BLINK}⚠️${RESET} $1${NC}"
    echo
}

error() {
    echo -ne "${RED}[${RESET}"
    animate_text "ERROR" 0.03
    echo -ne "${RED}]${RESET} ${RED}${BLINK}❌${RESET} $1${NC}"
    echo
}

info() {
    echo -ne "${BLUE}[${RESET}"
    animate_text "INFO" 0.02
    echo -ne "${BLUE}]${RESET} ${CYAN}💡${RESET} $1${NC}"
    echo
}

success() {
    echo -ne "${GREEN}[${RESET}"
    animate_text "SUCCESS" 0.03
    echo -ne "${GREEN}]${RESET} ${LIGHT_GREEN}${BOLD}🎉${RESET} $1${NC}"
    echo
}

# Enhanced header with animations
header() {
    clear
    echo
    fire_effect
    echo -e "${PINK}${BOLD}================================${RESET}"
    echo -e "${CYAN}${BOLD}$1${RESET}"
    echo -e "${PINK}${BOLD}================================${RESET}"
    echo
    echo -e "${PURPLE}${BOLD}🌟 Created by: ${WHITE}Likhon Sheikh${RESET}"
    echo -e "${PURPLE}${BOLD}📱 Platform: ${CYAN}Android Linux Automation${RESET}"
    echo -e "${PURPLE}${BOLD}🌐 Telegram: ${BLUE}@likhonsheikh${RESET}"
    echo -e "${PURPLE}${BOLD}🔥 Version: ${ORANGE}1.0${RESET}"
    echo
    rainbow_line
    echo
}

# Configuration
TERMUX_PKG_URL="https://f-droid.org/packages/com.termux/"
BACKUP_DIR="$HOME/.android_linux_backup"
CONFIG_DIR="$HOME/.android_linux_config"
SERVICE_FILE="$HOME/.android_linux_service"

# Author credit function
show_author_credit() {
    clear
    echo -e "${PURPLE}${BOLD}╔══════════════════════════════════════╗${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${WHITE}${BOLD}    🚀 ANDROID LINUX SETUP 🚀     ${RESET}${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}╚══════════════════════════════════════╝${RESET}"
    echo
    echo -e "${CYAN}${BOLD}    👨‍💻 Author: ${WHITE}Likhon Sheikh${RESET}"
    echo -e "${BLUE}${BOLD}    📱 Platform: ${LIGHT_BLUE}Android Linux Automation${RESET}"
    echo -e "${GREEN}${BOLD}    🌐 Telegram: ${LIGHT_GREEN}@likhonsheikh${RESET}"
    echo -e "${YELLOW}${BOLD}    🔥 Version: ${ORANGE}1.0${RESET}"
    echo -e "${PINK}${BOLD}    📅 Date: ${LIGHT_PINK}2025-12-13${RESET}"
    echo
    echo -e "${ORANGE}${BLINK}    ⚡ Transforming Android into Linux Powerhouse! ⚡${RESET}"
    echo
    rainbow_line
    echo
    echo -ne "${WHITE}${BOLD}Press Enter to continue...${RESET}"
    read -r
}

# Enhanced check if running on Android
check_android() {
    header "🔍 Android Environment Detection"
    
    if [[ -n "$TERMUX_VERSION" ]]; then
        log "Running in Termux environment"
        ENVIRONMENT="termux"
        return 0
    elif [[ -f "/system/build.prop" ]]; then
        log "Running on Android system"
        ENVIRONMENT="android"
        return 0
    else
        warn "Not running on Android or Termux. Some features may not work."
        ENVIRONMENT="unknown"
        return 1
    fi
}

# Enhanced Android capabilities detection
detect_android_capabilities() {
    header "🎯 Detecting Android Capabilities"
    
    # Get Android version
    if [[ -f "/system/build.prop" ]]; then
        ANDROID_VERSION=$(grep "ro.build.version.release" /system/build.prop | cut -d'=' -f2)
        log "Android Version: $ANDROID_VERSION"
    else
        ANDROID_VERSION="unknown"
        warn "Could not detect Android version"
    fi
    
    # Check for root access
    if [[ -w "/system" ]] || command -v su >/dev/null 2>&1; then
        ROOT_ACCESS="yes"
        info "Root access detected"
    else
        ROOT_ACCESS="no"
        info "No root access (recommended for security)"
    fi
    
    # Check available storage
    if command -v df >/dev/null 2>&1; then
        AVAILABLE_SPACE=$(df "$HOME" | tail -1 | awk '{print $4}')
        AVAILABLE_SPACE_GB=$((AVAILABLE_SPACE / 1024 / 1024))
        log "Available storage: ${AVAILABLE_SPACE_GB}GB"
    else
        AVAILABLE_SPACE_GB="unknown"
        warn "Could not check storage space"
    fi
    
    # Check architecture
    if command -v uname >/dev/null 2>&1; then
        ARCH=$(uname -m)
        log "Architecture: $ARCH"
    else
        ARCH="unknown"
        warn "Could not detect architecture"
    fi
}

# Enhanced existing installations detection
detect_existing_installations() {
    header "🔍 Detecting Existing Linux Installations"
    
    INSTALLATIONS=()
    
    # Check for Termux
    if [[ -d "$HOME/.termux" ]] || command -v pkg >/dev/null 2>&1; then
        INSTALLATIONS+=("termux")
        success "Found existing Termux installation"
    fi
    
    # Check for proot-distro installations
    if command -v proot-distro >/dev/null 2>&1; then
        DISTROS=$(proot-distro list 2>/dev/null | grep "^\*" | awk '{print $2}' || true)
        if [[ -n "$DISTROS" ]]; then
            INSTALLATIONS+=("proot-distro")
            success "Found proot-distro with distributions: $DISTROS"
        fi
    fi
    
    # Check for UserLAnd
    if [[ -d "$HOME/Ubuntu" ]] || [[ -d "$HOME/Debian" ]]; then
        INSTALLATIONS+=("userland")
        success "Found UserLAnd installation"
    fi
    
    # Check for Andronix
    if [[ -d "$HOME/andronix" ]]; then
        INSTALLATIONS+=("andronix")
        success "Found Andronix installation"
    fi
    
    if [[ ${#INSTALLATIONS[@]} -eq 0 ]]; then
        info "No existing Linux installations found"
    else
        success "Found installations: ${INSTALLATIONS[*]}"
    fi
}

# Enhanced best setup determination
determine_best_setup() {
    header "🎯 Determining Best Setup"
    
    # Scoring system
    TERMUX_SCORE=0
    PROOT_SCORE=0
    USERLAND_SCORE=0
    ANDRONIX_SCORE=0
    
    # Score Termux
    TERMUX_SCORE=$((TERMUX_SCORE + 50))
    if [[ "$ROOT_ACCESS" == "no" ]]; then
        TERMUX_SCORE=$((TERMUX_SCORE + 30))
    fi
    if [[ "$AVAILABLE_SPACE_GB" == "unknown" ]] || [[ $AVAILABLE_SPACE_GB -lt 2 ]]; then
        TERMUX_SCORE=$((TERMUX_SCORE + 20))
    fi
    
    # Score proot-distro
    PROOT_SCORE=$((PROOT_SCORE + 40))
    if [[ "$ROOT_ACCESS" == "no" ]]; then
        PROOT_SCORE=$((PROOT_SCORE + 30))
    fi
    if [[ "$AVAILABLE_SPACE_GB" == "unknown" ]] || [[ $AVAILABLE_SPACE_GB -gt 3 ]]; then
        PROOT_SCORE=$((PROOT_SCORE + 20))
    fi
    
    # Score UserLAnd
    USERLAND_SCORE=$((USERLAND_SCORE + 30))
    if [[ "$ROOT_ACCESS" == "no" ]]; then
        USERLAND_SCORE=$((USERLAND_SCORE + 25))
    fi
    if [[ "$AVAILABLE_SPACE_GB" == "unknown" ]] || [[ $AVAILABLE_SPACE_GB -gt 5 ]]; then
        USERLAND_SCORE=$((USERLAND_SCORE + 15))
    fi
    
    # Score Andronix
    ANDRONIX_SCORE=$((ANDRONIX_SCORE + 20))
    
    # Determine winner
    BEST_SETUP=""
    BEST_SCORE=0
    
    for setup in "termux" "proot" "userland" "andronix"; do
        score_var="${setup^^}_SCORE"
        score=${!score_var}
        if [[ $score -gt $BEST_SCORE ]]; then
            BEST_SCORE=$score
            BEST_SETUP=$setup
        fi
    done
    
    success "Recommended setup: $BEST_SETUP (Score: $BEST_SCORE)"
    
    case $BEST_SETUP in
        "termux")
            RECOMMENDED_SETUP="termux"
            SETUP_TYPE="lightweight_terminal"
            ;;
        "proot")
            RECOMMENDED_SETUP="termux+proot-distro"
            SETUP_TYPE="full_linux_cli"
            ;;
        "userland")
            RECOMMENDED_SETUP="userland"
            SETUP_TYPE="full_linux_gui"
            ;;
        "andronix")
            RECOMMENDED_SETUP="andronix"
            SETUP_TYPE="full_linux_gui"
            ;;
    esac
    
    info "Recommended setup type: $SETUP_TYPE"
}

# Enhanced Termux setup
setup_termux() {
    header "🚀 Setting up Termux"
    
    if ! command -v pkg >/dev/null 2>&1; then
        warn "Termux not found. Please install Termux from F-Droid:"
        info "Visit: https://f-droid.org/packages/com.termux/"
        info "Download and install, then run this script again."
        return 1
    fi
    
    log "Updating Termux packages..."
    pkg update -y
    
    log "Setting up storage access..."
    termux-setup-storage -y || warn "Storage setup failed, continuing anyway..."
    
    log "Installing essential packages..."
    pkg install -y \
        proot-distro \
        curl \
        wget \
        git \
        nano \
        vim \
        htop \
        tmux \
        openssh \
        python \
        nodejs \
        rust \
        golang \
        termux-api \
        x11-repo \
        pulseaudio \
        termux-x11
    
    success "Termux setup completed successfully!"
}

# Enhanced PRoot-Distro setup
setup_proot_distro() {
    header "🐧 Setting up PRoot-Distro"
    
    if ! command -v proot-distro >/dev/null 2>&1; then
        error "proot-distro not found. Installing..."
        pkg install -y proot-distro
    fi
    
    log "Listing available distributions..."
    proot-distro list
    
    # Ask user for distribution preference or use default
    DISTRO_CHOICE=${1:-"ubuntu"}
    
    if ! proot-distro list | grep -q "^\* $DISTRO_CHOICE"; then
        log "Installing $DISTRO_CHOICE distribution..."
        proot-distro install "$DISTRO_CHOICE"
    else
        success "$DISTRO_CHOICE is already installed"
    fi
    
    # Create enhanced startup script
    cat > "$HOME/start_linux.sh" << EOF
#!/bin/bash
# 🚀 Auto-generated Linux startup script by Likhon Sheikh

# Author: Likhon Sheikh
# Telegram: @likhonsheikh
# Platform: Android Linux Automation

# Enhanced colors
GREEN='\\033[0;32m'
BLUE='\\033[0;34m'
PINK='\\033[1;35m'
RESET='\\033[0m'

echo -e "\${GREEN}🚀 Starting Linux Environment...\${RESET}"
echo -e "\${BLUE}👨‍💻 Powered by: Likhon Sheikh\${RESET}"
echo -e "\${PINK}🌐 Telegram: @likhonsheikh\${RESET}"
echo

# Check if proot-distro is available
if ! command -v proot-distro >/dev/null 2>&1; then
    echo "Error: proot-distro not found"
    exit 1
fi

# Start the distribution
proot-distro login "$DISTRO_CHOICE" --user "\$USER"
EOF
    
    chmod +x "$HOME/start_linux.sh"
    success "PRoot-Distro setup completed!"
}

# Enhanced GUI environment setup
setup_gui_environment() {
    if [[ "$1" == "gui" ]]; then
        header "🖥️ Setting up GUI Environment"
        
        log "Installing VNC server..."
        pkg install -y tigervnc
        
        log "Installing desktop environment (XFCE)..."
        if command -v proot-distro >/dev/null 2>&1; then
            proot-distro login ubuntu << 'EOF'
apt update
apt install -y xfce4 xfce4-terminal firefox
apt install -y tigervnc-standalone-server
EOF
        fi
        
        log "Creating enhanced VNC startup script..."
        cat > "$HOME/start_vnc.sh" << 'EOF'
#!/bin/bash
# 🖥️ VNC Server startup script by Likhon Sheikh

echo "🚀 Starting VNC Server..."
echo "👨‍💻 Powered by: Likhon Sheikh"
echo "🌐 Telegram: @likhonsheikh"
vncserver :1 -geometry 1280x720 -depth 24

echo "✅ VNC Server started on port 5901"
echo "🔗 Connect using: 127.0.0.1:5901"
echo "🔐 Password will be set on first run"
EOF
        
        chmod +x "$HOME/start_vnc.sh"
        success "GUI environment setup completed!"
        info "Run 'start_vnc.sh' to start VNC server"
        info "Use VNC client to connect to localhost:5901"
    fi
}

# Enhanced auto-start configuration
create_autostart_config() {
    header "⚙️ Creating Auto-start Configuration"
    
    mkdir -p "$CONFIG_DIR"
    
    # Create main auto-start script
    cat > "$CONFIG_DIR/auto_start_linux.sh" << 'EOF'
#!/bin/bash
# ⚙️ Auto-start Linux environment script by Likhon Sheikh

# Check if this is the first run
FIRST_RUN_FILE="$HOME/.linux_setup_first_run"

if [[ ! -f "$FIRST_RUN_FILE" ]]; then
    echo "First time setup..."
    touch "$FIRST_RUN_FILE"
    
    # Run the main setup
    bash /path/to/auto_linux_android_setup.sh --setup-only
fi

# Start the Linux environment
if [[ -f "$HOME/start_linux.sh" ]]; then
    bash "$HOME/start_linux.sh"
fi
EOF
    
    # Create Termux startup configuration
    if [[ -d "$HOME/.termux" ]]; then
        cat > "$HOME/.termux/boot.sh" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
# 🔄 Termux boot script by Likhon Sheikh

# Auto-start Linux environment
if [[ -f "$HOME/start_linux.sh" ]]; then
    nohup bash "$HOME/start_linux.sh" > /dev/null 2>&1 &
fi
EOF
        
        chmod +x "$HOME/.termux/boot.sh"
    fi
    
    success "Auto-start configuration created!"
}

# Enhanced shell integration
create_shell_integration() {
    header "🐚 Creating Shell Integration"
    
    # Add to bashrc with enhanced aliases
    cat >> "$HOME/.bashrc" << 'EOF'

# 🚀 Auto Linux Android Setup Integration by Likhon Sheikh
# 🌐 Telegram: @likhonsheikh
if [[ -f "$HOME/.android_linux_config/auto_start_linux.sh" ]]; then
    source "$HOME/.android_linux_config/auto_start_linux.sh"
fi

# Enhanced Linux environment functions
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias startlinux='bash ~/start_linux.sh'
alias startgui='bash ~/start_vnc.sh 2>/dev/null || echo "GUI setup not available"'
alias likhon='echo "👨‍💻 Created by: Likhon Sheikh | 🌐 Telegram: @likhonsheikh"'

# Enhanced quick commands
linux-help() {
    echo "🚀 Linux Android Commands:"
    echo "  startlinux  - Start Linux environment"
    echo "  startgui    - Start GUI environment (if available)"
    echo "  likhon      - Show author info"
    echo "  ll, la, l   - Enhanced ls commands"
    echo "  👨‍💻 Author: Likhon Sheikh"
    echo "  🌐 Telegram: @likhonsheikh"
}

export ANDROID_LINUX_SETUP_VERSION="1.0"
export AUTHOR="Likhon Sheikh"
export TELEGRAM="@likhonsheikh"
EOF
    
    # Add to zshrc if available
    if [[ -f "$HOME/.zshrc" ]]; then
        cat >> "$HOME/.zshrc" << 'EOF'

# 🚀 Auto Linux Android Setup Integration by Likhon Sheikh
if [[ -f "$HOME/.android_linux_config/auto_start_linux.sh" ]]; then
    source "$HOME/.android_linux_config/auto_start_linux.sh"
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias startlinux='bash ~/start_linux.sh'
alias startgui='bash ~/start_vnc.sh 2>/dev/null || echo "GUI setup not available"'
alias likhon='echo "👨‍💻 Created by: Likhon Sheikh | 🌐 Telegram: @likhonsheikh"'
EOF
    fi
    
    success "Shell integration completed!"
}

# Enhanced backup and restore setup
setup_backup_restore() {
    header "💾 Setting up Backup/Restore"
    
    mkdir -p "$BACKUP_DIR"
    
    # Create enhanced backup script
    cat > "$BACKUP_DIR/backup_linux.sh" << 'EOF'
#!/bin/bash
# 💾 Backup Linux Android setup by Likhon Sheikh

BACKUP_DIR="$HOME/.android_linux_backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "🚀 Creating backup: $TIMESTAMP"
echo "👨‍💻 Author: Likhon Sheikh"

# Backup configurations
tar -czf "$BACKUP_DIR/config_$TIMESTAMP.tar.gz" \
    "$HOME/.android_linux_config" \
    "$HOME/start_linux.sh" \
    "$HOME/start_vnc.sh" \
    "$HOME/.bashrc" \
    "$HOME/.zshrc" 2>/dev/null || true

# Backup proot-distro data (if exists)
if command -v proot-distro >/dev/null 2>&1; then
    mkdir -p "$BACKUP_DIR/proot_data"
    proot-distro backup "$BACKUP_DIR/proot_data" 2>/dev/null || true
fi

echo "✅ Backup completed: $BACKUP_DIR/config_$TIMESTAMP.tar.gz"
echo "🌐 Telegram: @likhonsheikh"
EOF
    
    # Create enhanced restore script
    cat > "$BACKUP_DIR/restore_linux.sh" << 'EOF'
#!/bin/bash
# 🔄 Restore Linux Android setup by Likhon Sheikh

BACKUP_DIR="$HOME/.android_linux_backup"
LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/config_*.tar.gz 2>/dev/null | head -1)

if [[ -z "$LATEST_BACKUP" ]]; then
    echo "❌ No backup found"
    echo "👨‍💻 Author: Likhon Sheikh"
    exit 1
fi

echo "🔄 Restoring from: $LATEST_BACKUP"
echo "👨‍💻 Author: Likhon Sheikh"

# Extract backup
tar -xzf "$LATEST_BACKUP" -C "$HOME" 2>/dev/null || true

echo "✅ Restore completed"
echo "🌐 Telegram: @likhonsheikh"
EOF
    
    chmod +x "$BACKUP_DIR/backup_linux.sh"
    chmod +x "$BACKUP_DIR/restore_linux.sh"
    
    success "Backup/Restore functionality created!"
    info "Use: bash $BACKUP_DIR/backup_linux.sh"
    info "Use: bash $BACKUP_DIR/restore_linux.sh"
}

# Enhanced main setup function
main_setup() {
    # Show author credit first
    show_author_credit
    
    header "🚀 Auto Linux Android Setup - Main Configuration"
    
    # Parse command line arguments
    SETUP_TYPE=""
    DISTRO=""
    GUI=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --setup-only)
                SETUP_TYPE="setup_only"
                shift
                ;;
            --distro)
                DISTRO="$2"
                shift 2
                ;;
            --gui)
                GUI="gui"
                shift
                ;;
            --help|-h)
                echo "🚀 Usage: $0 [options]"
                echo "👨‍💻 Author: Likhon Sheikh"
                echo "🌐 Telegram: @likhonsheikh"
                echo
                echo "Options:"
                echo "  --setup-only    Only setup, don't create configs"
                echo "  --distro NAME   Specify distribution (ubuntu, debian, arch)"
                echo "  --gui          Include GUI setup"
                echo "  --help, -h     Show this help"
                return 0
                ;;
            *)
                warn "Unknown option: $1"
                shift
                ;;
        esac
    done
    
    # Detection phase
    check_android
    detect_android_capabilities
    detect_existing_installations
    
    # Determine best setup
    determine_best_setup
    
    # Setup phase
    if [[ "$SETUP_TYPE" != "setup_only" ]]; then
        info "Press Enter to continue with recommended setup ($RECOMMENDED_SETUP)..."
        read -r
    fi
    
    # Install/update Termux
    setup_termux
    
    # Setup based on recommendation
    case $RECOMMENDED_SETUP in
        "termux")
            log "Setting up lightweight Termux environment"
            ;;
        "termux+proot-distro")
            log "Setting up Termux + PRoot-Distro"
            setup_proot_distro "$DISTRO"
            ;;
        "userland")
            warn "UserLAnd setup requires manual installation"
            info "Please install UserLAnd from Play Store or F-Droid"
            ;;
        "andronix")
            warn "Andronix setup requires manual installation"
            info "Please install Andronix from Play Store or website"
            ;;
    esac
    
    # GUI setup if requested
    if [[ "$GUI" == "gui" ]]; then
        setup_gui_environment "gui"
    fi
    
    # Create persistent configuration
    if [[ "$SETUP_TYPE" != "setup_only" ]]; then
        create_autostart_config
        create_shell_integration
        setup_backup_restore
    fi
    
    # Enhanced final summary
    header "🎉 Setup Complete!"
    success "Linux Android setup completed successfully!"
    echo
    info "Available commands:"
    echo "  🚀 startlinux  - Start Linux environment"
    echo "  🖥️  startgui    - Start GUI environment (if configured)"
    echo "  ℹ️  linux-help  - Show available commands"
    echo "  👨‍💻 likhon     - Show author info"
    echo
    info "Configuration files:"
    echo "  📁 $HOME/.android_linux_config/"
    echo "  📄 $HOME/start_linux.sh"
    echo "  🐚 $HOME/.bashrc"
    echo
    info "Backup/Restore:"
    echo "  💾 $HOME/.android_linux_backup/backup_linux.sh"
    echo "  🔄 $HOME/.android_linux_backup/restore_linux.sh"
    echo
    echo -e "${PINK}${BOLD}👨‍💻 Created by: Likhon Sheikh${RESET}"
    echo -e "${CYAN}${BOLD}🌐 Telegram: @likhonsheikh${RESET}"
    echo -e "${PURPLE}${BOLD}🔥 Platform: Android Linux Automation${RESET}"
}

# Enhanced health check function
health_check() {
    header "🔍 Linux Android Setup Health Check"
    
    # Check Termux
    if command -v pkg >/dev/null 2>&1; then
        success "✓ Termux: OK"
        pkg list-installed | wc -l | xargs -I {} info "  📦 Packages installed: {}"
    else
        error "✗ Termux: Not found"
    fi
    
    # Check proot-distro
    if command -v proot-distro >/dev/null 2>&1; then
        success "✓ PRoot-Distro: OK"
        INSTALLED_DISTROS=$(proot-distro list | grep "^\*" | wc -l)
        info "  🐧 Distributions: $INSTALLED_DISTROS"
    else
        warn "⚠ PRoot-Distro: Not found"
    fi
    
    # Check startup scripts
    if [[ -f "$HOME/start_linux.sh" ]]; then
        success "✓ Startup script: OK"
    else
        warn "⚠ Startup script: Not found"
    fi
    
    # Check configuration
    if [[ -d "$HOME/.android_linux_config" ]]; then
        success "✓ Configuration: OK"
    else
        warn "⚠ Configuration: Not found"
    fi
    
    # Check shell integration
    if grep -q "android_linux_setup" "$HOME/.bashrc" 2>/dev/null; then
        success "✓ Shell integration: OK"
    else
        warn "⚠ Shell integration: Not found"
    fi
    
    echo
    echo -e "${PINK}${BOLD}👨‍💻 Author: Likhon Sheikh | 🌐 Telegram: @likhonsheikh${RESET}"
}

# Enhanced main execution
case "${1:-}" in
    --help|-h)
        echo "🚀 Auto Linux Android Setup Script"
        echo "👨‍💻 Author: Likhon Sheikh"
        echo "🌐 Telegram: @likhonsheikh"
        echo
        echo "Usage: $0 [command] [options]"
        echo
        echo "Commands:"
        echo "  (default)     Run full setup"
        echo "  --setup-only  Setup only, no configuration"
        echo "  --health      Run health check"
        echo "  --help        Show this help"
        echo
        echo "Options:"
        echo "  --distro NAME   Specify distribution"
        echo "  --gui          Include GUI setup"
        echo
        echo "🔥 Transform your Android into a Linux powerhouse!"
        echo "📱 Created by: Likhon Sheikh | 🌐 Telegram: @likhonsheikh"
        return 0
        ;;
    --health)
        health_check
        ;;
    --setup-only)
        SETUP_TYPE="setup_only" main_setup
        ;;
    *)
        main_setup "$@"
        ;;
esac