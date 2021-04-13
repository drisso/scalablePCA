import numpy as np
import pandas as pd
import scanpy as sc
import time


sc.settings.verbosity  = 3
sc.settings.set_figure_params(dpi = 70)
sc.logging.print_versions()

start_time = time.time()

file = "assays.h5"
str = "assay001"
adata=sc.read_hdf(file, str)

sc.tl.pca(adata)
print("--- %s seconds ---" % (time.time() - start_time))