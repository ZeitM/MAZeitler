#!/bin/bash

gmsh -3 SpiraleRotatedTest.geo
gmshToFoam SpiraleRotatedTest.msh

pyFoamChangeBoundaryType.py . back  empty   
pyFoamChangeBoundaryType.py . front wall 
pyFoamChangeBoundaryType.py . chipWall wall
pyFoamChangeBoundaryType.py . chipOverset overset



