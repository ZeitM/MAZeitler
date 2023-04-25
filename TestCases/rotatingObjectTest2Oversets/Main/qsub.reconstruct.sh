#!/bin/sh

cd $PBS_O_WORKDIR

. openfoam of_v2206_15.4

#reconstructPar -time '0.05,0.1,0.15,0.2'
recontructPar -latestTime
