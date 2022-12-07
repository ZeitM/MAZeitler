#!/bin/bash

gmsh -3 SpanraumOverset.geo
gmshToFoam SpanraumOverset.msh
transformPoints -scale "(0.001 0.001 0.001)"

pyFoamChangeBoundaryType.py . Overset overset
