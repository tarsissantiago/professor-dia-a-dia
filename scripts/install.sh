#!/usr/bin/env bash
# Instala a skill professor-dia-a-dia e o comando /curso numa ferramenta de IA.
#
# Uso:
#   ./scripts/install.sh <ferramenta> [pasta-do-projeto]
#
# ferramenta: antigravity | claude | codex | cursor | gemini | todas
# pasta-do-projeto: onde o aluno vai programar (padrão: pasta atual)
#
# Exemplo:
#   ./scripts/install.sh antigravity ~/projetos/labstore

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_SRC="$REPO_DIR/skills/professor-dia-a-dia"
TOOL="${1:-}"
PROJECT_DIR="${2:-$PWD}"

if [[ -z "$TOOL" ]]; then
  sed -n '2,12p' "$0"
  exit 1
fi

mkdir -p "$PROJECT_DIR"
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"

copy_skill() {
  local dest="$1/professor-dia-a-dia"
  mkdir -p "$1"
  rm -rf "$dest"
  cp -R "$SKILL_SRC" "$dest"
  echo "  skill   -> $dest"
}

copy_command() {
  mkdir -p "$(dirname "$2")"
  cp "$1" "$2"
  echo "  comando -> $2"
}

install_antigravity() {
  echo "Antigravity:"
  copy_skill "$PROJECT_DIR/.agent/skills"
  copy_command "$REPO_DIR/integrations/antigravity/workflows/curso.md" "$PROJECT_DIR/.agent/workflows/curso.md"
}

install_claude() {
  echo "Claude Code:"
  copy_skill "$PROJECT_DIR/.claude/skills"
  copy_command "$REPO_DIR/commands/curso.md" "$PROJECT_DIR/.claude/commands/curso.md"
}

install_codex() {
  echo "Codex:"
  copy_skill "$PROJECT_DIR/.agents/skills"
  copy_command "$REPO_DIR/integrations/codex/prompts/curso.md" "$HOME/.codex/prompts/curso.md"
}

install_cursor() {
  echo "Cursor:"
  copy_skill "$PROJECT_DIR/.cursor/skills"
  copy_command "$REPO_DIR/integrations/cursor/commands/curso.md" "$PROJECT_DIR/.cursor/commands/curso.md"
}

install_gemini() {
  echo "Gemini CLI:"
  copy_skill "$PROJECT_DIR/.gemini/skills"
  copy_command "$REPO_DIR/integrations/gemini/commands/curso.toml" "$PROJECT_DIR/.gemini/commands/curso.toml"
}

case "$TOOL" in
  antigravity) install_antigravity ;;
  claude)      install_claude ;;
  codex)       install_codex ;;
  cursor)      install_cursor ;;
  gemini)      install_gemini ;;
  todas|all)   install_antigravity; install_claude; install_codex; install_cursor; install_gemini ;;
  *) echo "Ferramenta desconhecida: $TOOL (use antigravity, claude, codex, cursor, gemini ou todas)"; exit 1 ;;
esac

echo
echo "Pronto! Abra o projeto em $PROJECT_DIR na ferramenta e digite /curso."
