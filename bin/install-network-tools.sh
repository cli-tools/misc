# install-net-utils.sh
# POSIX shell script to install common network troubleshooting tools.
# Installs: ping, iproute2 (ip, ss), nslookup, dig, ifconfig
# Works on Debian/Ubuntu, Fedora/RHEL, Alpine, and Arch.
# Usage: . ./install-net-utils.sh

install_pkgs() {
    if [ "$(id -u)" -eq 0 ]; then
        SUDO=""
    else
        if command -v sudo >/dev/null 2>&1; then
            SUDO="sudo"
        else
            echo "Root privileges or sudo required."
            return 1
        fi
    fi

    if command -v apt-get >/dev/null 2>&1; then
        PM="apt"
    elif command -v dnf >/dev/null 2>&1; then
        PM="dnf"
    elif command -v apk >/dev/null 2>&1; then
        PM="apk"
    elif command -v pacman >/dev/null 2>&1; then
        PM="pacman"
    else
        echo "Unsupported package manager"
        return 1
    fi

    case "$PM" in
        apt)
            $SUDO apt-get update
            $SUDO apt-get install -y \
                dnsutils \
                iproute2 \
                iputils-ping \
                net-tools
            ;;
        dnf)
            $SUDO dnf install -y \
                bind-utils \
                iproute \
                iputils \
                net-tools
            ;;
        apk)
            $SUDO apk add --no-cache \
                bind-tools \
                iproute2 \
                iputils \
                net-tools
            ;;
        pacman)
            $SUDO pacman -Sy --noconfirm \
                bind-tools \
                iproute2 \
                iputils \
                net-tools
            ;;
    esac
}

install_pkgs
unset -f install_pkgs
