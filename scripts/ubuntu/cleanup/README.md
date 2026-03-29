# Ubuntu Cleanup Script

This script (`cleanup.sh`) is designed to perform various cleanup tasks on an Ubuntu system. It helps to free up disk space and improve system performance by removing unnecessary files, packages, and caches.

## Features

- **Language Selection:** Supports both English and Belarusian languages for user interaction.
- **APT Cache and Dependencies:** Cleans APT package manager cache and removes unused packages.
- **Configuration Files of Removed Packages:** Removes configuration files of deinstalled packages (those in `rc` state).
- **Old Linux Kernels:** Identifies and removes old, unused kernel versions, keeping the 2 latest and the current one.
- **Snap Old Revisions:** Removes disabled Snap revisions.
- **Flatpak Unused Packages:** Removes unused Flatpak packages.
- **Systemd Journal Logs:** Cleans systemd journal logs, keeping only logs for a specified number of recent days (default: 2 days).
- **Temporary Files (`/tmp`):** Deletes files from `/tmp` older than a specified number of days (default: 7 days).
- **Crash Reports:** Removes system crash reports (`/var/crash`), systemd coredump files (`/var/lib/systemd/coredump`), and Apport cache (`~/.cache/upstart`, `~/.local/share/apport`).
- **Broken Symbolic Links:** Finds and removes broken symbolic links in the user's home directory.
- **Empty Directories:** Finds and removes empty directories in the user's home directory.
- **User Cache (`~/.cache`):** Cleans the user's cache directory.
- **Trash Emptying:** Empties the user's trash directory.
- **pip3 Cache:** Cleans the pip3 cache.
- **Developer Tools Cache:** Cleans caches for npm, Yarn, Gradle (`~/.gradle/caches`), Maven (`~/.m2/repository`), Go, and Cargo (`~/.cargo/registry`).
- **Docker Cleanup:** Cleans unused Docker images, containers, and volumes.

## Usage

To run the script, simply execute it from your terminal:

```bash
./cleanup.sh
```

Follow the on-screen prompts to select your preferred language and the cleanup actions you wish to perform.

### Options

- `-n`, `--dry-run`: Show what would be done, without executing any changes.
- `-y`, `--yes`: Automatically confirm all actions.
- `-j N`, `--journal N`: Keep journal logs for the last N days (default: 2).
- `-t N`, `--tmp N`: Delete files from `/tmp` older than N days (default: 7).
- `-h`, `--help`: Show the usage message.

### Example

```bash
./cleanup.sh --dry-run
./cleanup.sh -y -j 7
```

## Contributing

If you have suggestions for improvements or new features, feel free to contribute to this project.
