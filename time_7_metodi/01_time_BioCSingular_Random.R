# time per BiocSingular 

# METODO 01: RandomeParam

library(SingleCellExperiment)
library(reticulate)
#BiocManager::install("zellkonverter")
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
library(rhdf5)

nworkers <- 6

here()
#100k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_100k"), prefix="")
sce
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["X"]]
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time100k_01<- time.end - time.start

#500k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_500k"), prefix="")

#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]

invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time500k_01 <- time.end - time.start

#1000k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_1000k"), prefix="")
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time1000k_01 <- time.end - time.start

#1.3M

time.start <- proc.time()


sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_1.3M"), prefix="")

#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["X"]]
#assayNames(sce) <- "logcounts"
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time1.3M_01 <- time.end - time.start

save.image ("~/time_01.RData")