##Example of code used to infer strandedness from RNA-Seq data fastq files after alignment to reference genome
##Erik Koppes 2020

module load rseqc/2.6.6
module load bedops/2.4.35

[eak37@htc-n16 Hsap_GRCH38]$ pwd
/bgfs/rnicholls/REFGenomes/Hsap_GRCH38

awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' Homo_sapiens.GRCh38.100.gtf | gtf2bed - > Homo_sapiens.GRCh38.100.bed

infer_experiment.py -r /bgfs/rnicholls/REFGenomes/Hsap_GRCH38/Homo_sapiens.GRCh38.100.bed -i /bgfs/rnicholls/HepG2_PKU/30-355313227/00_fastq/STAR_BAM/MJ01Aligned.sortedByCoord.out.bam

##output from my results:
This is PairEnd Data
Fraction of reads failed to determine: 0.0806
Fraction of reads explained by "1++,1--,2+-,2-+": 0.4594
Fraction of reads explained by "1+-,1-+,2++,2--": 0.4600

## this is not strand-speicifc, revert the htseq script to -s no


