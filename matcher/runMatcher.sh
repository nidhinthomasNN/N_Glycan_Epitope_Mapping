#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --job-name=match
#SBATCH --partition=highmem
#SBATCH -n 16
#SBATCH --mem=32G

exe=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/source/bin/match.linuxgccrelease
database=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/database/;
POSITIONFILE=$1

${exe} -in:file:s 1rfn_relaxed.pdb -match:lig_name NAG -match:geometric_constraint_file CSTFILE.cst -extra_res_fa NAG.fa.params -match:scaffold_active_site_residues ${POSITIONFILE}
