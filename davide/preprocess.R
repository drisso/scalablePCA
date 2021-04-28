library(TENxBrainData)
library(SingleCellExperiment)
library(HDF5Array)
library(zellkonverter)
library(TileDBArray)

## Sparse HDF5 format
tenx <- TENxMatrix("1M_neurons_filtered_gene_bc_matrices_h5.h5")
class(tenx)

adata <- readH5AD("1M_neurons_data.h5ad", use_hdf5 = TRUE)

tenx <- tenx[rowData(adata)$gene_ids,]
tenx <- log1p(tenx)
is_sparse(tenx)
seed(tenx)
showtree(tenx)

tenx_sparse <- writeTENxMatrix(tenx, filepath = "1M_neurons_data_sparse.h5",
                               group = "mm10", verbose = TRUE)
is_sparse(tenx_sparse)

## Dense HDF5 format
sce <- TENxBrainData()
rownames(sce) <- rowData(sce)$Ensembl
sce <- sce[rowData(adata)$gene_ids,]

tenx <- counts(sce)
tenx <- log1p(tenx)
is_sparse(tenx)
seed(tenx)
showtree(tenx)

tenx_dense <- writeHDF5Array(tenx, filepath = "1M_neurons_data_dense.h5",
                             name = "mm10", verbose = TRUE)

## TileDB format
tenx_db <- writeTileDBArray(tenx_sparse, path = "1M_neurons_data_sparse.tdb")
