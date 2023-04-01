#!/bin/bash

for positionfile in POSITIONFILE_*;
do
sbatch runMatcher.sh ${positionfile}
done
