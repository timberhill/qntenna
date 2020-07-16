#!/bin/sh

source="${1/-lp-r.txt/.txt}"
reduced="${source/.txt/-lp-r.txt}" 

if [ -f "$reduced" ]; then
    echo "Found reduced spectrum."
else
    echo "Reducing the spectrum..."
    python preprocess_spectrum.py -lp -r $source -sf $reduced
fi

echo "Running qntenna.py..."
python qntenna.py $reduced -w1 10 -w2 100 -wn 20 --ncores 16
