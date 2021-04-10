import numpy as np
import pandas as pd
import scanpy as sc


sc.settings.verbosity  = 3
sc.settings.set_figure_params(dpi = 70)
sc.logging.print_versions()


file = "assays.h5"
str = "assay001"
adata=sc.read_hdf(file, str)

sc.tl.pca(adata)
