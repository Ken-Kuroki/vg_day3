
# coding: utf-8

# In[1]:

import glob
import os

import pandas as pd
from Bio import SeqIO


# In[2]:

genelists = glob.glob("../ncbi-genes/*")
geneseqs = glob.glob("../ncbi-whole-genomes/*")


# In[3]:

def getgeneseq(listfile, seqfile, gene):
    start, end = getgenepos(listfile, gene)
    seq = list(SeqIO.parse(seqfile, "fasta"))[0][start:end]
    return seq

def getgenepos(file, gene):
    df = pd.read_csv(file, sep="\t")
    df = df[(df["symbol"] == gene) & (df["class"] == "protein_coding")].head(1)
    if len(df) == 0:
        return 0,0
    return int(df["start"]), int(df["end"])


# In[4]:

def saveseq(lists, seqs, gene="gyrA"):
    with open("../genes/gene_{0}.fna".format(gene), "w") as f:
        for (listfile, seqfile) in zip(genelists, geneseqs):
            seq = str(getgeneseq(listfile, seqfile, gene).seq)
            if len(seq) != 0:
                f.write(">{0} {1}\n".format(gene, os.path.basename(listfile)))
                f.write(seq + "\n\n")
    


# In[5]:

gene = "gyrA"
if not os.path.exists("../genes/"):
    os.mkdir("../genes/")

saveseq(genelists, geneseqs, gene=gene)


# In[ ]:



