# Android Linux Setup Configuration Template
# Copy this file to ~/.android_linux_config/config.sh and modify as needed

# ============================================================================
# DISTRIBUTION SETTINGS
# ============================================================================

# Default distribution to install
DEFAULT_DISTRO="ubuntu"

# Available distributions: ubuntu, debian, arch, fedora, kali
DISTRO_OPTIONS=("ubuntu" "debian" "arch" "fedora" "kali")

# Distribution-specific settings
declare -A DISTRO_SETTINGS
DISTRO_SETTINGS[ubuntu]="--variant=minbase"
DISTRO_SETTINGS[debian]="--variant=minbase"
DISTRO_SETTINGS[arch]="--no-check-certificate"
DISTRO_SETTINGS[fedora]=""
DISTRO_SETTINGS[kali]="--variant=minbase"

# ============================================================================
# PACKAGE CONFIGURATION
# ============================================================================

# Essential packages (always installed)
ESSENTIAL_PACKAGES=(
    "curl"
    "wget"
    "git"
    "nano"
    "vim"
    "htop"
    "tmux"
    "openssh"
    "python"
    "nodejs"
)

# Development packages
DEV_PACKAGES=(
    "build-essential"
    "clang"
    "gcc"
    "g++"
    "make"
    "cmake"
    "rust"
    "golang"
    "openjdk-11-jdk"
    "python3-pip"
    "npm"
)

# Networking packages
NETWORK_PACKAGES=(
    "openssh-server"
    "nginx"
    "apache2"
    "sqlite3"
    "postgresql"
    "redis-server"
)

# GUI packages (only installed if GUI is enabled)
GUI_PACKAGES=(
    "xfce4"
    "xfce4-terminal"
    "firefox"
    "tigervnc-standalone-server"
    "xrdp"
)

# ============================================================================
# GUI CONFIGURATION
# ============================================================================

# Enable GUI support by default
ENABLE_GUI="true"

# Default desktop environment
DESKTOP_ENV="xfce"

# VNC settings
VNC_PORT="5901"
VNC_RESOLUTION="1280x720"
VNC_COLOR_DEPTH="24"

# Alternative GUI options
GUI_OPTIONS=("vnc" "xrdp" "x11")
GUI_DEFAULT="vnc"

# ============================================================================
# AUTO-START CONFIGURATION
# ============================================================================

# Enable auto-start by default
ENABLE_AUTOSTART="true"

# Auto-start delay (seconds)
AUTOSTART_DELAY="5"

# Start services automatically
START_SSH="true"
START_WEB_SERVER="false"
START_DATABASE="false"

# ============================================================================
# SHELL INTEGRATION
# ============================================================================

# Default shell
DEFAULT_SHELL="bash"

# Shell-specific settings
BASH_SETTINGS=(
    "set -o vi"
    "export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$ \[\033[00m\]'"
    "alias ll='ls -alF'"
    "alias la='ls -A'"
    "alias l='ls -CF'"
)

ZSH_SETTINGS=(
    "setopt vi"
    "export PS1='%F{green}%n@%m %F{blue}%1~ %f%% '"
    "alias ll='ls -alF'"
    "alias la='ls -A'"
    "alias l='ls -CF'"
)

# ============================================================================
# BACKUP CONFIGURATION
# ============================================================================

# Enable automatic backups
AUTO_BACKUP="true"

# Backup frequency (daily, weekly, monthly)
BACKUP_FREQUENCY="weekly"

# Number of backups to keep
BACKUP_RETENTION="5"

# Backup compression
BACKUP_COMPRESSION="gzip"

# Backup location
BACKUP_LOCATION="$HOME/.android_linux_backup"

# ============================================================================
# NETWORK CONFIGURATION
# ============================================================================

# SSH settings
SSH_PORT="22"
SSH_ROOT_LOGIN="false"
SSH_PASSWORD_AUTH="false"
SSH_PUBLIC_KEY="$HOME/.ssh/id_rsa.pub"

# Web server settings
WEB_SERVER_PORT="8080"
WEB_SERVER_ROOT="/var/www/html"
WEB_SERVER_TYPE="nginx"

# Database settings
DB_PORT="5432"
DB_USER="android_user"
DB_PASSWORD="secure_password"

# ============================================================================
# SECURITY SETTINGS
# ============================================================================

# Firewall configuration
ENABLE_FIREWALL="true"
FIREWALL_TYPE="ufw"

# User settings
DEFAULT_USER="android"
DEFAULT_PASSWORD="android123"

# File permissions
DIRECTORY_PERMISSIONS="755"
FILE_PERMISSIONS="644"

# ============================================================================
# PERFORMANCE SETTINGS
# ============================================================================

# Memory limits
MAX_MEMORY_USAGE="1G"
SWAP_SIZE="512M"

# CPU limits
MAX_CPU_CORES="4"

# Storage limits
MAX_STORAGE_USAGE="10G"

# ============================================================================
# LOGGING CONFIGURATION
# ============================================================================

# Log levels: DEBUG, INFO, WARN, ERROR
LOG_LEVEL="INFO"

# Log file locations
SETUP_LOG="$HOME/.android_linux_setup/logs/setup.log"
ERROR_LOG="$HOME/.android_linux_setup/logs/error.log"
ACCESS_LOG="$HOME/.android_linux_setup/logs/access.log"

# Log rotation
LOG_MAX_SIZE="10M"
LOG_MAX_FILES="5"

# ============================================================================
# CUSTOM COMMANDS
# ============================================================================

# Commands to run on first setup
FIRST_RUN_COMMANDS=(
    "apt update"
    "apt upgrade -y"
    "locale-gen en_US.UTF-8"
    "timedatectl set-timezone UTC"
)

# Commands to run on every startup
STARTUP_COMMANDS=(
    "cd $HOME"
    "ls -la"
)

# Commands to run on every login
LOGIN_COMMANDS=(
    "echo 'Welcome to Android Linux!'"
    "uptime"
    "df -h"
)

# ============================================================================
# CUSTOM ALIASES
# ============================================================================

# System aliases
ALIASES=(
    "ll='ls -alF'"
    "la='ls -A'"
    "l='ls -CF'"
    "..='cd ..'"
    "...='cd ../..'"
    "....='cd ../../..'"
    "grep='grep --color=auto'"
    "fgrep='fgrep --color=auto'"
    "egrep='egrep --color=auto'"
    "diff='diff --color=auto'"
    "dmesg='dmesg --color=auto'"
    "cat='bat' 2>/dev/null || cat"
)

# Development aliases
DEV_ALIASES=(
    "gs='git status'"
    "ga='git add'"
    "gc='git commit'"
    "gp='git push'"
    "gl='git pull'"
    "py='python3'"
    "pip='python3 -m pip'"
    "node='node --experimental-modules'"
    "npmi='npm install'"
    "npms='npm start'"
)

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================

# Set environment variables
ENV_VARS=(
    "LANG=en_US.UTF-8"
    "LC_ALL=en_US.UTF-8"
    "TERM=xterm-256color"
    "EDITOR=vim"
    "VISUAL=vim"
    "PAGER=less"
    "BROWSER=firefox"
    "SHELL=/bin/bash"
)

# Development environment variables
DEV_VARS=(
    "NODE_ENV=development"
    "PYTHONPATH=$HOME/python"
    "GOPATH=$HOME/go"
    "PATH=$HOME/bin:$PATH"
    "ANDROID_HOME=$HOME/android-sdk"
)

# ============================================================================
# THIRD-PARTY INTEGRATIONS
# ============================================================================

# Docker settings
ENABLE_DOCKER="false"
DOCKER_SOCKET="/var/run/docker.sock"

# Kubernetes settings
ENABLE_KUBERNETES="false"
KUBE_CONFIG="$HOME/.kube/config"

# AWS settings
ENABLE_AWS="false"
AWS_DEFAULT_REGION="us-east-1"

# Google Cloud settings
ENABLE_GCLOUD="false"
GCLOUD_PROJECT="my-project"

# ============================================================================
# MOBILE-SPECIFIC SETTINGS
# ============================================================================

# Battery optimization
BATTERY_OPTIMIZATION="true"

# Performance mode
PERFORMANCE_MODE="balanced"

# Storage optimization
STORAGE_OPTIMIZATION="true"

# Network optimization
NETWORK_OPTIMIZATION="true"

# ============================================================================
# CUSTOM FUNCTIONS
# ============================================================================

# Custom function to display system info
system_info() {
    echo "=== Android Linux System Info ==="
    echo "OS: $(lsb_release -d 2>/dev/null | cut -f2 || echo 'Unknown')"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Uptime: $(uptime -p)"
    echo "Memory: $(free -h | grep Mem | awk '{print $2}')"
    echo "Storage: $(df -h $HOME | tail -1 | awk '{print $2}')"
    echo "Temperature: $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000}' || echo 'N/A')°C"
}

# Custom function to check services
check_services() {
    echo "=== Service Status ==="
    echo "SSH: $(systemctl is-active ssh 2>/dev/null || echo 'not installed')"
    echo "Web Server: $(systemctl is-active nginx 2>/dev/null || systemctl is-active apache2 2>/dev/null || echo 'not installed')"
    echo "Database: $(systemctl is-active postgresql 2>/dev/null || systemctl is-active mysql 2>/dev/null || echo 'not installed')"
}

# Custom function to update system
update_system() {
    echo "=== Updating System ==="
    apt update
    apt upgrade -y
    apt autoremove -y
    apt autoclean
    echo "System updated successfully!"
}

# ============================================================================
# END OF CONFIGURATION
# ============================================================================

# Validate configuration
if [[ ! -f "$HOME/.android_linux_config/validate_config.sh" ]]; then
    echo "Warning: Configuration validation script not found"
fi

# Source additional configuration files
if [[ -f "$HOME/.android_linux_config/custom.sh" ]]; then
    source "$HOME/.android_linux_config/custom.sh"
fi

echo "Configuration loaded successfully!"