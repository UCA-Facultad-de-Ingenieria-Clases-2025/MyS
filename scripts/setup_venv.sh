#!/usr/bin/env bash
set -euo pipefail

# Ruta del proyecto = carpeta del script/../
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

VENV_NAME="venvmys"
PY=python3

# 1) Crear/actualizar venv
if [ ! -d "$PROJECT_DIR/$VENV_NAME" ]; then
  $PY -m venv "$PROJECT_DIR/$VENV_NAME"
fi

# 2) Activar venv
source "$PROJECT_DIR/$VENV_NAME/bin/activate"

# 3) pip al día
python -m pip install --upgrade pip

# 4) Dependencias del proyecto
if [ -f requirements.txt ]; then
  python -m pip install -r requirements.txt
fi

# 5) Registrar kernel Jupyter con nombre estable
python -m pip install ipykernel
python -m ipykernel install --user --name "$VENV_NAME" --display-name "Python ($VENV_NAME)"

echo "✅ Listo. Activa con: source $PROJECT_DIR/$VENV_NAME/bin/activate"
echo "   Kernel disponible: Python ($VENV_NAME)"
