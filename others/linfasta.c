#include <stdio.h>
#include <string.h>

void main(char *argv[], int argc) {
	if (argc != 3) puts("Usage: infile.bad.fasta outfile.good.fasta");
	char *filename = argv[1], *outfile = argv[2];
	FILE *in = fopen(filename,"rb"), *out = fopen(outfile,"wb");
	#define LINELEN 1000000000
	char *nuts = malloc(LINELEN); // 1 gig
	nuts[LINELEN-1] = 0;
	
	while (line = gets(in,)
}