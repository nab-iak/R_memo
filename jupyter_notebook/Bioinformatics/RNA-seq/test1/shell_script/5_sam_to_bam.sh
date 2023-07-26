#!/bin/bash

# mapping好的结果SAM文件，可以在StringTile中计算每个基因的表达量
# 但是SAM中各个基因的位置需要按照一定的顺序排列
# samtools可以把mapping的SAM文件排列，并且压缩为更小的BAM文件

for i in {50..69}
    do
    samtools sort -@ 8 -O bam -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/mapped/SRR136156${i}.sam 
    done
