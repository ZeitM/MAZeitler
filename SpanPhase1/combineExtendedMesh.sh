#!/bin/bash

cd backgroundMeshExtended
mergeMeshes . ../oversetMesh
mergeMeshes. ../oversetMesh2
cp -r 0.0001/polyMesh ../MainExtended/constant/
