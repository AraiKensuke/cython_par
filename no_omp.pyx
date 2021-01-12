import numpy as _N

def doit(double[:, ::1] vin, double[:, ::1] vout, int rep, int TR, int N):
    cdef double* p_vin   = &vin[0, 0]
    cdef double* p_vout  = &vout[0, 0]
    cdef int tr, i, r

    for r in range(rep):
        with nogil:
            for tr in range(TR):
                for i in range(N):
                    p_vout[tr*N+i] = (2*p_vin[tr*N+i])/52.3

