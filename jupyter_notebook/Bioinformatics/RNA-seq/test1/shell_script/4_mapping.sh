#!/bin/bash

# 你永远不知道rna片段是在哪个地方，所以我们需要mapping一下，简单而言就是拼图一样的建立索引

for i in {50..69}
    do
    hisat2 -q -p 16 --dta -x /Volumes/WANs_SSD/DATABASE/his_ind/hg38/genome -1 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/SRR136156${i}_1_val_1.fq -2 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/SRR136156${i}_2_val_2.fq -S /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/mapped/SRR136156${i}.sam
    done
