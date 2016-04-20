echo -e "#SampleID\tfilenames\tBarcodeSequence\tLinkerPrimerSequence\tDescription" > myMAP.txt
for f in ./fasta/*.fasta; do
	ARGFIRST=${f//.trimmed.fasta/}
	ARGFIRST=${ARGFIRST//'./fasta/'/}
	ARGFIRST=${ARGFIRST//[^a-Z0-9]/.}
	echo -e "$ARGFIRST\t$f" >> myMAP.txt
done
echo "the following line will fail if QIIME is not loaded..."
add_qiime_labels.py -m myMAP.txt -i fasta -c filenames
