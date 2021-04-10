# time per Scanpy 

# METODO 04 

renv::use_python()
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

#100k
setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainData/TENxBrainData_100k/")
time.start <- proc.time()
py_run_file("sce2adataPCA.py")
time.end <- proc.time()
time100k_04 <- time.end - time.start

#500k
setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainData/TENxBrainData_500k/")

time.start <- proc.time()
py_run_file("sce2adataPCA.py")
time.end <- proc.time()
time500k_04 <- time.end - time.start

#1000k
setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainData/TENxBrainData_1000k/")

time.start <- proc.time()
py_run_file("sce2adataPCA.py")
time.end <- proc.time()
time1000k_04 <- time.end - time.start

#1.3M
setwd("~/scanpytest/")

time.start <- proc.time()
py_run_file("sce2adataPCA.py")
time.end <- proc.time()
time1000k_04 <- time.end - time.start

save.image ("~/time_01.RData")
