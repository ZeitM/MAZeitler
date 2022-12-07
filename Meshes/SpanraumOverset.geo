// Gmsh project created on Mon Jul 12 11:25:42 2021
SetFactory("OpenCASCADE");

pLc = 100.;
prog = 1.0;//Progression
trans = 8;// Transfinite 
basis = 7;
prog_zGap = 1.07;
nLayer_zGap = 8; //number of layers
height_z = 1.25; // do not change
prog_z = 1.1;
nLayer_z = 13;
lc_s = 0.09;
lc_b = 0.12;
d_min = 0.3;
d_max = 1.3;
nLayer_Ext = 17;
prog_Ext = 1.10;
lExt = 2.;
// arc

Mesh.MeshSizeExtendFromBoundary = 0;
Mesh.MeshSizeFromPoints = 0;
Mesh.MeshSizeFromCurvature = 0;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
Field[1] = Distance;
//Field[1].PointsList = {20,62};
Field[1].CurvesList = {26, 62, 72, 70, 34, 35, 27, 54, 56, 60};
//Field[1].CurvesList = {72};
Field[1].Sampling = 30;


// We then define a `Threshold' field, which uses the return value of the
// `Distance' field 1 in order to define a simple change in element size
// depending on the computed distances
//
// SizeMax -                     /------------------
//                              /
//                             /
//                            /
// SizeMin -o----------------/
//          |                |    |
//        Point         DistMin  DistMax
Field[2] = Threshold;
Field[2].InField = 1;
Field[2].SizeMin = lc_s;
Field[2].SizeMax = lc_b;
Field[2].DistMin = d_min;
Field[2].DistMax = d_max;

// Let's use the minimum of all the fields as the background mesh size field
//Field[3] = Min;
//Field[3].FieldsList = {2};
Background Field = 2;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------


x = -((0.0094/2)*1000);
y = -((0.00514938/2)*1000);

//+
Point(0) = {0 ,0 ,0, pLc};
//+
//Point(15) = {2, 0.2, 0, pLc};
//+
// Point(17) = {4, 0, 0, pLc};
// +
// Point(18) = {4.2, 0, 0, pLc};
//+
Point(20) = {9+ x, 0.2+ y, 0, pLc};





//+
// Line(16) = {21, 20};
//+
Point(24) = {8.7+ x, 0.6+ y, 0, pLc};
//+
Point(25) = {6+ x,3.9+ y, 0, pLc};
//+
Point(26) = {1.1+ x, 3.9+ y, 0, pLc};
//+
Point(27) = {2.1+ x, 4.6+ y, 0, pLc};
//+
Point(28) = {3.5+ x, 4.9+ y, 0, pLc};
//+
Point(29) = {4.6+ x, 4.9+ y, 0, pLc};
//+
Point(30) = {0.78+ x, 3.07+ y, 0, pLc};
//+
Line(26) = {25, 24};
//+
Point(31) = {0.78+ x, 1.95+ y, 0, pLc};
//+
Line(27) = {30, 31};
//+
Point(33) = {0.05+ x, 0.6+ y, 0, pLc};

//+
Point(34) = {+0.04+ x, 1.09+ y, 0, pLc};
//+
Point(35) = {0.24+ x, 1.3+ y, 0, pLc};
//+
BSpline(34) = {33, 34,35};
//+
Line(35) = {35, 31};
//+


// Line(37) = {19, 6};

// Point(40) = {0.5, 0.9, 0, pLc};
// +
// Point(41) = {0.9, 1.4, 0, pLc};
// +
// Point(42) = {1.6, 1.8, 0, pLc};
// +
// BSpline(41) = {38, 40, 41, 42, 22};

Point(52) = {-0+ x, 0.52+ y, 0, pLc};
//+
BSpline(54) = {30, 26, 27, 28};
//+
Point(57) = {4.05+ x, 5+ y, 0, pLc};
//+
BSpline(56) = {28, 57, 29};
//+
Point(58) = {5.2+ x, 4.75+ y, 0, pLc};
//+
Point(59) = {5.7+ x, 4.35+ y, 0, pLc};
//+
BSpline(60) = {29, 58, 59, 25};
//+
Line(62) = {24, 20};
//+
Point(62) = {0.15+ x, 0.2+ y, 0, pLc};
//+
Line(70) = {33, 62};
//+
Line(72) = {20, 62};
//+


Curve Loop(1) = {54, 56, 60, 26, 62, 72, -70, 34, 35, -27};
//+
Plane Surface(1) = {1};


r = 1/prog_z; // progression
a = (r - 1) / (r^nLayer_z - 1); 
one[0] = 1; 
layer[0] = a; 
For i In {1:nLayer_z-1}    
one[i] = 1;   
layer[i] = layer[i-1] + a * r^i; 
EndFor

Extrude {0,0,height_z+0.15} {    
  Surface{1};
  //Layers{nLayer_z}; 
  Layers{one[], layer[]};
  Recombine; 
}
Delete one;
Delete r;
Delete a;
Delete layer;
/*
//+
Transfinite Curve {17, 80, 66, 127, 71, 77} = 1* trans Using Progression prog;
//+
Transfinite Curve {47, 85, 67, 89, 29, 93, 28, 100, 58, 104, 117, 117, 59, 61, 110, 18, 113, 64, 123, 63, 126} = trans Using Progression prog;
//+
Transfinite Curve {79, 68, 72, 75} = 10*basis Using Progression 1;

Transfinite Curve {82, 84} = 1*basis Using Progression 1;
//+
Transfinite Curve {62, 121, 124, 65} = 1.0*basis Using Progression 1;
//+
Transfinite Curve {112, 26, 108, 5} = 5*basis  Using Progression 1;
//+
Transfinite Curve {57, 120, 119, 60} = 2*basis Using Progression 1;
//+
Transfinite Curve {54, 102} = 4*basis Using Progression 1;
//+
Transfinite Curve {53, 105} = 4*basis Using Progression 1;
//+
Transfinite Curve {97, 27, 3, 99} = 1.4*basis Using Progression 1;
//+
Transfinite Curve {56, 118, 55, 115} = 1*basis Using Progression 1;
//+
Transfinite Curve {35, 94, 7, 95} = 1*basis Using Progression 1;
//+
Transfinite Curve {34, 87, 49, 90} = 1*basis  Using Progression 1;
//+
Transfinite Curve {70, 69} = 1.0*basis Using Progression 1;


//+
Transfinite Surface {1};
//+
Recombine Surface {1};
//+
Transfinite Surface {2};
//+
Recombine Surface {2};

//+
Transfinite Surface {3};
//+
Recombine Surface {3};
//+
Transfinite Surface {4};
//+
Recombine Surface {4};

//+
Transfinite Surface {5};
//+
Recombine Surface {5};
//+
Transfinite Surface {6};
//+
Recombine Surface {6};

//+
Transfinite Surface {7};
//+
Recombine Surface {7};
//+
Transfinite Surface {8};
//+
Recombine Surface {8};

//+
Transfinite Surface {9};
//+
Recombine Surface {9};
//+
Transfinite Surface {10};
//+
Recombine Surface {10};

//+
Transfinite Surface {11};
//+
Recombine Surface {11};


//+

r = 1/prog_zGap; // progression

a = (r - 1) / (r^nLayer_zGap - 1); 
one[0] = 1; 
layer[0] = a; 
For i In {1:nLayer_zGap-1}    
one[i] = 1;   
layer[i] = layer[i-1] + a * r^i; 
EndFor
Extrude {0,0,0.15} {    
Surface{12};
Recombine; 
Layers{one[], layer[]}; }
Delete one;
Delete r;
Delete a;
Delete layer;


*/

Physical Surface("Overset") = {2, 11, 10, 9, 8, 7, 6, 5, 4, 3};
//+
Physical Surface("front") = {12};
//+
Physical Surface("back", 94) = {1};
//+
Physical Volume("spanraum") = {1};

