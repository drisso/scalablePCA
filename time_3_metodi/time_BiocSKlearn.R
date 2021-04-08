# BiocSklearn

#BiocManager::install("BiocSklearn")
library(BiocSklearn)
renv::use_python()

skd = reticulate::import("sklearn")$decomposition
n_components <- 3L


#100k
setwd("~/scanpytest/main/case_studies/data/subset/TENxBrainData/TENxBrainData_100k/TENxBrainData_100k_preprocessed_best")

time.start <- proc.time()
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 10L)
time.end <- proc.time()
time100k <- time.end - time.start

#500k
setwd("~/scanpytest/main/case_studies/data/subset/TENxBrainData/TENxBrainData_500k/TENxBrainData_500k_preprocessed_best")

time.start <- proc.time()
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 10L)
time.end <- proc.time()
time500k <- time.end - time.start

#1000k
setwd("~/scanpytest/main/case_studies/data/subset/TENxBrainData/TENxBrainData_1000k/TENxBrainData_1000k_preprocessed_best")

time.start <- proc.time()
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 10L)
time.end <- proc.time()
time1000k <- time.end - time.start