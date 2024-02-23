#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --job-name=dssp
#SBATCH --partition=highmem
#SBATCH -n 2
#SBATCH --mem=4G

exe=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/source/bin/rosetta_scripts.linuxgccrelease
database=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/database/;

${exe} -parser:protocol dssp.xml -in:file:s 1rfn_relaxed.pdb @dssp.flag -restore_talaris_behavior -overwrite > dssp.log
