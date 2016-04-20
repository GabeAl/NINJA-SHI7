#New NINJA-SHI7 workflow
-----------------------------

NINJA-SHI7 (pronounced "Ninja Shizen" for "NINJA Is Not Just Another - Short Read Iterative Trimmer") is a multi-fastq-to-multi-fasta QC processing pipeline. It expects modern Illumina fastq's produced on a MiSeq or HiSeq with stitchable reads (the paired ends should overlap more than 10 bases). It supports trimming off the platform's adaptor sequences (NEXTERA and TruSeqv3 adapters). This is the consolidated NINJA-SHI7 pipeline for general purpose short-read processing. For V4 specific processing, adapt the parameters in the scripts accordingly.

Instructions: 

1. Compile [ninja_shi7.c](https://github.com/GabeAl/NINJA-SHI7/blob/master/ninja_shi7.c). Doing so is easy: gcc -m64 -O3 -std=gnu99 -fwhole-program ninja_shi7.c -o ninja_shi7
2. Download or compile the [FLASh software](http://ccb.jhu.edu/software/FLASH/), which performs paired-end stitching. 
3. (For adapter removal) Download [Trimmomatic-0.36](http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip) and place the jar file as well as the "adapters" folder in your HOME directory (or modify its location in create_trimmer.sh). 
4. Place ninja_shi7 and FLASh in your PATH (or directory with the fastqs) with exectuable permissions (chmod +x on *NIX).
5. Use the software by running the scripts in alphabetical order, chosing only one of each similarly named script depending on what options you wish to use. For instance: axe_adaptors_nextera_noL.sh, create_flasher_general.sh, create_trimmer_general_L100.sh, make_fasta.sh. 
6. Optionally, if QIIME is installed and set up, you can run the final script, make_map.sh, to create a QIIME-compatible mapping file with the filenames as sample names (without the .fastq) and a combined_seqs.fna in QIIME format. 

FAQ:

1. `How do I know if there are adaptors? Even if there are, how can I know which ones were used by the sequencer?` Trial and error. Place a single fastq file into a testing directory and run a trimming script. Check if the reads got any shorter. If so, there were adaptors. Whichever technique (TS3 or Nextera) produces shorter reads is likely the correct result. 
2. `What if I want to change the settings?` Simply open up the script and change the settings. Commandline interface will come soon-ish. Until then, if you want to change FLASh settings, modify "create_flasher_general.sh". For trimming settings, modify "create_trimmer_general.sh" (also run ninja_shi7 without any commandline options to see what can be changed). 
3. `My file names are all janky.` Good question. Garbage in, garbage out -- I suggest a minimal naming scheme starting from your initial fastq files. Name each pair SAMPLENAME_R1.fastq, SAMPLENAME_R2.fastq for the most palatable results, and only use alphanumeric characters in the filenames, no dashes or spaces or colons or what have you. ;)
4. `What if I have one giant fastq (well, one pair -- an R1 and R2) I want to split into samples?` Excellent you should ask. Use [G0774_5PL17](https://github.com/GabeAl/NINJA-SHI7/blob/master/others/gotta_split.c) ("gotta_split") with an oligos.txt file to create multiple fastq's, one for each sample name (see: http://www.mothur.org/wiki/Oligos_File#Paired_Barcodes). Only PAIRED BARCODE is supported, without "None." 
