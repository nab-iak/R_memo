#!/bin/bash

# 这个步骤主要是生成fastq的测序检验报告，格式为html，点开就能看

for i in {50..69}
    do
    fastqc -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQC -t 6 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_1.fastq 
    fastqc -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQC -t 6 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_2.fastq
    done