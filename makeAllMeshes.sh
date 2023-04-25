#!/bin/bash

direcotryCount=1
for i in $(seq 0.10 0.06 0.94)
do


    cp -r oversetMeshRaw oversetMesh$direcotryCount
    cp -r MainRaw Main$direcotryCount
    cp ../SpiralGeometry/Spirale$i.geo oversetMesh$direcotryCount
    
    cd oversetMesh$direcotryCount
    
    gmsh -3 Spirale$i.geo
    gmshToFoam Spirale$i.msh
    
    
    pyFoamChangeBoundaryType.py . back empty   
    pyFoamChangeBoundaryType.py . front wall 
    pyFoamChangeBoundaryType.py . arcStart12 wall
    pyFoamChangeBoundaryType.py . arcStart34 wall
    pyFoamChangeBoundaryType.py . arcEnd12 wall
    pyFoamChangeBoundaryType.py . arcEnd34 wall


    for i in {1..49}; do
        pyFoamChangeBoundaryType.py . arc1_$i overset   
    done

    for i in {1..50}; do
        pyFoamChangeBoundaryType.py . arc2_$i wall  
    done

    for i in {1..50}; do
        pyFoamChangeBoundaryType.py . arc3_$i wall  
    done

    for i in {1..50}; do
        pyFoamChangeBoundaryType.py . arc4_$i overset   
    done

    
    
    cd ../backgroundMesh
    mergeMeshes . ../oversetMesh$direcotryCount
    cp -r 5e-05/polyMesh ../Main$direcotryCount/constant/
    rm -r 5e-05
    
    cd ../
    
    
    ((direcotryCount++))
done
