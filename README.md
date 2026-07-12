# dotfiles

My personal configuration files managed with [chezmoi](https://www.chezmoi.io/).

## 🚀 Quick Start

To set up these dotfiles on a new machine, run the following single command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply あなたのGitHubユーザー名
```

## Daily Workflow

### Add a new file

```bash
chezmoi add ~/.zshrc
```

### Edit an existing file

```bash
chezmoi add ~/.zshrc
```

### Apply changes

```bash
chezmoi add ~/.zshrc
```

### Check differences

```bash
chezmoi add ~/.zshrc
```

## Custom Directory Note

This setup uses a custom source directory defined in `~/.config/chezmoi/chezmoi.toml`.

```bash
sourceDir = `Your custom Configuration`
```
