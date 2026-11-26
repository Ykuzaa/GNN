#!/bin/bash
# Crée l'environnement du TP GNN (PyTorch 2.4 + DGL 2.4, CUDA 12.4)
set -e

# venv Python 3.11 (même version que le notebook du prof)
uv venv venv --python 3.11
source venv/bin/activate

# PyTorch GPU (CUDA 12.4)
uv pip install torch==2.4.0 --index-url https://download.pytorch.org/whl/cu124

# DGL GPU, compilé pour torch 2.4 + CUDA 12.4
uv pip install dgl==2.4.0 --find-links https://data.dgl.ai/wheels/torch-2.4/cu124/repo.html

# le reste
uv pip install -r requirements.txt

# kernel Jupyter
python -m ipykernel install --user --name gnn_dgl --display-name "GNN DGL (GPU)"

# vérification rapide (pas d'entraînement)
python -c "import torch, dgl; print('torch', torch.__version__, '| dgl', dgl.__version__, '| GPU :', torch.cuda.is_available())"
