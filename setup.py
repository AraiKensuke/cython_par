import numpy
import sys
import os
from distutils.core import setup, Extension
from distutils.sysconfig import get_python_inc
from distutils.extension import Extension
#from Cython.Build import cythonize      # cythonize compiles a pyx
from Cython.Distutils import build_ext   # Extension for a c-file, build_ext for cython file

#modules = ["do_omp", "do_omp_func", "do_omp_basic"]
modules = ["do_omp_basic"]
#modules = ["FFBS3"]

incdir = [get_python_inc(plat_specific=1), numpy.get_include(), "pyPG/include/RNG"]
libdir = ['/usr/local/lib']
os.environ["CC"]  = "/usr/local/bin/gcc-6"

extra_compile_args = []
USE_OPENMP = True
extra_compile_args.extend(["-fopenmp", "-DUSE_OPEN_MP"])

cmdclass = {'build_ext' : build_ext}
#  Output to be named _LogitWrapper.so

for module in modules:
    ext_modules = Extension(module,
                            ["%s.pyx" % module],
                            #libraries = ['gsl', 'gslcblas'],
                            include_dirs=incdir,   #  include_dirs for Mac
                            extra_compile_args=extra_compile_args,
                            library_dirs=libdir)

    setup(
        name=module,
        cmdclass = cmdclass,
        #ext_modules = 
        ext_modules=[ext_modules],
    )
