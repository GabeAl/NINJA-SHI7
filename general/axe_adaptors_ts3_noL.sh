rm runTM.cmd
for f in *R1*.fastq; do echo "java -jar ~/trimmomatic-0.36.jar PE $f ${f//R1/R2} ${f//R1/fwdp} /dev/null ${f//R1/revp} /dev/null ILLUMINACLIP:$HOME/adapters/TruSeq3-PE-2.fa:2:30:10:2:true -threads 16" >> runTM.cmd; done
chmod +x runTM.cmd
./runTM.cmd
