#!/bin/bash

# NOTE:
# --cpus-per-task parameter controls the number of
# cpus needed to run the current job.
#
# If your application runs sequentially, please set
# --cpus-per-task=1
# If you need to reserve the full node, please set
# --cpus-per-task=32

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno17/lab1
#SBATCH -J Job_1_helloflops3_slurm_basic
#SBATCH --output=helloflops3.out
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=laureano.r.p@um.es

# Current host
echo "Host: $(hostname)"

# User
echo "User: $(whoami)"

# Current dir
echo "Script directory: $(pwd)"

# For loop to execute helloflops3-AVX, a program that measures performance
for i in {1..3}
do
	echo $i
	./helloflops3-AVX
        echo
done
