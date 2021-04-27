library(TENxBrainData)
library(SingleCellExperiment)
library(BiocSingular)
library(BiocParallel)
library(scuttle)

tenx <- TENxMatrix("1M_neurons_filtered_gene_bc_matrices_h5.h5")
class(tenx)

sce <- SingleCellExperiment(assays = list(counts=tenx))

# this destroys sparsity... doing something simpler for now
# system.time(sce <- computeLibraryFactors(sce, BPPARAM = BiocParallel::MulticoreParam(6)))
# system.time(sce <- logNormCounts(sce, BPPARAM = BiocParallel::MulticoreParam(6)))
assay(sce, "logcounts") <- log1p(counts(sce))

## rowVars does not work with so many cells, using a random subset for now
set.seed(134)
idx <- sample(seq_len(ncol(sce)), 1e4)
idx <- sort(idx)
system.time(vars <- rowVars(logcounts(sce[,idx])))
names(vars) <- rownames(sce)
vars <- sort(vars, decreasing = TRUE)

top <- sce[names(vars)[1:1000],]
is_sparse(logcounts(top))

ltop <- realize(logcounts(top), BACKEND = "TENxMatrix")

system.time(random_pca <- BiocSingular::runPCA(ltop, rank = 50,
                                               center = FALSE, scale = FALSE,
                                               BSPARAM = BiocSingular::RandomParam(deferred = TRUE),
                                               BPPARAM = BiocParallel::MulticoreParam(6)))

system.time(exact_pca <- BiocSingular::runPCA(logcounts(top), rank = 50,
                                              center = TRUE, scale = FALSE,
                                              BSPARAM = BiocSingular::ExactParam(deferred = TRUE),
                                              BPPARAM = BiocParallel::MulticoreParam(6)))

system.time(irlba_pca <- BiocSingular::runPCA(logcounts(top), rank = 50,
                                              center = TRUE, scale = FALSE,
                                              BSPARAM = BiocSingular::IrlbaParam(deferred = TRUE),
                                              BPPARAM = BiocParallel::MulticoreParam(6)))

system.time(random_pca <- BiocSingular::runPCA(logcounts(top), rank = 50,
                                               center = TRUE, scale = FALSE,
                                               BSPARAM = BiocSingular::RandomParam(deferred = TRUE,
                                                                                   fold = 1),
                                               BPPARAM = BiocParallel::MulticoreParam(6)))

system.time(exact_pca <- BiocSingular::runPCA(logcounts(top), rank = 50,
                                              center = TRUE, scale = FALSE,
                                              BSPARAM = BiocSingular::ExactParam(deferred = TRUE,
                                                                                 fold = 1),
                                              BPPARAM = BiocParallel::MulticoreParam(6)))

system.time(irlba_pca <- BiocSingular::runPCA(logcounts(top), rank = 50,
                                              center = TRUE, scale = FALSE,
                                              BSPARAM = BiocSingular::IrlbaParam(deferred = TRUE,
                                                                                 fold = 1),
                                              BPPARAM = BiocParallel::MulticoreParam(6)))
library(BiocSklearn)
system.time(sk_pca <- skIncrPCA_h5("1M_neurons_1000_genes.h5ad", n_components=50,
                                   dsname = "X", chunk.size = 5000))
