#!/bin/sh


## fetch fastq reads

if [ ! -e ../reads ]; then
    mkdir ../reads
fi

fastq-dump SRR3050845 -O ../reads
