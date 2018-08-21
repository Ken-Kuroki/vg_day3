
## What's this?
This repository includes scripts to obtain files to have fun with the vg tutorial (https://github.com/Pfern/PANGenomics) day 3. Once you have all the files necessary, you can play around bacterial pan-genome.

## Requirements
- SRA Toolkit (https://www.ncbi.nlm.nih.gov/sra/docs/toolkitsoft/)
- curl command (if you use `wget` instead, modify `script/fetch_data.sh`)
- Jupyter Notebook
- Internet connection since the script downloads several files

## How to start
1. Go to `scripts/` and run `./fetch_data.sh` to obtain E. coli complete genomes, gene tables, and one fastq file as well as minia.
1. Then run `run_minia.sh` to generate a contig fasta file from the fastq reads.
1. Use `extract_gene.ipynb` with Jupyter Notebook as necessary. It helps you extract genome regions corresponding to a certain gene from multiple genomes.
1. Now you're free to do whatever you want. Check the original tutorial and have fun.

