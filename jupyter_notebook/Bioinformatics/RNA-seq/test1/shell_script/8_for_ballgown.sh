#!/bin/bash

# 将基因表达量标准化
for i in {50..69}
    do
    stringtie /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam -e -B -G /Volumes/WANs_SSD/DATABASE/annotation/gencode.v44.chr_patch_hapl_scaff.annotation.gtf -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR136156${i}.gtf
    done