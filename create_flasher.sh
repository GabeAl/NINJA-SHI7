rm runFlash.cmd
for f in *R1_001.fastq; do echo "flash $f ${f//R1/R2} -o ${f//_L001_R1_001.fastq/} -O -M 320" >> runFlash.cmd; done
chmod +x runFlash.cmd
./runFlash.cmd
