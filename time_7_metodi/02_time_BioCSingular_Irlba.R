# time per BiocSingular 

# METODO 02: Irlba Param 

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
library(rhdf5)

nworkers <- 6


here()
#100k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_100k"), prefix="")
#sce@assays@data@listData[["counts"]]<- sce@assays@data@listData[["X"]]
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::IrlbaParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time100k_02<- time.end - time.start

#500k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_500k"), prefix="")
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]

invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::IrlbaParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time500k_02 <- time.end - time.start

#1000k
time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_1000k"), prefix="")
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::IrlbaParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time1000k_02 <- time.end - time.start

#1.3M

time.start <- proc.time()
sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_1.3M), prefix="")
#sce@assays@data@listData[["counts"]]<- sce@assays@data@listData[["X"]]
#assayNames(sce) <- "logcounts"
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::IrlbaParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
time.end <- proc.time()
time1.3M_02 <- time.end - time.start

save.image ("~/time_02.RData")