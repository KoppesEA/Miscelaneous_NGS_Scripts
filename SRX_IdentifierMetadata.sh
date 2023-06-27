# SRX identifer GREP one-liner by Koppes EA

# Example metadata from PRJNA855125 (https://www.ncbi.nlm.nih.gov/bioproject/PRJNA855125) via the SRA run selector
# Extraction of SRX Identifiers from SRA metadata tables into SRX_list.csv for use with nf-core fetching 1.8
# note may have to manually inspect SraRunTable and set digits (rather than 8) to match SRX records for specific projects
grep -o -E "SRX\d{8}" PRJNA855125_SraRunTable.txt > PRJNA855125_SRX_list.csv
