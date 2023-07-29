#!/bin/bash

# 为了把数据转化为可以给R得DESeq2或edgeR使用，需要转化为csv格式
echo -n "" > /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "normal_female_health_1 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615650.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "normal_female_health_2 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615651.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "normal_female_health_3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615652.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "normal_female_health_4 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615653.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "normal_female_health_5 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615654.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_health_1 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615655.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_health_2 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615656.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_health_3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615657.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_health_4 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615658.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_health_5 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615659.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_male_health_1 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615660.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_male_health_2 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615661.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_male_health_3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615662.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_male_health_4 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615663.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_male_health_5 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615664.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_T2D_1 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615665.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_T2D_2 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615666.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_T2D_3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615667.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_T2D_4 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615668.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
echo "obesity_female_T2D_5 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR13615669.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt

cd /Volumes/WANs_SSD/WAN/RNA-seq/test1/data
python3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/prepDE.py3 -i /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt

# prepDE.py3 https://github.com/gpertea/stringtie/blob/master/prepDE.py3
# 输出的csv出存在/data/stringtied中