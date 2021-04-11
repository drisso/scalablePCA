# BiocSklearn

# METODO 06

#BiocManager::install("BiocSklearn")
library(BiocSklearn)
library(here)
renv::use_python()

skd = reticulate::import("sklearn")$decomposition
n_components <- 50L


here()

if(!file.exists(here("mem_7_metodi/output/Memory_output"))) {
  dir.create(here("mem_7_metodi/output/Memory_output"), recursive = TRUE)
}

#100k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_100k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSklearn_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_100k/")
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 50L)

Rprof(NULL)

#500k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_500k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSklearn_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_500k/")
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 50L)

Rprof(NULL)

#1000k

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_1000k", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSklearn_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_1000k/")
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 50L)

Rprof(NULL)

#1.3M

now <- format(Sys.time(), "%b%d%H%M%OS3")
out_name <- paste0("_TENxBrainData_1.3M", "_", "ila",".out")

Rprof(filename = here("mem_7_metodi/output/Memory_output",paste0("BiocSklearn_in_R", out_name)), append = FALSE, memory.profiling = TRUE)

setwd("~/scanpytest/time_7_metodi/data/subset/TENxBrainDataSE/TENxBrainData_1.3M/")
skIncrPCA_h5("assays.h5", dsname = "assay001", n_components, chunk.size = 50L)

Rprof(NULL)

save.image ("~/mem_06.RData")