# mem per BiocSingular 

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

if(!file.exists(here("mem_7_metodi/output/Memory_output"))) {
  dir.create(here("mem_7_metodi/output/Memory_output"), recursive = TRUE)
}

#100k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_100k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSingular_Random", out_name)), append = FALSE, memory.profiling = TRUE)

sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_100k"), prefix="")
sce
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["X"]]
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
Rprof(NULL)

#500k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_500k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSingular_Random", out_name)), append = FALSE, memory.profiling = TRUE)

sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_500k"), prefix="")

#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]

invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
Rprof(NULL)

#1000k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_1000k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSingular_Random", out_name)), append = FALSE, memory.profiling = TRUE)

sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_1000k"), prefix="")
#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["counts"]]
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
Rprof(NULL)

#1.3M

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_1.3M", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSingular_Random", out_name)), append = FALSE, memory.profiling = TRUE)



sce <- loadHDF5SummarizedExperiment(dir = here("time_7_metodi/data/subset/TENxBrainDataSE", "TENxBrainData_1.3M"), prefix="")

#sce@assays@data@listData[["logcounts"]]<- sce@assays@data@listData[["X"]]
#assayNames(sce) <- "logcounts"
invisible(scePCA <- scater::runPCA(sce, ncomponents = 50,
                                   ntop = 1000,
                                   scale = TRUE,
                                   BSPARAM = BiocSingular::RandomParam(),
                                   BPPARAM = MulticoreParam(nworkers)))
Rprof(NULL)

save.image ("~/mem_01.RData")