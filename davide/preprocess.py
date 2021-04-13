import numpy as np
import pandas as pd
import scanpy as sc
import anndata as ad

sc.settings.verbosity  = 3
# sc.settings.set_figure_params(dpi = 70)
sc.logging.print_versions()

filename = "1M_neurons_filtered_gene_bc_matrices_h5.h5"
adata = sc.read_10x_h5(filename)

adata.var_names_make_unique()
anno = pd.read_csv("mouse_info.csv", dtype="str")
adata.obs['batch'] = anno['Mouse'].values

sc.pp.recipe_zheng17(adata)

adata.write("1M_neurons_1000_genes.h5ad")
