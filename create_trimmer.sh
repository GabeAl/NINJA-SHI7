rm aShi7Trim.cmd
rm ninja_shi7_report.log
for f in *.extendedFrags.fastq; do echo "ninja_shi7 $f ${f//.extendedFrags.fastq/.trimmed.fastq} 50 25 30 FLOOR 5 ASS_QUALITY 30 >> ninja_shi7_report.log" >> aShi7Trim.cmd; done
chmod +x aShi7Trim.cmd
./aShi7Trim.cmd