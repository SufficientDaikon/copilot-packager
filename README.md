# copilot-packager

> **Part of [sdd-vscode-agents](https://github.com/SufficientDaikon/sdd-vscode-agents)** — install the full collection for the complete SDD pipeline + UI/UX lifecycle.

A VS Code Copilot agent plugin that packages Copilot agents, skills, and artifacts into shareable GitHub repos with documentation.

## What it does

The **packager** agent creates distribution packages:
- Generates professional README.md with install instructions
- Creates a self-contained docs/ website (HTML/CSS)
- Adds cross-platform install scripts (sh + ps1)
- Configures proper .gitignore and LICENSE
- Pushes to GitHub with proper branch setup

## Hooks included

| Hook | Event | What it does |
|------|-------|-------------|
| **Artifact scan** | `SessionStart` | Scans for agent files, README, package.json, and other packageable artifacts |
| **Package summary** | `Stop` | Confirms the package was created and reminds about the documentation website |

## Install

### Via Copilot CLI
```bash
copilot plugin install SufficientDaikon/copilot-packager
```

### Via VS Code settings

Clone the repo and add to your `settings.json`:
```json
"chat.plugins.paths": {
    "/path/to/copilot-packager": true
}
```

### Via local path
```bash
git clone https://github.com/SufficientDaikon/copilot-packager.git
copilot plugin install ./copilot-packager
```

## Usage

Switch to the **packager** agent in VS Code chat, then:
```
Package this agent as a shareable GitHub repo
```
**Expected output**: A complete GitHub repo with README, docs site, install scripts, and proper metadata.

## Pipeline position

```
any agent -> **packager** -> GitHub
```

## Full collection

This agent works best as part of the full SDD + UI/UX pipeline. Install all 13 agents:

```bash
copilot plugin install SufficientDaikon/sdd-vscode-agents
```

See the [full collection](https://github.com/SufficientDaikon/sdd-vscode-agents) for documentation and the complete agent list.

## License

MIT
