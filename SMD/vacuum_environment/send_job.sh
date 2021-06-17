#!/bin/bash
#SBATCH --job-name=vac_smd    # Job name, change it to yours
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --ntasks=12                    # Run on a single CPU
#SBATCH --nodes=6                      # Run on multiple nodes
##SBATCH --time=00:05:00               # Time limit hrs:min:sec
#SBATCH --output=vac_278_%j.log   # Standard output log
#SBATCH --error=vac_278_%j.err   # Standard error log

echo $HOSTNAME
echo "ntasks:$SLURM_NTASKS"

#Amazon credentials
source /etc/profile.d/z00-global-profile.sh

# ../../NAMD_2.13_Linux-x86_64-multicore/namd2 +p6 step4_equilibration.inp > step4_equilibration.out
../../NAMD_2.13_Linux-x86_64-multicore/namd2 +p6 step5_production.inp > step5_production.out
