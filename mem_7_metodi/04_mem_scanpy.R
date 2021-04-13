# mem per Scanpy 

# METODO 04: Scanpy in R

# time per Scanpy 

# METODO 04 

renv::use_python()
#if (!requireNamespace("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install(version = "3.12")
#BiocManager:install("SingleCellExperiment")
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
sc <- import("scanpy")

here()

if(!file.exists(here("mem_7_metodi/output/Memory_output"))) {
  dir.create(here("mem_7_metodi/output/Memory_output"), recursive = TRUE)
}

#100k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_100k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("Scanpy_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_100k/")
py_run_file("sce2adataPCA.py")

Rprof(NULL)

#500k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_500k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("Scanpy_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_500k/")
py_run_file("sce2adataPCA.py")

Rprof(NULL)

#1000k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_1000k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("Scanpy_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_1000k/")
py_run_file("sce2adataPCA.py")

Rprof(NULL)

#1.3M

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_1.3M", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("Scanpy_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_1.3M/")
py_run_file("sce2adataPCA.py")

Rprof(NULL)

save.image ("~/mem_04.RData")