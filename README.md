### Permisos: chmod +x scripts/setup_venv.sh
### Inicialización
./scripts/setup_venv.sh
### luego abrir Jupyter y elegir: Python (venvmys)

### Si agregás/actualizás paquetes:
source venvmys/bin/activate
python -m pip install <paquete>
python -m pip freeze > requirements.txt

