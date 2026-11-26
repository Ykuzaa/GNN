# TP Introduction aux Graph Neural Networks (DGL)

Classification de noeuds sur Cora (et PubMed en bonus) avec GCN, GraphSAGE et GAT.

- `TP_GNN.ipynb` : sujet du TP
- `TP_GNN_complete.ipynb` : TP complété (réponses aux questions + code)

## Installation (GPU)

Il faut [uv](https://docs.astral.sh/uv/) et un driver NVIDIA récent.

```bash
bash setup_env.sh
```

Le script crée `venv/` (Python 3.11, PyTorch 2.4 CUDA 12.4, DGL 2.4 CUDA 12.4) et le kernel Jupyter **GNN DGL (GPU)**.

Sans GPU : remplacer `cu124` par `cpu` dans les deux URL de `setup_env.sh`. Le notebook utilise le GPU automatiquement s'il est disponible.

## Lancer

```bash
source venv/bin/activate
jupyter notebook TP_GNN_complete.ipynb
```

Les datasets (Cora, PubMed) sont téléchargés automatiquement par DGL au premier lancement (dans `~/.dgl/`).
