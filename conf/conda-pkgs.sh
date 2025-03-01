# conda packages
echo Current time $(date) Installing conda packages
echo condadir is $CONDADIR

conda install python=3.9.20
conda config --set solver classic
conda install --yes -n base conda-libmamba-solver
conda config --set solver libmamba

conda config --set channel_priority flexible
conda install --yes -c conda-forge -c anaconda -c nvidia -c defaults \
    astropy \
    camb \
    healpy \
    ipython \
    joblib \
    jupyter \
    matplotlib \
    numpy=1.22.4 \
    scipy \
    setuptools=64 \

    
 && rm -rf $CONDADIR/pkgs/*

if [ $? != 0 ]; then
    echo "ERROR installing conda packages; exiting"
    exit 1
fi

conda list --export | grep -v conda > "$CONDADIR/pkg_list.txt"
# conda config --set solver classic

echo Current time $(date) Done installing conda packages
