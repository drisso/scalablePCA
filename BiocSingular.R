library(zellkonverter)
library(SingleCellExperiment)
library(BiocSingular)
library(BiocParallel)

adata <- readH5AD("1M_neurons_1000_genes.h5ad", use_hdf5 = TRUE)
class(assay(adata))

system.time(random_pca <- BiocSingular::runPCA(assay(adata), rank = 50,
                                              center = FALSE, scale = FALSE,
                                              BSPARAM = BiocSingular::RandomParam(),
                                              BPPARAM = BiocParallel::MulticoreParam(6)))

system.time(exact_pca <- BiocSingular::runPCA(assay(adata), rank = 50,
                                              center = FALSE, scale = FALSE,
                                              BSPARAM = BiocSingular::ExactParam(),
                                              BPPARAM = BiocParallel::MulticoreParam(6)))

system.time(irlba_pca <- BiocSingular::runPCA(assay(adata), rank = 50,
                                              center = FALSE, scale = FALSE,
                                              BSPARAM = BiocSingular::IrlbaParam(),
                                              BPPARAM = BiocParallel::MulticoreParam(6)))

library(BiocSklearn)
system.time(sk_pca <- skIncrPCA_h5("1M_neurons_1000_genes.h5ad", n_components=50,
                                   dsname = "X", chunk.size = 5000))
