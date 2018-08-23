#!/bin/sh

## fetch minia

git clone --recursive https://github.com/GATB/minia.git
cd minia
sh INSTALL
cd ../


## run it

if [ ! -e ../contigs ]; then
    mkdir ../contigs
fi

cd ../contigs
../scripts/minia/build/bin/minia -in ../reads/SRR3050845.fastq

