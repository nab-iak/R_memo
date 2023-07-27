#!/bin/bash

# 为了把数据转化为可以给R得DESeq2或edgeR使用，需要转化为csv格式
echo -n "" > /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
for i in {50..69}
    do
    echo "SRR136156${i} /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR136156${i}.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
    done
    
cd /Volumes/WANs_SSD/WAN/RNA-seq/test1/data
python3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/prepDE.py3 -i /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt

# prepDE.py3 https://github.com/gpertea/stringtie/blob/master/prepDE.py3