#!/bin/bash
# sync-otto-memory.sh
# Called before checkpoint-backup to pull Otto's real memory into the checkpoint workspace

OTTO_WORKSPACE=~/someboty-docs/workspace-otto
CHECKPOINT_MEMORY=~/.openclaw/workspace/memory/otto

mkdir -p "$CHECKPOINT_MEMORY"

# Copy MEMORY.md
cp "$OTTO_WORKSPACE/MEMORY.md" "$CHECKPOINT_MEMORY/MEMORY.md" 2>/dev/null && echo "✓ MEMORY.md synced"

# Copy daily memory files
cp "$OTTO_WORKSPACE/memory/"*.md "$CHECKPOINT_MEMORY/" 2>/dev/null && echo "✓ Daily memory files synced"

# Copy bootstrap identity files
cp "$OTTO_WORKSPACE/SOUL.md" "$CHECKPOINT_MEMORY/" 2>/dev/null
cp "$OTTO_WORKSPACE/AGENTS.md" "$CHECKPOINT_MEMORY/" 2>/dev/null
cp "$OTTO_WORKSPACE/DIRECTIVES.md" "$CHECKPOINT_MEMORY/" 2>/dev/null

echo "✓ Otto memory sync complete"
