#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH --job-name=match
#SBATCH --partition=highmem
#SBATCH -n 2
#SBATCH --mem=4G

exe=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/source/bin/rosetta_scripts.linuxgccrelease;
database=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/database/;

${exe} -database ${database} -parser:protocol minimMatcher.xml  -extra_res_fa NAG.fa.params @restraint.flag -parser_read_cloud_pdb 1 -restore_talaris_behavior -in:file:l $1
