import numpy as _N

#def doit(double[:, ::1] vin, double[:, ::1] vout, int rep, int TR, int N):
def doit(int rep, int TR, int N):
    # cdef double* p_vin   = &vin[0, 0]
    # cdef double* p_vout  = &vout[0, 0]
    cdef int tr, i, r

    with nogil:
        for r in range(rep):
            for tr in range(TR):
                FFdv_new(N)
                #for i in range(N):
                #    p_vout[tr*N+i] = (2*p_vin[tr*N+i])/52.3

cdef void FFdv_new(int _Np1) nogil:
    cdef long nKK, n1, n2

    for n1 from 1 <= n1 < _Np1:
        for n2 from 1 <= n2 < _Np1:
            nKK = n1*n2*n1*n2//100+341

