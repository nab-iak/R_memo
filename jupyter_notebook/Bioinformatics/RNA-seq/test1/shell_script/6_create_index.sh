#!/bin/bash

# BAM文件需要索引，用samtools就可以创建

for i in {50..69}
    do
    samtools index /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam
    done