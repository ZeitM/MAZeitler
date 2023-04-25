#!/bin/bash

gmsh -3 overset2.geo
gmshToFoam overset2.msh
transformPoints -scale "(0.001 0.001 0.001)"

pyFoamChangeBoundaryType.py . back empty
pyFoamChangeBoundaryType.py . oversetWall slip
pyFoamChangeBoundaryType.py . overset2 overset
pyFoamChangeBoundaryType.py . front wall
pyFoamChangeBoundaryType.py . oversetEmpty overset
