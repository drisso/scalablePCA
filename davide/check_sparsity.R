library(zellkonverter)
library(SingleCellExperiment)
library(BiocSingular)
library(BiocParallel)

adata <- readH5AD("1M_neurons_1000_genes.h5ad", use_hdf5 = TRUE)
adata

tenx <- TENxMatrix("1M_neurons_filtered_gene_bc_matrices_h5.h5", group="mm10")
tenx

