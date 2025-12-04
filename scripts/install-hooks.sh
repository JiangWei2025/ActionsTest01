#!/bin/sh

HOOKS_DIR=".git/hooks"

echo "Git Hooks をインストールしています..."

mkdir -p "$HOOKS_DIR"

# pre-commit
cat > "$HOOKS_DIR/pre-commit" <<'EOF'
#!/bin/sh
branch="$(git rev-parse --abbrev-ref HEAD)"
if [ "$branch" = "main" ]; then
  echo "エラー：main ブランチでは commit できません！"
  exit 1
fi
EOF

# pre-push
cat > "$HOOKS_DIR/pre-push" <<'EOF'
#!/bin/sh
branch="$(git rev-parse --abbrev-ref HEAD)"
if [ "$branch" = "main" ]; then
  echo "エラー：main ブランチへの push は禁止されています！"
  exit 1
fi
EOF

chmod +x "$HOOKS_DIR/pre-commit"
chmod +x "$HOOKS_DIR/pre-push"

echo "Git Hooks のインストールが完了しました！"
