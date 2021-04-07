# time per Scanpy 
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
setwd("~/scanpytest/main/case_studies/data/subset/TENxBrainData/TENxBrainData_100k/TENxBrainData_100k_preprocessed_best")
time.start <- proc.time()
py_run_file("sce2adataPCA.py")
time.end <- proc.time()
time100k <- time.end - time.start

#500k
setwd("~/scanpytest/main/case_studies/data/subset/TENxBrainData/TENxBrainData_500k/TENxBrainData_500k_preprocessed_best")

time.start <- proc.time()
py_run_file("sce2adataPCA.py")
time.end <- proc.time()
time500k <- time.end - time.start

#1000k
setwd("~/scanpytest/main/case_studies/data/subset/TENxBrainData/TENxBrainData_1000k/TENxBrainData_1000k_preprocessed_best")

time.start <- proc.time()
py_run_file("sce2adataPCA.py")
time.end <- proc.time()
time1000k <- time.end - time.start