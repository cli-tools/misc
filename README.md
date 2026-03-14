# cli-tools/misc

Miscellaneous CLI tool installers — POSIX shell scripts that detect your
package manager and install common utilities.

## Quick install

```sh
curl -fsSL https://cli-tools.github.io/misc/bin/install-network-tools.sh | sh
```

Or with `wget`:

```sh
wget -qO- https://cli-tools.github.io/misc/bin/install-network-tools.sh | sh
```

## Included tools

| Script | What it installs |
|--------|-----------------|
| `install-network-tools.sh` | `ping`, `ip`, `ss`, `dig`, `nslookup`, `ifconfig` |

## Supported distros

- Debian / Ubuntu (`apt`)
- Fedora / RHEL (`dnf`)
- Arch Linux (`pacman`)

## GitHub Pages

This repo is published via GitHub Pages at
`https://cli-tools.github.io/misc/`. Enable it in the repo settings under
**Pages → Source → Deploy from a branch → `master` / `/ (root)`**.
