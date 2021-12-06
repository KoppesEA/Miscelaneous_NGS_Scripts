##use bash md5sum_script.sh to run
for seqfile in *.fastq
    do
        echo $seqfile >> md5sum_summary
        md5sum $seqfile >> md5sum_summary
	done