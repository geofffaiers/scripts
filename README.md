# Personal Scripts Collection

A collection of useful automation scripts for Linux development and system management.

## 📁 Scripts Overview

### Git Workflows
- **`gflow`** - Git Flow Git: Comprehensive git workflow automation
  - New branch creation with stashing
  - Merge main workflows
  - Clean/reset operations
  - Quick commit functionality

### System Utilities
- **`update-docker-desktop`** - Automated Docker Desktop updater for Linux
  - Version checking and comparison
  - Automatic download and installation
  - Service restart handling

## 🚀 Installation

### Quick Setup
Clone this repository and run the installation script:

```bash
git clone https://github.com/geofffaiers/scripts.git
cd scripts
chmod +x install.sh
./install.sh
```

### Manual Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/geofffaiers/scripts.git
   ```

2. Add scripts to your PATH by symlinking to `~/scripts`:
   ```bash
   ln -sf $(pwd)/git/gflow ~/scripts/gflow
   ln -sf $(pwd)/system/update-docker-desktop ~/scripts/update-docker-desktop
   ```

3. Ensure `~/scripts` is in your PATH (add to `~/.bashrc` or `~/.zshrc`):
   ```bash
   export PATH="$HOME/scripts:$PATH"
   ```

## 📖 Usage

### Git Workflows (`gflow`)

Create or checkout a new branch:
```bash
gflow -n feature/user-authentication
```

Merge main into your current branch:
```bash
gflow -m feature/user-authentication
```

Merge main with automatic stashing:
```bash
gflow -ms feature/user-authentication
```

Quick commit all changes:
```bash
gflow -qc "Fix user authentication bug"
```

Clean working directory (discard all changes):
```bash
gflow -c
```

### System Utilities

Update Docker Desktop:
```bash
update-docker-desktop
```

## 🛠️ Features

### `gflow` Features
- ✅ Automatic stashing and unstashing
- ✅ Smart branch detection (main/master)
- ✅ Remote branch existence checking
- ✅ Protected branch validation
- ✅ Merge conflict detection
- ✅ Colored output and progress reporting
- ✅ Comprehensive error handling

### `update-docker-desktop` Features
- ✅ Version comparison with latest releases
- ✅ Automatic download and installation
- ✅ Service restart after update
- ✅ Safe error handling

## 🔧 Requirements

### General
- Linux (tested on Ubuntu/Debian)
- Bash 4.0+
- Git

### For `gflow`
- Git repository access
- Remote origin configured

### For `update-docker-desktop`
- Docker Desktop installed via `.deb` package
- `curl` and `wget`
- `sudo` access for package installation

## 📝 Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🧑‍💻 Author

**Geoff Faiers**
- Personal automation scripts for development workflow

## 🏷️ Version History

- **v1.0** - Initial release with git workflows and Docker Desktop updater