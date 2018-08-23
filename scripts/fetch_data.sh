#!/bin/sh

## fetch genomes and feature tables

if [ ! -e ../ncbi-whole-genomes ]; then
    mkdir ../ncbi-whole-genomes
fi

if [ ! -e ../ncbi-genes ]; then
    mkdir ../ncbi-genes
fi

if [ ! -e ../temp ]; then
    mkdir ../temp
fi

if [ ! -e ../temp/assembly_summary_genbank.txt ]; then
    curl ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/assembly_summary_genbank.txt > ../temp/assembly_summary_genbank.txt
fi

cat ../temp/assembly_summary_genbank.txt | grep "Escherichia coli" | grep reference | cut -f 20 | while read line;
do
    GENOMENAME=$(basename $line)_genomic.fna.gz
    TABLENAME=$(basename $line)_feature_table.txt.gz
    curl "$line"/$GENOMENAME > ../ncbi-whole-genomes/$GENOMENAME
    curl "$line"/$TABLENAME > ../ncbi-genes/$TABLENAME
done

gzip -d ../ncbi-whole-genomes/*
gzip -d ../ncbi-genes/*


## fetch fastq reads

if [ ! -e ../reads ]; then
    mkdir ../reads
fi

# fastq-dump SRR3050845 -O ../reads


## fetch minia

git clone --recursive https://github.com/GATB/minia.git
cd minia
sh INSTALL
cd ../

