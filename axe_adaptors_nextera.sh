rm runTM.cmd
for f in *R1_001.fastq; do echo "java -jar /project/flatiron/gabe/pmp/trimmomatic-0.35.jar PE $f ${f//R1/R2} ${f//R1_001/fwdp} ${f//R1_001/fwdnp} ${f//R1_001/revp} ${f//R1_001/revnp} ILLUMINACLIP:/project/flatiron/gabe/pmp/adapters/NexteraPE-PE.fa:2:30:10:2:true -threads 48" >> runTM.cmd; done
#  $f ${f//R1/R2} ${f//_L001_R1_001.fastq/} 
chmod +x runTM.cmd
./runTM.cmd
