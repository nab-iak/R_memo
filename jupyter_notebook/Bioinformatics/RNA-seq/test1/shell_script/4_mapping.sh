#!/bin/bash

# 你永远不知道rna片段是在哪个地方，所以我们需要mapping一下，简单而言就是拼图一样的建立索引
# hisat2官网有现成的索引文件
# 如果测定的物种比较另类，那么需要自建索引

for i in {50..69}
    do
    hisat2 -t -q -p 8 --dta -x /Volumes/WANs_SSD/DATABASE/his_ind/hg38/genome -1 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/SRR136156${i}_1_val_1.fq -2 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/SRR136156${i}_2_val_2.fq -S /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/mapped/SRR136156${i}.sam
    done

# -p 线路数量力而行，觉得太卡了就调小点，否则电脑烧起来就寄了，尤其是大夏天的
# -x 参考基因组的genome不是文件夹，而是genome开头的全部文件

