#!/bin/bash
#
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 1-00:00 # Runtime in D-HH:MM
#SBATCH -J SAMtoBAM
#SBATCH --output=EK_SamtoBam_12202021.txt
#SBATCH --cpus-per-task=4 # Request that ncpus be allocated per process.

module load gcc/8.2.0
module load samtools/1.9

for datafile in *.sam
do
	echo datafile is $datafile >> EK_SamtoBam_12202021.txt
	filebase=`basename $datafile .sam`
	echo filebase is $filebase >> EK_SamtoBam_12202021.txt
	samtools sort \
	-@ 16 \
	-O BAM \
	-o ${filebase}.bam \
	$datafile
	samtools index $datafile.bam
done


