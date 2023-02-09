for i in {1..49}; do
    pyFoamChangeBoundaryType.py . over1_$i overset
    pyFoamChangeBoundaryType.py . arc1_$i wall   
done

for i in {1..50}; do
    pyFoamChangeBoundaryType.py . over2_$i overset
    pyFoamChangeBoundaryType.py . arc2_$i wall   
done

for i in {1..50}; do
    pyFoamChangeBoundaryType.py . over3_$i overset
    pyFoamChangeBoundaryType.py . arc3_$i wall   
done

for i in {1..50}; do
    pyFoamChangeBoundaryType.py . over4_$i overset
    pyFoamChangeBoundaryType.py . arc4_$i wall   
done

