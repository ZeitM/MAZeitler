#!/bin/sh

cd $PBS_O_WORKDIR

. openfoam of_v2206_15.4

#export FOAM_SIGFPE=false

#rm -rf processor*
 
sed -i "s/numberOfSubdomains.*;/numberOfSubdomains $PBS_NP;/" system/decomposeParDict
decomposePar > log_dp 2>&1

#sed -e 's%^[ \t]*writeInterval.*%writeInterval 100;%g' -i system/controlDict
#sed -e 's%^[ \t]*endTime.*%endTime 100;%g' -i system/controlDict
#sed -e 's%turbulence.*[a-z];%turbulence off;%g' -i constant/turbulenceProperties
mpirun --oversubscribe -np $PBS_NP nice -19 overInterDyMFoam -parallel > log_of 2>&1

#sed -e 's%^[ \t]*writeInterval.*%writeInterval 1000;%g' -i system/controlDict
#sed -e 's%^[ \t]*endTime.*%endTime 1000;%g' -i system/controlDict
#sed -e 's%turbulence.*[a-z];%turbulence on;%g' -i constant/turbulenceProperties
#mpirun --oversubscribe -np $PBS_NP nice -19 simpleFoam -parallel >> log_of 2>&1

reconstructPar -time '0.001,0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1'
#recontructPar -latestTime
#rm -rf processor*

