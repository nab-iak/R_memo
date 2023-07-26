#!/bin/bash

# SRA是一种二进制的文件，人类读不了的玩意，所以需要转化为可以阅读的fastq文件
# fastq文件由四行数据组成，每四行为一组，包含序列标识符、碱基序列、以及对应的质量分数
# 虽然fastq能阅读，但也仅仅只是能阅读罢了，事实上根本没人去读

# 比较古典的是用fastq-dump，这几年出了个fastq-dump的升级版fasterq-dump，处理速度飙升所以就用这个了

for i in {50..69}
    do
    fasterq-dump  --split-3 -p /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/SRA/SRR136156${i}.sra -O /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ
    done

