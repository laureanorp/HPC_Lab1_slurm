#!/bin/bash

#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno17/lab1
#SBATCH --output=python_fibonacci.out
#SBATCH -J Job_3_python_fibonacci
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=NONE   # END/START/NONE
#SBATCH --mail-user=laureano.r.p@um.es

# Fibonacci functionis without parallel
echo "Python script without parellel, one by one"
time for i in {1..4}
do
	python ./python_fibonacci_functions/python_fibonacci_"$i".py
done

# Fibonacci function using parallel
echo "Python script using parallel"
time find -name "*.py" | parallel python
