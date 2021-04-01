import numpy as _N
from cython.parallel import prange, parallel
from libc.math cimport sin, fabs

def calc_using_prange(int rep, int TR, int N):
    cdef int tr, i, r
    cdef double tot
    outs = _N.empty(rep*TR)
    cdef double[::1] v_outs = outs
    cdef double *p_outs = &v_outs[0]

    with nogil:
        for r from 0 <= r < rep:
            for tr in prange(TR):
                p_outs[r*TR+tr] = FFdv_new(N, tr, r)
    return outs

def calc_using_range(int rep, int TR, int N):
    cdef int tr, i, r
    cdef double tot
    outs = _N.empty(rep*TR)
    cdef double[::1] v_outs = outs
    cdef double *p_outs = &v_outs[0]

    with nogil:
        for r from 0 <= r < rep:
            for tr in range(TR):
                p_outs[r*TR+tr] = FFdv_new(N, tr, r)
    return outs


cdef double FFdv_new(int _Np1, int r, int tr) nogil:
    cdef double tot = 1
    cdef int n1, n2, n3

    for n1 from 1 <= n1 < _Np1:
        for n2 from 1 <= n2 < _Np1:
            tot  += fabs(sin((n1 + n2) / 1000) + tr + r + n3) * 0.001
    return tot

"""
def doit(int rep, int TR, int N):
    cdef int tr, i, r

    with nogil:
        for r from 0 <= r < rep:
            for tr in prange(TR):
                FFdv_new(N)

cdef void FFdv_new(int _Np1) nogil:
    cdef double tot = 1
    cdef int n1, n2, n3

    for n1 from 1 <= n1 < _Np1:
        for n2 from 1 <= n2 < _Np1:
            for n3 from 1 <= n3 < _Np1:
                tot  += (n1 + n2) / 100 + 200 + n3

"""
