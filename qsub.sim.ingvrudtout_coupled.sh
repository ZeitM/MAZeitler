#!/bin/sh

cd $PBS_O_WORKDIR
. openfoam of_v2206_15.4

SourceIndex=1
MainIndex=2
for i in $(seq 0.16 0.06 0.94)
do
    cd Main$MainIndex

    
    
    mapFields -consistent -sourceTime 0.06 ../Main$SourceIndex
    cp 0.orig/zoneID 0/
    cp ../pointMotionU/pointMotionU$i 0/pointMotionU
    rm 0/cellTypes
    rm 0/*.unmapped
    topoSet
    setFields

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

    reconstructPar -time '0.01,0.02,0.03,0.04,0.05,0.06'
    #recontructPar -latestTime
    #rm -rf processor*
    
    
    cd ../
    

    
    ((SourceIndex++))
    ((MainIndex++))

done
