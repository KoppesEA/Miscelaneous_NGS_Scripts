##use bash md5sum_script.sh & to run in background; jobs to check status
rm md5sum_summary
touch md5sum_summary
for seqfile in *.fastq.gz
    do
        echo $seqfile >> md5sum_summary
        gunzip -c $seqfile | md5sum  >> md5sum_summary
	done