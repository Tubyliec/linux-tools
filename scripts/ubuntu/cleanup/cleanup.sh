#!/bin/bash

# Ubuntu Cleanup Script
# Version: 1.0

# ─────────────────────────────────────────────
# Colors
# ─────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ─────────────────────────────────────────────
# Language selection
# ─────────────────────────────────────────────

echo -e "\n${BOLD}${CYAN}Select language:${NC}"
echo -e "  ${GREEN}1${NC}) English"
echo -e "  ${GREEN}2${NC}) Беларуская"
echo ""
read -rp "$(echo -e "${CYAN}  ${NC}")" _lang_choice

case "$_lang_choice" in
    2) LANG_CODE="be" ;;
    *) LANG_CODE="en" ;;
esac

# ─────────────────────────────────────────────
# Strings
# ─────────────────────────────────────────────

if [[ "$LANG_CODE" == "be" ]]; then

    S_SCRIPT_TITLE="  Скрыпт ачышчэння Ubuntu 1.0  "
    S_LOG_SAVED="Журнал захоўваецца ў:"
    S_DRY_RUN_WARN="Рэжым DRY-RUN: змены НЕ будуць ужытыя"
    S_DONE_TITLE="     Ачышчэнне завершана      "

    S_USAGE_HEADER="Выкарыстанне"
    S_USAGE_OPTIONS="Параметры"
    S_USAGE_DRY="Паказаць, што будзе зроблена, без выканання"
    S_USAGE_YES="Аўтаматычна пацвярджаць усе дзеянні"
    S_USAGE_JOURNAL="Захаваць журналы за апошнія N дзён (прадвызначана: 2)"
    S_USAGE_TMP="Выдаліць файлы з /tmp старэйшыя за N дзён (прадвызначана: 7)"
    S_USAGE_HELP="Паказаць гэтае паведамленне"
    S_USAGE_EXAMPLE="Прыклад"
    S_UNKNOWN_ARG="Невядомы аргумент"

    S_DISK_LABEL="Дыск (/):"
    S_DISK_TOTAL="Агулам"
    S_DISK_USED="Выкарыстана"
    S_DISK_FREE="Вольна"

    S_AUTO_CONFIRM="(аўта)"
    S_FREED="Вызвалена"
    S_NOT_CHANGED="(Памер не змяніўся)"
    S_RUN_ERROR="Не ўдалося выканаць"
    S_TOTAL_FREED="Агулам вызвалена"
    S_TOTAL_UNCHANGED="Агульны памер свабоднага месца не змяніўся (файлы маглі быць ужо ачышчаныя)."
    S_FULL_LOG="Поўны журнал"
    S_CURRENT_SIZE="Бягучы памер"
    S_PRESS_KEY="Націсніце любую клавішу для выхаду..."
    S_DISK_BEFORE="Да ачышчэння"
    S_DISK_AFTER="Пасля ачышчэння"

    S_SEC_APT="APT: кэш і залежнасці"
    S_Q_APT="Ачысціць кэш APT і выдаліць непатрэбныя пакеты?"
    S_RUN_AUTOCLEAN="Autoclean"
    S_RUN_CLEAN="Clean"
    S_RUN_AUTOREMOVE="Autoremove"

    S_SEC_RC="Файлы канфігурацыі выдаленых пакетаў"
    S_Q_RC="Выдаліць канфігурацыйныя файлы выдаленых пакетаў (стан rc)?"
    S_RC_NONE="Няма пакетаў са станам rc."
    S_RC_FOUND="Знойдзена пакет(аў)"
    S_RUN_RC="Выдаленне rc-пакетаў"

    S_SEC_SNAP="Snap: старыя рэвізіі"
    S_Q_SNAP="Выдаліць адключаныя рэвізіі Snap?"
    S_RUN_SNAP="Выдаленне"

    S_SEC_FLATPAK="Flatpak: занядбаныя пакеты"
    S_Q_FLATPAK="Выдаліць занядбаныя пакеты Flatpak?"

    S_SEC_JOURNAL="Журналы systemd"
    S_Q_JOURNAL="Ачысціць журналы (пакінуць толькі апошнія %d дзён)?"
    S_RUN_JOURNAL="Ачышчэнне журналаў"

    S_SEC_TMP="Часовыя файлы /tmp"
    S_Q_TMP="Выдаліць файлы з /tmp старэйшыя за %d дзён?"
    S_RUN_TMP="Ачышчэнне /tmp"

    S_SEC_CACHE="Кэш карыстальніка (~/.cache)"
    S_Q_CACHE="Ачысціць кэш карыстальніка?"
    S_RUN_CACHE="Ачышчэнне ~/.cache"

    S_SEC_TRASH="Сметніца"
    S_Q_TRASH="Ачысціць сметніцу?"
    S_RUN_TRASH="Ачышчэнне Trash"

    S_SEC_PIP="Кэш pip3"
    S_Q_PIP="Ачысціць кэш pip3?"

    S_SEC_DOCKER="Docker"
    S_Q_DOCKER="Ачысціць Docker (вобразы, кантэйнеры і тамы, якія не выкарыстоўваюцца)?"
    S_RUN_DOCKER="Docker system prune"

    S_SEC_KERNELS="Старыя ядры Linux"
    S_Q_KERNELS="Выдаліць старыя ядры Linux (будуць захаваны 2 апошніх)?"
    S_KERN_CURRENT="Бягучае ядро"
    S_KERN_INSTALLED="Усталяваныя ядры"
    S_KERN_SAFE="Бяспечна пакінуць (2 апошніх)"
    S_KERN_REMOVE="Будуць выдалены"
    S_KERN_NONE="Старых ядраў для выдалення не знойдзена."
    S_RUN_KERN="Выдаленне ядра"

    S_SEC_SYMLINKS="Зламаныя сімвалічныя спасылкі"
    S_Q_SYMLINKS="Знайсці і выдаліць зламаныя сімвалічныя спасылкі ў хатнім каталогу?"
    S_SYM_SCANNING="Пошук зламаных спасылак у"
    S_SYM_FOUND="Знойдзена зламаных спасылак"
    S_SYM_NONE="Зламаных спасылак не знойдзена."
    S_RUN_SYM="Выдаленне зламанай спасылкі"

    S_SEC_DEVCACHE="Кэш інструментаў распрацоўшчыка"
    S_Q_NPM="Ачысціць кэш npm?"
    S_Q_YARN="Ачысціць кэш Yarn?"
    S_Q_GRADLE="Выдаліць кэш Gradle (~/.gradle/caches)?"
    S_Q_MAVEN="Выдаліць кэш Maven (~/.m2/repository)?"
    S_Q_GO="Ачысціць кэш Go?"
    S_Q_CARGO="Ачысціць кэш Cargo (~/.cargo/registry)?"

    S_SEC_CRASH="Crash-справаздачы"
    S_Q_CRASH_SYS="Выдаліць сістэмныя crash-справаздачы (/var/crash)?"
    S_Q_CRASH_CORE="Выдаліць coredump-файлы systemd (/var/lib/systemd/coredump)?"
    S_Q_CRASH_APPORT="Выдаліць кэш Apport (~/.cache/upstart, ~/.local/share/apport)?"
    S_CRASH_NONE="Crash-справаздач не знойдзена."
    S_CRASH_FOUND="Знойдзена файлаў"

    S_SEC_EMPTYDIRS="Пустыя каталогі"
    S_Q_EMPTYDIRS="Знайсці і выдаліць пустыя каталогі ў хатнім каталогу?"
    S_EDIRS_SCANNING="Пошук пустых каталогаў у"
    S_EDIRS_FOUND="Знойдзена пустых каталогаў"
    S_EDIRS_NONE="Пустых каталогаў не знойдзена."
    S_RUN_EDIR="Выдаленне"

else

    S_SCRIPT_TITLE="   Ubuntu Cleanup Script 1.0   "
    S_LOG_SAVED="Log saved to:"
    S_DRY_RUN_WARN="DRY-RUN mode: no changes will be applied"
    S_DONE_TITLE="        Cleanup complete       "

    S_USAGE_HEADER="Usage"
    S_USAGE_OPTIONS="Options"
    S_USAGE_DRY="Show what would be done, without executing"
    S_USAGE_YES="Automatically confirm all actions"
    S_USAGE_JOURNAL="Keep journal logs for the last N days (default: 2)"
    S_USAGE_TMP="Delete files from /tmp older than N days (default: 7)"
    S_USAGE_HELP="Show this message"
    S_USAGE_EXAMPLE="Example"
    S_UNKNOWN_ARG="Unknown argument"

    S_DISK_LABEL="Disk (/):"
    S_DISK_TOTAL="Total"
    S_DISK_USED="Used"
    S_DISK_FREE="Free"

    S_AUTO_CONFIRM="(auto)"
    S_FREED="Freed"
    S_NOT_CHANGED="(Size unchanged)"
    S_RUN_ERROR="Error executing"
    S_TOTAL_FREED="Total freed"
    S_TOTAL_UNCHANGED="Overall free space did not change (files may have already been cleaned)."
    S_FULL_LOG="Full log"
    S_CURRENT_SIZE="Current size"
    S_PRESS_KEY="Press any key to exit..."
    S_DISK_BEFORE="Before cleanup"
    S_DISK_AFTER="After cleanup"

    S_SEC_APT="APT: cache and dependencies"
    S_Q_APT="Clean APT cache and remove unused packages?"
    S_RUN_AUTOCLEAN="Autoclean"
    S_RUN_CLEAN="Clean"
    S_RUN_AUTOREMOVE="Autoremove"

    S_SEC_RC="Config files of removed packages"
    S_Q_RC="Remove config files of deinstalled packages (rc state)?"
    S_RC_NONE="No packages in rc state."
    S_RC_FOUND="Found package(s)"
    S_RUN_RC="Purge rc packages"

    S_SEC_SNAP="Snap: old revisions"
    S_Q_SNAP="Remove disabled Snap revisions?"
    S_RUN_SNAP="Removing"

    S_SEC_FLATPAK="Flatpak: unused packages"
    S_Q_FLATPAK="Remove unused Flatpak packages?"

    S_SEC_JOURNAL="systemd journal logs"
    S_Q_JOURNAL="Clean journal logs (keep only last %d days)?"
    S_RUN_JOURNAL="Vacuum journal"

    S_SEC_TMP="Temporary files /tmp"
    S_Q_TMP="Delete files from /tmp older than %d days?"
    S_RUN_TMP="Cleaning /tmp"

    S_SEC_CACHE="User cache (~/.cache)"
    S_Q_CACHE="Clean user cache?"
    S_RUN_CACHE="Cleaning ~/.cache"

    S_SEC_TRASH="Trash"
    S_Q_TRASH="Empty the Trash?"
    S_RUN_TRASH="Cleaning Trash"

    S_SEC_PIP="pip3 cache"
    S_Q_PIP="Clean pip3 cache?"

    S_SEC_DOCKER="Docker"
    S_Q_DOCKER="Clean Docker (unused images, containers, volumes)?"
    S_RUN_DOCKER="Docker system prune"

    S_SEC_KERNELS="Old Linux kernels"
    S_Q_KERNELS="Remove old Linux kernels (keep 2 latest)?"
    S_KERN_CURRENT="Current kernel"
    S_KERN_INSTALLED="Installed kernels"
    S_KERN_SAFE="Safe to keep (2 latest)"
    S_KERN_REMOVE="Will be removed"
    S_KERN_NONE="No old kernels found to remove."
    S_RUN_KERN="Removing kernel"

    S_SEC_SYMLINKS="Broken symbolic links"
    S_Q_SYMLINKS="Find and remove broken symbolic links in home directory?"
    S_SYM_SCANNING="Scanning for broken links in"
    S_SYM_FOUND="Broken symlinks found"
    S_SYM_NONE="No broken symlinks found."
    S_RUN_SYM="Removing broken symlink"

    S_SEC_DEVCACHE="Developer tools cache"
    S_Q_NPM="Clean npm cache?"
    S_Q_YARN="Clean Yarn cache?"
    S_Q_GRADLE="Remove Gradle cache (~/.gradle/caches)?"
    S_Q_MAVEN="Remove Maven cache (~/.m2/repository)?"
    S_Q_GO="Clean Go cache?"
    S_Q_CARGO="Clean Cargo cache (~/.cargo/registry)?"

    S_SEC_CRASH="Crash reports"
    S_Q_CRASH_SYS="Remove system crash reports (/var/crash)?"
    S_Q_CRASH_CORE="Remove systemd coredump files (/var/lib/systemd/coredump)?"
    S_Q_CRASH_APPORT="Remove Apport cache (~/.cache/upstart, ~/.local/share/apport)?"
    S_CRASH_NONE="No crash reports found."
    S_CRASH_FOUND="Files found"

    S_SEC_EMPTYDIRS="Empty directories"
    S_Q_EMPTYDIRS="Find and remove empty directories in home directory?"
    S_EDIRS_SCANNING="Scanning for empty directories in"
    S_EDIRS_FOUND="Empty directories found"
    S_EDIRS_NONE="No empty directories found."
    S_RUN_EDIR="Removing"

fi

# ─────────────────────────────────────────────
# Configuration
# ─────────────────────────────────────────────

LOG_FILE="${HOME}/ubuntu-cleanup-$(date +%Y%m%d_%H%M%S).log"
DRY_RUN=false
ASSUME_YES=false
JOURNAL_DAYS=2
TMP_DAYS=7

# ─────────────────────────────────────────────
# Helper functions
# ─────────────────────────────────────────────

log()     { echo -e "$1" | tee -a "$LOG_FILE"; }
info()    { log "${GREEN}✔ $*${NC}"; }
warn()    { log "${YELLOW}⚠ $*${NC}"; }
error()   { log "${RED}✘ $*${NC}"; }
section() { log "\n${BOLD}${CYAN}═══ $* ═══${NC}"; }

usage() {
    cat <<EOF
$S_USAGE_HEADER: $(basename "$0") [OPTIONS]

$S_USAGE_OPTIONS:
  -n, --dry-run     $S_USAGE_DRY
  -y, --yes         $S_USAGE_YES
  -j, --journal N   $S_USAGE_JOURNAL
  -t, --tmp N       $S_USAGE_TMP
  -h, --help        $S_USAGE_HELP

$S_USAGE_EXAMPLE:
  $(basename "$0") --dry-run
  $(basename "$0") -y -j 7
EOF
    exit 0
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -n|--dry-run)  DRY_RUN=true ;;
        -y|--yes)      ASSUME_YES=true ;;
        -j|--journal)  JOURNAL_DAYS="$2"; shift ;;
        -t|--tmp)      TMP_DAYS="$2"; shift ;;
        -h|--help)     usage ;;
        *) error "$S_UNKNOWN_ARG: $1"; usage ;;
    esac
    shift
done

touch "$LOG_FILE" || { echo "Cannot create log file: $LOG_FILE"; exit 1; }

# ─────────────────────────────────────────────
# Header
# ─────────────────────────────────────────────

log "${BOLD}${GREEN}"
log "╔══════════════════════════════════════╗"
log "║${S_SCRIPT_TITLE}║"
log "╚══════════════════════════════════════╝${NC}"
log "$S_LOG_SAVED ${CYAN}$LOG_FILE${NC}"
$DRY_RUN && warn "$S_DRY_RUN_WARN\n"

# ─────────────────────────────────────────────
# Functions
# ─────────────────────────────────────────────

confirm() {
    local prompt="$1"
    if $ASSUME_YES; then
        log "${CYAN}? $prompt [Y/n]: Y $S_AUTO_CONFIRM${NC}"
        return 0
    fi
    read -rp "$(echo -e "${CYAN}? $prompt [Y/n]: ${NC}")" response
    case "$response" in
        [nNнН]*) return 1 ;;
        *) return 0 ;;
    esac
}

free_bytes() {
    df --output=avail -B1 / 2>/dev/null | tail -1 | tr -d ' '
}

run() {
    local msg="$1"; shift
    if $DRY_RUN; then
        warn "[DRY-RUN] $msg: $*"
    else
        log "  → $msg"
        if ! "$@" >> "$LOG_FILE" 2>&1; then
            error "$S_RUN_ERROR: $*"
        fi
    fi
}

show_disk() {
    log "\n${YELLOW}$S_DISK_LABEL${NC}"
    df -h / | tail -1 \
        | awk -v t="$S_DISK_TOTAL" -v u="$S_DISK_USED" -v f="$S_DISK_FREE" \
              '{printf "  %s: %s  |  %s: %s  |  %s: %s  (%s)\n", t,$2, u,$3, f,$4, $5}' \
        | tee -a "$LOG_FILE"
}

freed_report() {
    local before="$1" after delta
    after=$(free_bytes)
    delta=$(( after - before ))
    if (( delta > 0 )); then
        info "$S_FREED: $(numfmt --to=iec "$delta")"
    else
        log "  $S_NOT_CHANGED"
    fi
}

# ─────────────────────────────────────────────
# Start
# ─────────────────────────────────────────────

show_disk
TOTAL_BEFORE=$(free_bytes)
DISK_USED_BEFORE=$(df -h / | tail -1 | awk '{print $3}')

# ═════════════════════════════════════════════
# GROUP 1: System packages
# ═════════════════════════════════════════════

# ── APT ─────────────────────────────────────────
section "$S_SEC_APT"
if confirm "$S_Q_APT"; then
    before=$(free_bytes)
    run "$S_RUN_AUTOCLEAN"  sudo apt-get autoclean
    run "$S_RUN_CLEAN"      sudo apt-get clean
    run "$S_RUN_AUTOREMOVE" sudo apt-get autoremove --purge -y
    freed_report "$before"
fi

# ── RC packages ──────────────────────────────────────
section "$S_SEC_RC"
mapfile -t rc_pkgs < <(dpkg-query -W -f='${Status} ${Package}\n' | awk '/^deinstall/{print $NF}')
if (( ${#rc_pkgs[@]} == 0 )); then
    log "  $S_RC_NONE"
elif confirm "$S_Q_RC"; then
    log "  $S_RC_FOUND: ${#rc_pkgs[@]} — ${rc_pkgs[*]}"
    before=$(free_bytes)
    run "$S_RUN_RC" sudo apt-get purge -y "${rc_pkgs[@]}"
    freed_report "$before"
fi

# ── Old Linux kernels ────────────────────────────────────
section "$S_SEC_KERNELS"
if confirm "$S_Q_KERNELS"; then
    current_kernel=$(uname -r)
    log "  $S_KERN_CURRENT: ${CYAN}$current_kernel${NC}"

    # Collect all installed kernels, sort by version (newest first)
    mapfile -t all_kernels < <(
        dpkg-query -W -f='${Package}\n' 'linux-image-[0-9]*' 2>/dev/null \
        | sort -V -r
    )
    log "  $S_KERN_INSTALLED: ${all_kernels[*]}"

    # Keep 2 latest + currently running
    safe_kernels=()
    count=0
    for k in "${all_kernels[@]}"; do
        ver="${k#linux-image-}"
        if [[ "$ver" == "$current_kernel" ]] || (( count < 2 )); then
            safe_kernels+=("$k")
            (( count++ )) || true
        fi
    done
    log "  $S_KERN_SAFE: ${safe_kernels[*]}"

    # Find kernels to remove
    remove_kernels=()
    for k in "${all_kernels[@]}"; do
        skip=false
        for s in "${safe_kernels[@]}"; do
            [[ "$k" == "$s" ]] && skip=true && break
        done
        $skip || remove_kernels+=("$k")
    done

    if (( ${#remove_kernels[@]} == 0 )); then
        log "  $S_KERN_NONE"
    else
        log "  $S_KERN_REMOVE: ${remove_kernels[*]}"
        before=$(free_bytes)
        for k in "${remove_kernels[@]}"; do
            run "$S_RUN_KERN: $k" sudo apt-get purge -y "$k"
        done
        run "Autoremove after kernel purge" sudo apt-get autoremove --purge -y
        freed_report "$before"
    fi
fi

# ── Snap ──────────────────────────────────────────
if command -v snap &>/dev/null; then
    section "$S_SEC_SNAP"
    if confirm "$S_Q_SNAP"; then
        before=$(free_bytes)
        while IFS= read -r line; do
            name=$(awk '{print $1}' <<< "$line")
            rev=$(awk  '{print $3}' <<< "$line")
            [[ -z "$name" || -z "$rev" ]] && continue
            run "$S_RUN_SNAP $name rev.$rev" sudo snap remove "$name" --revision="$rev"
        done < <(snap list --all | awk '/disabled/')
        freed_report "$before"
    fi
fi

# ── Flatpak ────────────────────────────────────────
if command -v flatpak &>/dev/null; then
    section "$S_SEC_FLATPAK"
    if confirm "$S_Q_FLATPAK"; then
        before=$(free_bytes)
        log "  → flatpak uninstall --unused"
        flatpak uninstall --unused -y >> "$LOG_FILE" 2>&1 || true
        freed_report "$before"
    fi
fi

# ═════════════════════════════════════════════
# GROUP 2: System files
# ═════════════════════════════════════════════

# ── Journal ──────────────────────────────────────────
section "$S_SEC_JOURNAL"
# shellcheck disable=SC2059
if confirm "$(printf "$S_Q_JOURNAL" "$JOURNAL_DAYS")"; then
    log "  $S_CURRENT_SIZE:"
    sudo journalctl --disk-usage 2>/dev/null | tee -a "$LOG_FILE" || true
    before=$(free_bytes)
    run "$S_RUN_JOURNAL" sudo journalctl --vacuum-time="${JOURNAL_DAYS}d"
    freed_report "$before"
fi

# ── /tmp ──────────────────────────────────────────
section "$S_SEC_TMP"
# shellcheck disable=SC2059
if confirm "$(printf "$S_Q_TMP" "$TMP_DAYS")"; then
    log "  $S_CURRENT_SIZE /tmp: $(du -sh /tmp 2>/dev/null | cut -f1)"
    before=$(free_bytes)
    run "$S_RUN_TMP" sudo find /tmp -mindepth 1 -atime "+${TMP_DAYS}" -delete
    freed_report "$before"
fi

# ── Crash reports ─────────────────────────────────────
section "$S_SEC_CRASH"

# /var/crash
_var_crash_count=$(find /var/crash -maxdepth 1 -type f 2>/dev/null | wc -l)
if (( _var_crash_count > 0 )); then
    if confirm "$S_Q_CRASH_SYS"; then
        log "  $S_CRASH_FOUND: $_var_crash_count"
        before=$(free_bytes)
        run "/var/crash cleanup" sudo find /var/crash -maxdepth 1 -type f -delete
        freed_report "$before"
    fi
else
    log "  /var/crash — $S_CRASH_NONE"
fi

# systemd coredumps
_coredump_dir="/var/lib/systemd/coredump"
_coredump_count=$(find "$_coredump_dir" -maxdepth 1 -type f 2>/dev/null | wc -l)
if (( _coredump_count > 0 )); then
    if confirm "$S_Q_CRASH_CORE"; then
        log "  $S_CRASH_FOUND: $_coredump_count"
        before=$(free_bytes)
        run "coredump cleanup" sudo find "$_coredump_dir" -maxdepth 1 -type f -delete
        freed_report "$before"
    fi
else
    log "  coredump — $S_CRASH_NONE"
fi

# Apport / upstart
_apport_dirs=("$HOME/.cache/upstart" "$HOME/.local/share/apport")
_apport_found=false
for _d in "${_apport_dirs[@]}"; do
    [[ -d "$_d" ]] && _apport_found=true && break
done
if $_apport_found; then
    if confirm "$S_Q_CRASH_APPORT"; then
        before=$(free_bytes)
        for _d in "${_apport_dirs[@]}"; do
            [[ -d "$_d" ]] && run "Apport: $_d" find "$_d" -mindepth 1 -delete
        done
        freed_report "$before"
    fi
else
    log "  Apport — $S_CRASH_NONE"
fi

# ── Broken symlinks ────────────────────────────────────
section "$S_SEC_SYMLINKS"
if confirm "$S_Q_SYMLINKS"; then
    log "  $S_SYM_SCANNING: $HOME ..."
    mapfile -t broken_links < <(
        find "$HOME" -xtype l 2>/dev/null
    )
    if (( ${#broken_links[@]} == 0 )); then
        log "  $S_SYM_NONE"
    else
        log "  ${YELLOW}$S_SYM_FOUND: ${#broken_links[@]}${NC}"
        before=$(free_bytes)
        for lnk in "${broken_links[@]}"; do
            log "    ${RED}✘${NC} $lnk"
            if ! $DRY_RUN; then
                rm -f "$lnk" >> "$LOG_FILE" 2>&1 \
                    || error "$S_RUN_ERROR: rm $lnk"
            else
                warn "[DRY-RUN] $S_RUN_SYM: $lnk"
            fi
        done
        freed_report "$before"
    fi
fi

# ── Empty directories ──────────────────────────────────
section "$S_SEC_EMPTYDIRS"
if confirm "$S_Q_EMPTYDIRS"; then
    log "  $S_EDIRS_SCANNING: $HOME ..."
    mapfile -t empty_dirs < <(
        find "$HOME" -mindepth 1 -type d -empty 2>/dev/null \
        | sort -r
    )
    if (( ${#empty_dirs[@]} == 0 )); then
        log "  $S_EDIRS_NONE"
    else
        log "  ${YELLOW}$S_EDIRS_FOUND: ${#empty_dirs[@]}${NC}"
        for _d in "${empty_dirs[@]}"; do
            log "    ${YELLOW}→${NC} $_d"
            if ! $DRY_RUN; then
                rmdir "$_d" 2>/dev/null || true
            else
                warn "[DRY-RUN] $S_RUN_EDIR: $_d"
            fi
        done
    fi
fi

# ═════════════════════════════════════════════
# GROUP 3: User files
# ═════════════════════════════════════════════

# ── User cache ─────────────────────────────────────────
section "$S_SEC_CACHE"
if confirm "$S_Q_CACHE"; then
    log "  $S_CURRENT_SIZE: $(du -sh ~/.cache 2>/dev/null | cut -f1)"
    before=$(free_bytes)
    run "$S_RUN_CACHE" find "${HOME}/.cache" -mindepth 1 -delete
    freed_report "$before"
fi

# ── Trash ──────────────────────────────────────────
section "$S_SEC_TRASH"
if confirm "$S_Q_TRASH"; then
    log "  $S_CURRENT_SIZE: $(du -sh ~/.local/share/Trash 2>/dev/null | cut -f1)"
    before=$(free_bytes)
    run "$S_RUN_TRASH" find "${HOME}/.local/share/Trash" -mindepth 1 -delete
    freed_report "$before"
fi

# ═════════════════════════════════════════════
# GROUP 4: Development
# ═════════════════════════════════════════════

# ── pip3 ───────────────────────────────────────────
if command -v pip3 &>/dev/null; then
    section "$S_SEC_PIP"
    if confirm "$S_Q_PIP"; then
        before=$(free_bytes)
        run "pip3 cache purge" pip3 cache purge
        freed_report "$before"
    fi
fi

# ── Developer caches ──────────────────────────────────
section "$S_SEC_DEVCACHE"

if command -v npm &>/dev/null; then
    if confirm "$S_Q_NPM"; then
        log "  $S_CURRENT_SIZE: $(du -sh ~/.npm 2>/dev/null | cut -f1)"
        before=$(free_bytes)
        run "npm cache clean" npm cache clean --force
        freed_report "$before"
    fi
fi

if command -v yarn &>/dev/null; then
    if confirm "$S_Q_YARN"; then
        log "  $S_CURRENT_SIZE: $(du -sh "$(yarn cache dir 2>/dev/null)" 2>/dev/null | cut -f1)"
        before=$(free_bytes)
        run "yarn cache clean" yarn cache clean
        freed_report "$before"
    fi
fi

if [[ -d "$HOME/.gradle/caches" ]]; then
    if confirm "$S_Q_GRADLE"; then
        log "  $S_CURRENT_SIZE: $(du -sh ~/.gradle/caches 2>/dev/null | cut -f1)"
        before=$(free_bytes)
        run "Gradle cache" find "${HOME}/.gradle/caches" -mindepth 1 -delete
        freed_report "$before"
    fi
fi

if [[ -d "$HOME/.m2/repository" ]]; then
    if confirm "$S_Q_MAVEN"; then
        log "  $S_CURRENT_SIZE: $(du -sh ~/.m2/repository 2>/dev/null | cut -f1)"
        before=$(free_bytes)
        run "Maven cache" find "${HOME}/.m2/repository" -mindepth 1 -delete
        freed_report "$before"
    fi
fi

if command -v go &>/dev/null; then
    if confirm "$S_Q_GO"; then
        log "  $S_CURRENT_SIZE: $(go env GOCACHE 2>/dev/null | xargs du -sh 2>/dev/null | cut -f1)"
        before=$(free_bytes)
        run "Go cache clean" go clean -cache
        freed_report "$before"
    fi
fi

if [[ -d "$HOME/.cargo/registry" ]]; then
    if confirm "$S_Q_CARGO"; then
        log "  $S_CURRENT_SIZE: $(du -sh ~/.cargo/registry 2>/dev/null | cut -f1)"
        before=$(free_bytes)
        run "Cargo registry cache" find "${HOME}/.cargo/registry" -mindepth 1 -delete
        freed_report "$before"
    fi
fi

# ── Docker ──────────────────────────────────────────
if command -v docker &>/dev/null; then
    section "$S_SEC_DOCKER"
    if ! sudo docker info &>/dev/null; then
        warn "Docker daemon is not running — skipping"
    elif confirm "$S_Q_DOCKER"; then
        log "  $S_CURRENT_SIZE:"
        sudo docker system df 2>/dev/null | tee -a "$LOG_FILE" || true
        before=$(free_bytes)
        run "$S_RUN_DOCKER" sudo docker system prune -a --volumes -f
        freed_report "$before"
    fi
fi

# ─────────────────────────────────────────────
# Final report
# ─────────────────────────────────────────────

TOTAL_AFTER=$(free_bytes)
TOTAL_FREED=$(( TOTAL_AFTER - TOTAL_BEFORE ))
DISK_USED_AFTER=$(df -h / | tail -1 | awk '{print $3}')
DISK_FREE_AFTER=$(df -h / | tail -1 | awk '{print $4}')
DISK_PCT_AFTER=$(df -h / | tail -1 | awk '{print $5}')

log ""
log "${BOLD}${GREEN}"
log "╔══════════════════════════════════════╗"
log "║${S_DONE_TITLE}║"
log "╚══════════════════════════════════════╝${NC}"

# Before / After table
log ""
log "${YELLOW}  ${S_DISK_BEFORE}:${NC}  ${S_DISK_USED}: ${CYAN}${DISK_USED_BEFORE}${NC}"
log "${YELLOW}  ${S_DISK_AFTER}:${NC}   ${S_DISK_USED}: ${CYAN}${DISK_USED_AFTER}${NC}  |  ${S_DISK_FREE}: ${CYAN}${DISK_FREE_AFTER}${NC}  (${DISK_PCT_AFTER})"
log ""

if (( TOTAL_FREED > 0 )); then
    log "${BOLD}${GREEN}  ✔ $S_TOTAL_FREED: $(numfmt --to=iec "$TOTAL_FREED")${NC}"
else
    warn "$S_TOTAL_UNCHANGED"
fi

log "\n$S_FULL_LOG: ${CYAN}$LOG_FILE${NC}"
log ""

# Press any key to exit
$ASSUME_YES || read -rsp "$(echo -e "${CYAN}  $S_PRESS_KEY${NC}")" -n1
echo ""
