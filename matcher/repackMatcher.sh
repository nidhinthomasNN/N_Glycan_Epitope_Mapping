#!/bin/bash

#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --job-name=match
#SBATCH --partition=highmem
#SBATCH -n 2
#SBATCH --mem=4G

exe=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/source/bin/rosetta_scripts.linuxgccrelease;
database=/nfs_home/projects/departments/cdd/programs/rosetta_src_2021.16.61629_bundle/main/database/;

inputFile=$1
list_identifier=${inputFile%.*}

mkdir ./${list_identifier}

echo "starting the repacking"

while read pdbfile; do

    cp ./repackMatcher.xml ./${list_identifier}/
    cp ./NAG.fa.params ./${list_identifier}/
    cp ./restraint.flag ./${list_identifier}/
    cp ./CSTFILE.cst ./${list_identifier}/
    cp ./NAG.pdb ./${list_identifier}/
    mv ./${pdbfile} ./${list_identifier}/
    cp ./generate_resfile_around_residues.py ./${list_identifier}/

    cd ./${list_identifier}/

    residue_number=$(echo "$pdbfile" | cut -d'_' -f3  | sed 's/N//')

    python generate_resfile_around_residues.py -f ${pdbfile} --nglycan 1 --residuenumber ${residue_number}

    ${exe} -database ${database} -parser:protocol repackMatcher.xml  -extra_res_fa NAG.fa.params @restraint.flag -parser_read_cloud_pdb 1 -restore_talaris_behavior -in:file:s ${pdbfile}

    cd ../

done<"${inputFile}"

echo "Repacking completed"
