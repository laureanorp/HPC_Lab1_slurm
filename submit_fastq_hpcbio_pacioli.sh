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
#SBATCH --output=fastqc_analysis.out
#SBATCH -J Job_2_fastq_analysis
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=laureano.r.p@um.es

# Load FastQC module
module load fastqc/0.11.8

# FastQC version
echo "FastQC version: $(fastqc --version)"

# FastQC invidually 
echo "Running FastQC on each file individually"
fastqc ./fastq_samples/Sample1.fastq
fastqc ./fastq_samples/Sample2.fastq
fastqc ./fastq_samples/Sample3.fastq
fastqc ./fastq_samples/Sample4.fastq

# FastQC using a for loop
echo "Running FastQC using a for loop"
time for i in {1..4}
do
	fastqc ./fastq_samples/Sample"$i".fastq
done

# Parallel execution
echo "Running FastQC using the parallel command"
time find -name "*.fastq" | parallel fastqc


