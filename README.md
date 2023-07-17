# N_Glycan_Epitope_Mapping

This repository describes the workflow for the computational modeling of glycoslylation of protein residues using Rosetta Matcher Protocol. 

## Predict loop structure for matching

bash runDSSP.sh

## Match for N-glycan using Rosetta Matcher

cd ./matcher

bash batch_runMatcher.sh

## Geometrical restraint score for each match

The output files obtained from matcher protocol contains multiple glycans attached to the same amino acid position as a cluster. Therefore, it is essential to extract one glycan per PDB file. This can be achieved by running a minimization protocol at first prior to the repacking step. 

bash batch_minimMatcher.sh

Upon completion of the minimization step, glycan and residues from the neighbourhood of glycan can be repacked to obtain better geometric constraint score and energy score. Repacking of the structure is implemented as below.

bash batch_repackMatcher.sh
