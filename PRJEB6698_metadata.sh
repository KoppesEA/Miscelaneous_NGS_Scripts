##Erik Koppes, June 2023
## Long one-liner to get metadata from .xml file 
## https://www.ebi.ac.uk/ena/browser/view/PRJEB6698

cat ena_PRJEB6698_read_experiment.xml | \
grep -o -E ">SAMEA\d{7}<|>ERR\d{6}<|refname\=\"[dN].*>" | \
tr -d '>|<' | tr '\n' ' ' | \
awk -v OFS="\t" ' {print $3, $2, $1, "\n", $6, $5, $4, "\n", $9, $8, $7, "\n", $12, $11, $10, "\n", $15, $14, $13, "\n", $18, $17, $16, "\n", $21, $20, $19, "\n", $24, $23, $22, "\n", $27, $26, $25, "\n", $30, $29, $28}' | \
sed 's/^\t//' | sed 's/refname=\"//' | sed 's/\"//' > PRJEB6698_metadata.tsv