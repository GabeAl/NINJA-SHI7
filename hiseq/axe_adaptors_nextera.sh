rm runTM.cmd
for f in *R1_001.fastq; do echo "java -jar ~/trimmomatic-0.36.jar PE $f ${f//R1/R2} ${f//R1_001/fwdp} /dev/null ${f//R1_001/revp} /dev/null ILLUMINACLIP:$HOME/adapters/NexteraPE-PE.fa:2:30:10:2:true -threads 24" >> runTM.cmd; done
#  $f ${f//R1/R2} ${f//_L001_R1_001.fastq/} 
chmod +x runTM.cmd
./runTM.cmd
