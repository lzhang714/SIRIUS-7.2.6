#!/bin/bash -l
#SBATCH --constraint=haswell
#SBATCH --partition=debug
#SBATCH --account=mp261
#SBATCH --time=00:30:00
#SBATCH --nodes=16
#SBATCH --ntasks-per-node=2
#SBATCH --ntasks-per-socket=1
#SBATCH --job-name=dtn844222
#SBATCH --mail-type=ALL
#SBATCH --mail-user=longzhang2008@gmail.com

## add lib path 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/global/cscratch1/sd/zhang714/install_sirius_nonMKL/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/global/cscratch1/sd/zhang714/install_sirius_nonMKL/local/lib64


SECONDS=0                    # timing 

export OMP_NUM_THREADS=16
##export MKL_NUM_THREADS=16
ulimit -c unlimited
srun -n 32 ./sirius.scf > log_scf.txt

duration=$SECONDS            # timing

echo " "
echo " ================================================= "
echo " The job is done in time.                          "
echo " Time used for execution: $(($duration / 60)) min $(($duration % 60)) sec "
echo " ================================================= "
echo " " 
