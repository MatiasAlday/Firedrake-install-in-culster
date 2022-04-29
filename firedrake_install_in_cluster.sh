#!/bib/bash
echo "...Installing Firedrake ..."
echo "...Loading required modules..."
# LOADING BASIC PYTHON MODULES
module load 2022r1
module load compute
module load openmpi/4.1.1-urzuzcv
module load python/3.8.12-p6aunbm
module load py-pip
#module load py-mpi4py/3.1.2-z2vjekp
#module load py-h5py/2.10.0-l2quslp
module load py-cython/0.29.24-nywe5ql
#module load py-wheel
module load cmake
# LOADING FORTRAN COMPILER MODULE(s)
#Verify that the following modules are loaded before the "gcc/11.2.0-midhpa4" module is loaded
#   --->    DefaultModules  2022r1  compute
module load gcc/10.2.0

# LOADING PETSc MODULE:
#Verify that the following modules are loaded before:
#  --->     DefaultModules  2022r1  compute  openmpi/4.1.1-urzuzcv
module load py-wheel/0.36.2-koighnb
#module load hdf5/1.10.7-s6b7s6y
#export HDF5_DIR='/mnt/shared/apps/2022r1/compute/linux-rhel8-skylake_avx512/gcc-8.5.0/hdf5-1.10.7-s6b7s6ylc3arutanl2wdr6norirb5can'
module load py-h5py/2.10.0-l2quslp


HDF5_DIR='/home/maldaygonzalez/software/install/petsc/3.16.4'
export HDF5_DIR
PETSC_DIR='/home/maldaygonzalez/software/install/petsc/3.16.4'
export PETSC_DIR
#module load petsc/3.16.1-tqnt6e4
# LOADING Blas & Lapck MODULE(s) (GNU): 
module load shared
module load blas/gcc/64/3.8.0
module load lapack/gcc/64/3.9.0
# LOADING Boost module
#Verify that the following modules are loaded before:
#  --->    Defaultmodules  2022r1  compute
module load boost/1.77.0-zdbdeq7
# LOADING Git MODULE
module load module-git
# LOADING autoconf,automake,libtool and CMake MODULE(s):
module load autoconf/2.69-lejmm2i
module load automake/1.16.3-ou3gmnd
module load libtool/2.4.6-hxchyjc
module load cmake/3.21.4-bsilzh3
# LOADING zlib, bison , flex 
module load zlib/1.2.11-sdfroea
module load  bison/3.8.2-5tg6jzo
module load flex/2.6.4-xg4pzfz

echo "---> Calling firedrake-install script with --no-package-manager option"
python firedrake-install --no-package-manager --honour-petsc-dir --honour-pythonpath
