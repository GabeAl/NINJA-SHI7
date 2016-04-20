#New NINJA-SHI7 workflow
-----------------------------

NINJA-SHI7 (pronounced "Ninja Shizen" for "NINJA Is Not Just Another - Short Read Iterative Trimmer") is a multi-fastq-to-multi-fasta QC processing pipeline. It expects modern Illumina fastq's produced on a MiSeq or HiSeq with stitchable reads (the paired ends should overlap more than 10 bases). It supports trimming off the platform's adaptor sequences (NEXTERA and TruSeqv3 adapters). This is the consolidated NINJA-SHI7 pipeline for general purpose short-read processing. For V4 specific processing, adapt the parameters in the scripts accordingly.

Instructions: 
1. Compile ninja_shi7.c. Doing so is easy: gcc -m64 -O3 -std=gnu99 -fwhole-program ninja_shi7.c -o ninja_shi7
2. Download or compile the FLASh software, which performs paired-end stitching. 
3. (For adapter removal) Download Trimmomatic-0.36 and place the jar file as well as the "adapters" folder in your HOME directory (or modify its location in create_trimmer.sh). 
4. Place ninja_shi7 and FLASh in PATH with exectuable permissions (chmod +x on *NIX).
5. Use the software by running the scripts in alphabetical order, chosing only one of each similarly named script depending on what options you wish to use. For instance: axe_adaptors_nextera_noL.sh, create_flasher_general.sh, create_trimmer_general_L100.sh, make_fasta.sh. 
6. Optionally, if QIIME is installed and set up, you can run the final script, make_map.sh, to create a QIIME-compatible mapping file with the filenames as sample names (without the .fastq) and a combined_seqs.fna in QIIME format. 
