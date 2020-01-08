#! /bin/bash



#PBS -q comm_mmem_day

#PBS -lwalltime=05:00:00

#PBS -lnodes=1:ppn=1,pvmem=54gb

#PBS -N propanilalign1

#PBS -m abe -M arpollio@gmail.com




module load genomics/bioconda
source /shared/software/miniconda3/etc/profile.d/conda.sh
conda activate tpd0001


cd /scratch/arpollio/Not_Bad/genome/



#Index reference genome with hisat - required for hisat to run properly
makeblastdb -dbtype prot -in entero30.faa -out enterobactericiae
blastp -query entero30.faa -db enterobactericiae -num_threads 12 -max_target_seqs 100 -evalue 0.0000001 -out All_organism_Blast_results -outfmt 6

conda deactivate 
