#BASH script to Ensembl_ID and gene_names from Mmus GRCm39 v104
#!bin/bash
cat Mus_musculus.GRCm39.104.gtf  |
awk '{ if ($3== "gene") print $_; }' | \
cut -f9 | \
cut -d ";" -f1,3 | \
cut -d \" -f2,4 | \
sed 's/\"/\t/g' > Mmus_GeneID_Ensembl.tsv
