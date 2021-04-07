# time per BiocSingular 

library(SingleCellExperiment)
library(reticulate)
library(zellkonverter)
library(BiocSingular)
library(here)
library(HDF5Array)
library(mbkmeans)
library(ggplot2)
library(scater)
library(scran)
library(BiocParallel)
library(DelayedMatrixStats)
library(basilisk)

nworkers <- 6

#100k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("main/case_studies/data/subset/TENxBrainData", "TENxBrainData_100k", paste0("TENxBrainData_100k", "_preprocessed_best")), prefix="")
#sce@assays@data@listData[["counts"]]<- sce@assays@data@listData[["X"]]
sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time100k <- time.end - time.start

#500k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("main/case_studies/data/subset/TENxBrainData", "TENxBrainData_500k", paste0("TENxBrainData_500k", "_preprocessed_best")), prefix="")
sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]

invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time500k <- time.end - time.start

#1000k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("main/case_studies/data/subset/TENxBrainData", "TENxBrainData_1000k", paste0("TENxBrainData_1000k", "_preprocessed_best")), prefix="")
sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time1000k <- time.end - time.start