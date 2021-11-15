#!/bin/bash -l
#SBATCH --constraint=haswell
#SBATCH --partition=debug
#SBATCH --account=m3346
#SBATCH --time=00:15:00
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=16
#SBATCH --ntasks-per-socket=8
#SBATCH --job-name=pw20gk7.6
#SBATCH --mail-type=ALL
#SBATCH --mail-user=longzhang2008@gmail.com

##export OMP_NUM_THREADS=4
##export MKL_NUM_THREADS=4
##srun -n 36 -c 4 --hint=nomultithread --unbuffered ./sirius.scf --mpi_grid="6 6"
##srun -n 36 -c 4 --hint=nomultithread --unbuffered ./sirius.scf --mpi_grid="2 2" --task=2 

## add lib path 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/global/cscratch1/sd/zhang714/install_sirius_2021_09_23/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/global/cscratch1/sd/zhang714/install_sirius_2021_09_23/local/lib64

SECONDS=0                    # timing 

export OMP_NUM_THREADS=8
export MKL_NUM_THREADS=8
ulimit -c unlimited
srun -n 128 ./sirius.scf > log_scf.txt

duration=$SECONDS            # timing

echo " "
echo " ================================================= "
echo " The job is done in time.                          "
echo " Time used for execution: $(($duration / 60)) min $(($duration % 60)) sec "
echo " ================================================= "
echo " " 
