#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')
ARTIFACT=$(find "$CWD" -name "README.md" -mmin -30 2>/dev/null | head -1)
if [ -n "$ARTIFACT" ]; then
  cat <<EOF
{"systemMessage":"Package saved: $ARTIFACT\n\nPackage is ready. Check the README and docs/ for the documentation website.\n\nFull pipeline: https://github.com/SufficientDaikon/sdd-vscode-agents"}
EOF
else
  echo '{"continue":true}'
fi
