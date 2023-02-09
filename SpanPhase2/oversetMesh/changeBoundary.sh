#!/bin/bash
pyFoamChangeBoundaryType.py . back  empty   
pyFoamChangeBoundaryType.py . front empty 


for i in {1..49}; do
    pyFoamChangeBoundaryType.py . arc1_$i wall   
done

for i in {1..50}; do
    pyFoamChangeBoundaryType.py . arc2_$i overset  
done

for i in {1..50}; do
    pyFoamChangeBoundaryType.py . arc3_$i overset  
done

for i in {1..50}; do
    pyFoamChangeBoundaryType.py . arc4_$i wall   
done

