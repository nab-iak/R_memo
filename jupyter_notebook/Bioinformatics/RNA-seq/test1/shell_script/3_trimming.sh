#!/bin/bash

# 因为原始文件的末端存在adapter，所以要trim掉
# --fastqc 在trimmed以后对trimmed的文件用fastqc做质量控制

for i in {56..69}
    do
    trim_galore --paired --fastqc /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_1.fastq /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_2.fastq -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/
    done