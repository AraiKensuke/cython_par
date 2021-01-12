import do_omp
import time as _tm
import numpy as _N

rep= 10
N  = 5000000
TR = 8
a  = _N.random.randn(TR, N)
b  = _N.empty((TR, N))

t1 = _tm.time()
do_omp.doit(a, b, rep, TR, N)
t2 = _tm.time()

print(t2-t1)

