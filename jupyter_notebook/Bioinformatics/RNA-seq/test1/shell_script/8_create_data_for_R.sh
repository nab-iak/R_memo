#!/bin/bash

# 为了把数据转化为可以给R得DESeq2或edgeR使用，需要转化为csv格式
echo -n "" > list.txt
for i in {50..69}
    do
    echo "SRR136156${i}     SRR136156${i}.gtf" >> list.txt
    done
    
python3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/GTF/prepDE.py3 -i /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/GTF/list.txt