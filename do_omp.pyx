import numpy as _N
from cython.parallel import prange, parallel
cimport openmp
from libc.stdio cimport printf

#cython: boundscheck=False, wraparound=False, nonecheck=False

def doit(double[:, ::1] vin, double[:, ::1] vout, int rep, int TR, int N):
    cdef double* p_vin   = &vin[0, 0]
    cdef double* p_vout  = &vout[0, 0]
    cdef int tr, i, r
    cdef int nthreads

    for r in range(rep):
        for tr in prange(TR, nogil=True):
            for i in range(N):
                p_vout[tr*N+i] = (2*p_vin[tr*N+i])/52.3


