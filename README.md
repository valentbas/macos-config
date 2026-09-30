# macos-config

MacOS setup, managed with [Homebrew](https://brew.sh) and a `Brewfile`.

## Setup

Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install everything in the `Brewfile`:

```sh
brew bundle install
```

## Useful brew commands

### Brewfile

| Command | Description |
| --- | --- |
| `brew bundle install` | Install everything listed in the `Brewfile` |
| `brew bundle check` | Check whether everything in the `Brewfile` is installed |
| `brew bundle cleanup` | List installed packages not in the `Brewfile` (add `--force` to uninstall them) |
| `brew bundle dump --force --describe` | Overwrite the `Brewfile` with what's currently installed, with descriptions |

### Installing and removing

| Command | Description |
| --- | --- |
| `brew install <formula>` | Install a command-line package |
| `brew install --cask <cask>` | Install a GUI app |
| `brew uninstall <name>` | Uninstall a package or app |
| `brew uninstall --cask --zap <cask>` | Uninstall a GUI app and all its associated files (preferences, caches, etc.) |
| `brew autoremove` | Remove dependencies that are no longer needed |

### Updating

| Command | Description |
| --- | --- |
| `brew update` | Update Homebrew and the package index |
| `brew outdated` | List packages with newer versions available |
| `brew upgrade` | Upgrade all outdated packages |
| `brew upgrade <name>` | Upgrade a single package |
| `brew pin <formula>` / `brew unpin <formula>` | Prevent / allow upgrades of a formula |

### Finding and inspecting

| Command | Description |
| --- | --- |
| `brew search <text>` | Search for formulae and casks |
| `brew info <name>` | Show details about a package |
| `brew list` | List installed packages |
| `brew leaves` | List installed formulae that aren't dependencies of others |
| `brew deps --tree <formula>` | Show a formula's dependency tree |
| `brew uses --installed <formula>` | Show installed packages that depend on a formula |

### Maintenance

| Command | Description |
| --- | --- |
| `brew cleanup` | Remove old versions and cached downloads |
| `brew doctor` | Check your system for potential problems |
| `brew services list` | List background services managed by Homebrew |
