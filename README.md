# OpenClaw Workspace Backup

This repository is an automated backup of an OpenClaw agent workspace.

## ⚠️ Private Repository

This backup contains sensitive data including:
- Agent identity and personality (SOUL.md)
- Long-term memories (MEMORY.md)
- Personal notes and conversation history
- Configuration and tools

**Keep this repository PRIVATE.**

## Recovery

To restore this workspace on a new machine:

```bash
# Clone the backup
git clone git@github.com:someboty-git/openclaw-state.git ~/.openclaw/workspace

# Or use the checkpoint-restore command if you have the skill installed
checkpoint-restore
```

## Commands

| Command | Description |
|---------|-------------|
| `checkpoint-backup` | Create a backup now |
| `checkpoint-status` | Check backup health |
| `checkpoint-restore` | Restore from backup |
| `checkpoint-schedule` | Configure auto-backup frequency |
| `checkpoint-reset` | Reset for fresh setup |

## About OpenClaw

OpenClaw is an AI agent framework. This backup preserves the agent's state,
memories, and identity across sessions and machines.
