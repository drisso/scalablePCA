import scanpy as sc
import anndata as ad
from sklearn.decomposition import PCA, IncrementalPCA
import time

sc.settings.verbosity  = 3

filename = "1M_neurons_1000_genes.h5ad"
adata = sc.read_h5ad(filename)

## scanpy PCA
sc.tl.pca(adata)

## scikitlearn incremental PCA
tic = time.perf_counter()
ipca = IncrementalPCA(n_components=50)
X_ipca = ipca.fit_transform(adata.X)
toc = time.perf_counter()
toc - tic

tic = time.perf_counter()
pca = PCA(n_components=50)
X_pca = pca.fit_transform(adata.X)
toc = time.perf_counter()
toc - tic
