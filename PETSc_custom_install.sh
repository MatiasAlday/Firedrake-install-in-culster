#! bin/bash

module load 2022r1
module load compute
module load cmake
module load openmpi
module load blas/gcc/64/3.8.0
module load lapack/gcc/64/3.9.0

CURR_DIR=$(pwd)
PACKAGE=petsc
VERSION=3.16.4
INSTALL_ROOT=$HOME/software/install
PETSC_INSTALL=$INSTALL_ROOT/$PACKAGE/$VERSION
TAR_FILE="$PACKAGE-$VERSION.tar.gz"
URL="https://ftp.mcs.anl.gov/pub/petsc/release-snapshots/"
ROOT_DIR=$HOME/software/src
SOURCES_DIR=$ROOT_DIR/$PACKAGE-$VERSION
BUILD_DIR=$SOURCES_DIR/build

echo "....getting $TAR_FILE from $URL"
curl -OL $URL/$TAR_FILE -O
mv $CURR_DIR/$TAR_FILE $ROOT_DIR
mkdir -p $SOURCES_DIR
tar xzf $ROOT_DIR/$TAR_FILE -C $ROOT_DIR
cd $SOURCES_DIR

./configure --prefix=$PETSC_INSTALL --download-chaco --download-cmake --download-eigen --download-hdf5 --download-hypre --download-ml --download-mpich --download-mumps --download-ptscotch --download-scalapack --download-superlu_dist --with-c2html=0 --with-cxx-dialect=C++11 --with-debugging=0 --with-fortran-bindings=0 --with-shared-libraries=0 --with-mpi=1 --with-blas-dir=/cm/shared/apps/blas/gcc/3.8.0/lib64 --with-lapack-dir=/cm/shared/apps/lapack/gcc/64/3.9.0

make
make install
