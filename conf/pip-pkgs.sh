# Install pip packages.
echo Installing pip packages at $(date)

# see https://docs.nersc.gov/development/languages/python/parallel-python/
pip install --force --no-cache-dir --no-binary=mpi4py mpi4py
pip install cython

git clone git@github.com:carronj/plancklens.git
git checkout plancklensdev
cd plancklens
pip install .

git clone git@github.com:NextGenCMB/delensalot.git
cd delensalot
python3 -m pip install -r requirements.txt .
python3 setup.py develop

if [ $? != 0 ]; then
    echo "ERROR installing pip packages; exiting"
    exit 1
fi

echo Current time $(date) Done installing conda packages
