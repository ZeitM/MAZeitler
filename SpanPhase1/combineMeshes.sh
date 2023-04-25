#!/bin/bash

cd backgroundMesh
mergeMeshes . ../oversetMesh
cp -r 5e-05/polyMesh ../Main/constant
