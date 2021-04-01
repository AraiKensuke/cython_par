import no_omp_basic
import time as _tm
import numpy as _N

rep= 10
N  = 2000
TR = 10

# a  = _N.random.randn(TR, N)
# b  = _N.empty((TR, N))

t1 = _tm.time()
outs = no_omp_basic.doit(rep, TR, N)
t2 = _tm.time()

print(t2-t1)

