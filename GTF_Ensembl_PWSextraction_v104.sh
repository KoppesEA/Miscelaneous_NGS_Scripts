#BASH script to select chromosome 7 PWS region from mouse annotation GRCm39.104
#!bin/bash
cat Mus_musculus.GRCm39.104.gtf  | awk '{ if ($1==7) print $_; }' | \
awk '{ if ($3== "gene") print $_; }' | \
awk '{ if ($4 >= 55500000) print $_; }' | \
awk '{ if ($4 <= 63500000) print $_; }' | \
cut -f9 | \
cut -d ";" -f1,3 | \
cut -d \" -f2,4 | \
sed 's/\"/\t/g' > Mmus_PWS_Ensembl.tsv

