# 🚀 Auto Linux Android Setup

<div align="center">

[![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://www.android.com/)
[![Bash](https://img.shields.io/badge/bash-%23123456.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.linux.org/)
[![Termux](https://img.shields.io/badge/Termux-000000?style=for-the-badge&logo=termux&logoColor=white)](https://termux.dev/)

**🔥 Transform your Android device into a Linux powerhouse! 🔥**

*A comprehensive bash script suite that automatically detects, installs, and configures the best Linux environment for Android devices without requiring root access.*

</div>

---

## 👨‍💻 **Author & Social**

<div align="center">

**[Likhon Sheikh](https://t.me/likhonsheikh)** | **Android Linux Automation Expert**

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/likhonsheikh)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com)
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com)

*🌟 Expert in Android Linux automation and mobile development 🌟*

</div>

---

## 🎯 **Overview**

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 10px; color: white;">

This solution **automatically**:
- 🔍 **Detects** your Android device capabilities
- 🎯 **Identifies** the best Linux setup for your device  
- ⚙️ **Installs** and configures Termux with optional PRoot-Distro
- 🐧 **Sets up** full Linux distributions (Ubuntu, Debian, Arch, etc.)
- 🚀 **Creates** persistent auto-start configurations
- 🖥️ **Provides** GUI support via VNC
- 💾 **Includes** backup/restore functionality

</div>

## ⚡ **Quick Start**

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">

### 🎮 **Option 1: Interactive Launcher** (Recommended)
```bash
chmod +x launch_linux_setup.sh
./launch_linux_setup.sh
```

### 🚀 **Option 2: Direct Setup**
```bash
chmod +x auto_linux_android_setup.sh
./auto_linux_android_setup.sh
```

### 🖥️ **Option 3: Setup with GUI**
```bash
chmod +x auto_linux_android_setup.sh
./auto_linux_android_setup.sh --gui
```

</div>

## ✨ **Features**

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 15px;">

### 🔍 **Auto-Detection**
- ✅ Android version and capabilities detection
- ✅ Storage space analysis  
- ✅ Architecture detection
- ✅ Root access detection
- ✅ Existing installation discovery

### 🏆 **Smart Recommendations**
- 💻 **Termux** (Lightweight) - Best for CLI tasks, low-end devices
- 🔧 **Termux + PRoot-Distro** (Full CLI) - Best for development
- 🖥️ **UserLAnd** (Full GUI) - Best for desktop experience
- 🎮 **Andronix** (GUI Alternative) - User-friendly GUI setup

### 📦 **Installation Options**
- 💻 **Lightweight Termux**: Basic terminal environment
- 🐧 **Full Linux Distribution**: Ubuntu, Debian, Arch, Fedora, Kali
- 🖥️ **GUI Support**: XFCE desktop with VNC
- 🛠️ **Development Tools**: Python, Node.js, Go, Rust, compilers

### 🚀 **Auto-Start Configuration**
- ⚡ Automatic Linux environment startup
- 🐚 Shell integration (bash/zsh)
- 📁 Service files for system integration
- 🔄 Boot scripts for Termux

### 💾 **Backup & Restore**
- 💿 Automated configuration backup
- 🔄 Easy restoration process
- 📊 Version management

</div>

## 📁 **File Structure**

```bash
android_linux_setup/
├── 📄 auto_linux_android_setup.sh    # Main setup script
├── 🚀 launch_linux_setup.sh          # Interactive launcher  
├── 📖 README.md                       # This file
├── ⚙️ config_template.sh             # Configuration template
├── 🧪 test_setup.sh                   # Testing suite
└── [Generated after setup]/
    ├── 📁 ~/.android_linux_config/   # Configuration files
    ├── 💾 ~/.android_linux_backup/   # Backup/restore files
    ├── 🐧 start_linux.sh            # Linux environment launcher
    ├── 🖥️ start_vnc.sh              # GUI launcher
    └── 📊 logs/                     # Setup logs
```

## 🎮 **Commands Reference**

After installation, available commands:

### 🌍 **Environment Control**
```bash
🚀 startlinux    # Start Linux environment
🖥️  startgui      # Start GUI environment (if configured)  
ℹ️  linux-help    # Show available commands
👨‍💻 likhon       # Show author info
```

### 📁 **File Management**
```bash
📋 ll            # Enhanced ls (detailed)
📂 la            # List all files
📄 l             # Simple list
```

### ⚙️ **System Management**
```bash
# 💾 Backup setup
bash ~/.android_linux_backup/backup_linux.sh

# 🔄 Restore setup  
bash ~/.android_linux_backup/restore_linux.sh

# 🩺 Health check
bash auto_linux_android_setup.sh --health
```

## 📱 **Installation Methods**

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">

### 📲 **Method 1: Termux** (Recommended)
1. Install Termux from F-Droid: 🔗 https://f-droid.org/packages/com.termux/
2. Open Termux and run:
```bash
wget https://raw.githubusercontent.com/your-repo/android_linux_setup.sh
chmod +x android_linux_setup.sh
./android_linux_setup.sh
```

### 💾 **Method 2: Direct Download**
1. Download all files to your Android device
2. Grant execution permissions
3. Run the launcher script

### 🔧 **Method 3: ADB Push** (Advanced)
```bash
adb push auto_linux_android_setup.sh /sdcard/
adb push launch_linux_setup.sh /sdcard/
adb shell
cd /sdcard
chmod +x *.sh
./launch_linux_setup.sh
```

</div>

## ⚙️ **Configuration**

<div style="background: #f8f9fa; padding: 15px; border-radius: 8px; border-left: 4px solid #007bff;">

### 🐧 **Custom Distributions**
```bash
# Install specific distribution
./auto_linux_android_setup.sh --distro ubuntu

# Available distributions: ubuntu, debian, arch, fedora, kali
```

### 🖥️ **GUI Setup**
```bash
# Include GUI environment
./auto_linux_android_setup.sh --gui
```

### 🔧 **Setup Only**
```bash
# Install without creating auto-start configs
./auto_linux_android_setup.sh --setup-only
```

</div>

## 🔧 **Troubleshooting**

### 🚨 **Common Issues**

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 15px;">

#### ❌ **Termux not found**
- ✅ Install from F-Droid: 🔗 https://f-droid.org/packages/com.termux/
- ⚠️ Avoid Google Play Store version (outdated)

#### 🚫 **Storage access denied**
- ✅ Run: `termux-setup-storage`
- ✅ Grant storage permissions in Android settings

#### ⚠️ **PRoot-Distro fails**
- ✅ Ensure sufficient storage (2GB+ free space)
- ✅ Check internet connection for package downloads

#### 🖥️ **GUI not working**
- ✅ Install VNC client on Android
- ✅ Run: `startgui`
- ✅ Connect to `localhost:5901`

</div>

### 🩺 **Health Check**
```bash
# Run system health check
./auto_linux_android_setup.sh --health
```

### 📊 **Logs Location**
```bash
# View setup logs
tail -f ~/.android_linux_setup/logs/setup.log

# View error logs
tail -f ~/.android_linux_setup/logs/error.log
```

## 🚀 **Advanced Usage**

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 10px; color: white;">

### ⚙️ **Custom Configuration**
Edit `~/.android_linux_config/config.sh` for custom settings:

```bash
# Custom package list
CUSTOM_PACKAGES="vim git curl wget htop"

# Custom distribution
DEFAULT_DISTRO="ubuntu"

# Enable auto-backup
AUTO_BACKUP="true"

# Custom startup commands
STARTUP_COMMANDS="cd ~/projects && ls -la"
```

### 🐧 **Manual Distribution Installation**
```bash
# List available distributions
proot-distro list

# Install specific distribution
proot-distro install ubuntu

# Login to distribution
proot-distro login ubuntu
```

### ⚙️ **Service Management**
```bash
# Start Linux environment as service
termux-service enable startlinux

# Check service status
termux-service list

# Stop service
termux-service disable startlinux
```

</div>

## 🔒 **Security Notes**

<div style="background: #e8f5e8; padding: 15px; border-radius: 8px; border-left: 4px solid #28a745;">

- ✅ All installations run without root access
- ✅ Linux environments are sandboxed
- ✅ No system modifications required
- ✅ Backups contain only user configurations

</div>

## 📞 **Support & Updates**

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">

### 🆘 **Getting Help**
- Run: `linux-help` for command reference
- Check logs: `~/.android_linux_setup/logs/`
- Health check: `./auto_linux_android_setup.sh --health`

### 🔄 **Updates**
```bash
# Update the setup script
wget -O auto_linux_android_setup.sh https://latest-version-url

# Re-run setup for updates
./auto_linux_android_setup.sh --setup-only
```

</div>

## 📋 **Requirements**

<div style="background: #fff3cd; padding: 15px; border-radius: 8px; border-left: 4px solid #ffc107;">

- 📱 **Android Version**: 7.0+ (API 24+)
- 💾 **Storage**: 2GB+ free space (5GB+ for GUI)
- 🧠 **RAM**: 1GB+ recommended
- 🌐 **Network**: Internet connection for initial setup
- 🔑 **Permissions**: Storage access permission

</div>

## 📱 **Compatibility**

### ✅ **Tested Devices**
<div style="display: flex; flex-wrap: wrap; gap: 10px;">

[![Pixel](https://img.shields.io/badge/Google%20Pixel-4285F4?style=flat-square&logo=google&logoColor=white)](https://pixel.google.com/)
[![OnePlus](https://img.shields.io/badge/OnePlus-E3002C?style=flat-square&logo=oneplus&logoColor=white)](https://oneplus.com/)
[![Samsung](https://img.shields.io/badge/Samsung-1428A0?style=flat-square&logo=samsung&logoColor=white)](https://samsung.com/)
[![Xiaomi](https://img.shields.io/badge/Xiaomi-FF6900?style=flat-square&logo=xiaomi&logoColor=white)](https://xiaomi.com/)

</div>

- 📱 Google Pixel series
- 🔥 OnePlus devices  
- 📱 Samsung Galaxy (limited GUI support)
- 🔥 Xiaomi/Redmi devices
- 💻 Most Android 7+ devices

### ❌ **Not Supported**
- 📱 Very old Android versions (<7.0)
- 💾 Devices with severe storage limitations
- 📱 Some Samsung devices (Android Terminal app only)

## 📜 **License**

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

*This project is open source and available under the MIT License.*

</div>

## 🤝 **Contributing**

<div style="background: #e3f2fd; padding: 15px; border-radius: 8px; border-left: 4px solid #2196f3;">

Contributions welcome! Areas for improvement:
- ➕ Additional distribution support
- 🎨 Better GUI integration
- 🔍 Enhanced auto-detection
- 📱 Mobile-specific optimizations

</div>

## 👥 **Credits**

<div align="center">

**🔥 Created with ❤️ by [Likhon Sheikh](https://t.me/likhonsheikh) 🔥**

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=flat&logo=telegram&logoColor=white)](https://t.me/likhonsheikh) 
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com) 
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com) 
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=flat&logo=twitter&logoColor=white)](https://twitter.com)

*Expert in Android Linux automation and mobile development*

---

**📅 Version**: 1.0  
**📆 Last Updated**: 2025-12-13  
**🏷️ Platform**: Android Linux Automation  
**👨‍💻 Author**: Likhon Sheikh  
**🌐 Telegram**: [@likhonsheikh](https://t.me/likhonsheikh)

*🚀 Transform your Android into a Linux powerhouse! 🚀*

</div>