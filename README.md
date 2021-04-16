# scalablePCA

This analisys wants to benchmark 7 differt PCA's methods. This repository contains code for reproducing the benchmark of the PCA's methods.\
The dataset is available on https://support.10xgenomics.com/single-cell-gene-expression/datasets/1.3.0/1M_neurons. 

In the "scanpy10x.py" script we normalize with total UMI count per cell, we filter genes with more than 1 count and select highly-variable genes, we log-tranform the data and then scale to unit variance and shift to zero mean.
Finally we save the preprocessed object using "adata.write()" 

Next, in the file "time_7_metodi/time_subset.R" we create downsample sizes of datasets (sizes 100k,500k, 1M) from the preprocessed object described above. 

We use seven different methods to compute PCA:
* BiocSingular_Random
* BiocSingular_Irlba
* BiocSingular_Exact
* Scanpy_in_R
* Scanpy_in_Python
* BiocSklearn_in_R
* BiocSklearn_in_Python


In the folder "time_7_metodi" you can find the script to reproduce e






