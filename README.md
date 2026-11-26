# TP Introduction aux Graph Neural Networks (DGL)

Classification de noeuds sur Cora (et PubMed en bonus) avec GCN, GraphSAGE et GAT.

- `TP_GNN.ipynb` : sujet du TP
- `TP_GNN_complete.ipynb` : TP complété (réponses aux questions + code)

## Installation (CPU)

Il faut [uv](https://docs.astral.sh/uv/) (`pip install uv`).

```bash
bash setup_env.sh
```

Le script crée `venv/` (Python 3.10, PyTorch 2.1.1 CPU, DGL 1.1.3) et le kernel Jupyter **GNN DGL**.

Remarque : le site `data.dgl.ai` ne répond plus. Le script fait donc télécharger Cora depuis le bucket officiel de DGL (variable `DGL_REPO`) et PubMed depuis les fichiers d'origine Planetoid.

## Lancer

```bash
source venv/bin/activate
jupyter lab
```

Puis ouvrir `TP_GNN_complete.ipynb` avec le kernel **GNN DGL**.
