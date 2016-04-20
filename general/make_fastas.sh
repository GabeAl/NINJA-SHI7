mkdir fasta
for f in *.trimmed.fastq; do sed -n '1~4s/^@/>/p;2~4p' $f > ${f//fastq/fasta}; done
mv *.fasta ./fasta
