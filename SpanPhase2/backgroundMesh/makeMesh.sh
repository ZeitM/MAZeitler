#!/bin/bash

#gmsh -3 Spanraum2.geo
gmshToFoam Spanraum2.msh
transformPoints -scale "(0.001 0.001 0.001)"

pyFoamChangeBoundaryType.py . back empty
pyFoamChangeBoundaryType.py . workpiece wall
pyFoamChangeBoundaryType.py . tool wall
pyFoamChangeBoundaryType.py . wall wall
pyFoamChangeBoundaryType.py . outlet wall
pyFoamChangeBoundaryType.py . front wall
pyFoamChangeBoundaryType.py . Surface empty
for i in {1..8}; do
  pyFoamChangeBoundaryType.py . outlet_side_$i empty
done
pyFoamChangeBoundaryType.py . outlet_wall slip
pyFoamChangeBoundaryType.py . outlet_empty slip
