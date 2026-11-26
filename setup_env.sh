#!/bin/bash
# Crée l'environnement du TP GNN sur CPU (PyTorch 2.1.1 + DGL 1.1.3, comme le script du prof)
set -e

# data.dgl.ai ne répond plus : on prend les datasets sur le bucket officiel de DGL
DGL_REPO=https://dgl-data.s3-us-west-2.amazonaws.com/

# venv Python 3.10
uv venv venv --python 3.10
source venv/bin/activate

# PyTorch CPU puis DGL et le reste
uv pip install "torch==2.1.1+cpu" --index-url https://download.pytorch.org/whl/cpu
uv pip install -r requirements.txt

# PubMed n'est plus sur le bucket : on récupère les fichiers d'origine (Planetoid)
# et on les met là où DGL les cherche (dossier nommé avec un hash de l'URL)
h=$(printf '%s' "${DGL_REPO}dataset/pubmed.zip" | sha1sum | cut -c1-8)
mkdir -p ~/.dgl/pubmed_$h
for s in x y tx ty allx ally graph test.index; do
    curl -sSfL -o ~/.dgl/pubmed_$h/ind.pubmed.$s \
        https://raw.githubusercontent.com/kimiyoung/planetoid/master/data/ind.pubmed.$s
done

# kernel Jupyter avec les bonnes variables
python -m ipykernel install --user --name gnn_dgl --display-name "GNN DGL" \
    --env DGLBACKEND pytorch --env DGL_REPO $DGL_REPO

python -c "import torch, dgl; print('torch', torch.__version__, '| dgl', dgl.__version__)"
