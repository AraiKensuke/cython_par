import do_omp_basic
import time as _tm
import numpy as _N

rep= 3
N  = 1400
TR = 2

# a  = _N.random.randn(TR, N)
# b  = _N.empty((TR, N))

for i in range(9):
    t1 = _tm.time()
    outs1 = do_omp_basic.calc_using_prange(rep, TR, N)
    t2 = _tm.time()
    outs2 = do_omp_basic.calc_using_range(rep, TR, N)
    t3 = _tm.time()

    print(t2-t1)
    print(t3-t2)
    print(".........")

