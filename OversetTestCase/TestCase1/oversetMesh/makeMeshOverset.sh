#!/bin/bash

#gmsh -3 Spanraum2.geo
gmshToFoam SpanraumOverset2.msh
transformPoints -scale "(0.001 0.001 0.001)"

pyFoamChangeBoundaryType.py . Overset overset
