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
for i in {50..69}
    do
    echo "SRR136156${i} /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/ball_SRR136156${i}.gtf" >> /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt
    done
    
cd /Volumes/WANs_SSD/WAN/RNA-seq/test1/data
python3 /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/prepDE.py3 -i /Volumes/WANs_SSD/WAN/RNA-seq/test1/data/BAM/ballgown/list.txt