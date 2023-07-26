#!/bin/bash

# stringtie计算各个基因的表达量

for i in {50..69}
    do
    stringtie /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/GTF/SRR136156${i}.gtf -G /Volumes/WANs_SSD/DATABASE/annotation/gencode.v44.chr_patch_hapl_scaff.annotation.gtf -A /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/TAB/SRR136156${i}.tab
    done