# BiocSklearn

# METODO 06

#BiocManager::install("BiocSklearn")
library(BiocSklearn)
renv::use_python()

skd = reticulate::import("sklearn")$decomposition
n_components <- 50L


#100k
setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainData/TENxBrainData_100k/")

time.start <- proc.time()
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 10L)
time.end <- proc.time()
time100k_06 <- time.end - time.start

#500k
setwd("~~/scanpytest/time_7_metodi/data/subset/TENxBrainData/TENxBrainData_500k/")

time.start <- proc.time()
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 10L)
time.end <- proc.time()
time500k_06 <- time.end - time.start

#1000k
setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainData/TENxBrainData_1000k/")

time.start <- proc.time()
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 10L)
time.end <- proc.time()
time1000k_06 <- time.end - time.start

#1.3M

time.start <- proc.time()
setwd("~/scanpytest/")

time.start <- proc.time()
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 10L)
time.end <- proc.time()
time1.3M_06 <- time.end - time.start

save.image ("~/time_06.RData")