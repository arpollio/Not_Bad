#! /bin/bash

#PBS -q debug
#PBS -lwalltime=00:05:00
#PBS -lnodes=1:ppn=12

#PBS -N Test_PRTOGAMMAUTO_unmasked_mpi
#PBS -m abe -M arpollio@mix.wvu.edu
source /shared/software/miniconda3/etc/profile.d/conda.sh
conda activate tpd0001


cd /scratch/arpollio/
cd tree_core100/PROTGAMMAAUTO/thread_test/


mpirun -np 12 -machinefile $PBS_NODEFILE raxmlHPC-mpi -N $PBS_NODEFILE -f a -m PROTGAMMAAUTO -p 650 -x 650 -# 100 -s core100.tree.unmasked.phy -n core100.unmasked.auto.test.mpi.tree

conda deactivate
