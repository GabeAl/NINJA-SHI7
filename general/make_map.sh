echo -e "#SampleID\tfilenames\tBarcodeSequence\tLinkerPrimerSequence\tDescription" > myMAP.txt
for f in ./fasta/*.fasta; do
	ARGFIRST=${f//.trimmed.fasta/}
	ARGFIRST=${ARGFIRST//'./fasta/'/}
	ARGFIRST=${ARGFIRST//[^a-Z0-9]/x}
	echo -e "$ARGFIRST\t$f" >> myMAP.txt
done

#add_qiime_labels.py -m myMAP.txt -i fasta -c filenames