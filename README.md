# NINJA-SHI7
NINJA-SHI7 (pronounced "Shizen" for "nature") is a fastq-to-combined-fasta processing pipeline. It expects modern Illumina fastq's produced on a MiSeq or HiSeq in long read mode with stitchable reads (the paired ends should overlap). It also expects that the platform adaptors have been removed, as is usually the case with modern sequencing cores. 
NOTE: The output combined fasta will be in QIIME-compatible format if the last line of make_map is uncommented and run with QIIME loaded.

Instructions: 
0. If there are adaptors, remove them (trimmomatic; do NOT use its trimming feature, only ILLUMINACLIP)
1. Compile ninja_shi7.c. Doing so is easy: 
gcc -m64 -O3 -std=gnu99 -fwhole-program ninja_shi7.c -o ninja_shi7
2. Download or compile the FLASh software, which performs paired-end stitching. 
3. If desired, load QIIME modules to perform final combination of files after running the pipeline
4. Run each of the .sh scripts in order of filename. The last line of last file, make_map.sh, may be commented out if you do not have QIIME loaded.

Good luck! The combined seqs.fna should be able to run through NINJA-OPS or other downstream analysis software. 
