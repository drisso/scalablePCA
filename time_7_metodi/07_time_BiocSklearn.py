import sklearn as sk
import h5py as h5
from sklearn.decomposition import IncrementalPCA
import time

dsname = "assay001"
fn = "assays.h5"
n_components = 50

start_time = time.time()

matref = h5.File(fn, mode = "r")

#chunk_size = 10
op = sk.decomposition.IncrementalPCA(n_components = n_components)


#, batch_size = chunk_size
op.fit_transform(matref[dsname])
print("--- %s seconds ---" % (time.time() - start_time))
