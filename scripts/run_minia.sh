#!/bin/sh

if [ ! -e ../contigs ]; then
    mkdir ../contigs
fi

cd ../contigs
../scripts/minia/build/bin/minia -in ../reads/SRR3050845.fastq

