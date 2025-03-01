# export MINICONDA=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
# miniforge solves fast and works well with conda-forge
export MINICONDA=https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh
export CONDAVERSION=0.0
export CONDAPRGENV=gnu

export CC="gcc"
export FC="gfortran"
export CFLAGS="-O3 -fPIC -pthread"
export FCFLAGS="-O3 -fPIC -pthread -fexceptions"
export NTMAKE=8

# needed for mpi4py
module load cray-mpich

export MPICC="cc -shared"

for PRGENV in $(echo gnu intel cray)
do
  mod=`module -t list 2>&1 | grep PrgEnv-$PRGENV`
  if [ "x$mod" != x ] ; then
    if [ $PRGENV != $CONDAPRGENV ] ; then
      echo "swapping PrgEnv-$PRGENV for PrgEnv-$CONDAPRGENV"
      module swap PrgEnv-$PRGENV PrgEnv-$CONDAPRGENV
    fi
  fi
done
