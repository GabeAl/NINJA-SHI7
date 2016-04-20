rm runFlash.cmd
for f in *_fwdp*.fastq; do echo "flash $f ${f//fwdp/revp} -o ${f//_fwdp.fastq/} -M 700 -O" >> runFlash.cmd; done
chmod +x runFlash.cmd
./runFlash.cmd
