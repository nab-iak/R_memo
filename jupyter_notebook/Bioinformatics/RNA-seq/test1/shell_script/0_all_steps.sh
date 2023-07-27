#!/bin/bash

# sra to fastq
for i in {50..69}
    do
    fasterq-dump  --split-3 -p /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/SRA/SRR136156${i}.sra -O /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ
    done

# quality control
for i in {50..69}
    do
    fastqc -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQC -t 6 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_1.fastq 
    fastqc -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQC -t 6 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_2.fastq
    done

# trimming
for i in {50..69}
    do
    trim_galore --paired --fastqc /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_1.fastq /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/FastQ/SRR136156${i}_2.fastq -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/
    done

# mapping
for i in {50..69}
    do
    hisat2 -t -q -p 8 --dta -x /Volumes/WANs_SSD/DATABASE/his_ind/hg38/genome -1 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/SRR136156${i}_1_val_1.fq -2 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/trimmed/SRR136156${i}_2_val_2.fq -S /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/mapped/SRR136156${i}.sam
    done

# sam to bam
for i in {50..69}
    do
    samtools sort -@ 8 -O bam -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/mapped/SRR136156${i}.sam 
    done

# create index
for i in {50..69}
    do
    samtools index /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam
    done

# assembly and quantification
for i in {50..69}
    do
    stringtie /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/GTF/SRR136156${i}.gtf -G /Volumes/WANs_SSD/DATABASE/annotation/gencode.v44.chr_patch_hapl_scaff.annotation.gtf -A /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/TAB/SRR136156${i}.tab
    done

# create data for ballgown
for i in {50..69}
    do
    stringtie /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/SRR136156${i}.bam -e -B -G /Volumes/WANs_SSD/DATABASE/annotation/gencode.v44.chr_patch_hapl_scaff.annotation.gtf -o /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR136156${i}.gtf
    done

# create data for R
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