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
Point(1) = {9.4 + x, 0 + y, 0, pLc};
//+
Point(2) = {0+ x, 0.2+ y, 0, pLc};
//+
Point(3) = {0.58+ x, 2+ y, 0, pLc};
//+
Point(4) = {0.58+ x, 3.17+ y, 0, pLc};
//+
Point(5) = {6.1+ x, 4.1+ y, 0, pLc};
//+
Point(6) = {9.1+ x, 0+ y, 0, pLc};

//+
Line(3) = {3, 4};
//+
Point(7) = {8.95+ x, 0.6+ y, 0, pLc};
//+

//+
Line(5) = {7, 5};
//+
Point(8) = {0.05+ x, 1.4+ y, 0, pLc};
//+
Point(9) = {-0.2+ x, 1.1+ y, 0, pLc};
//+
Point(10) = {-0.2+ x, 0.7+ y, 0, pLc};

//+
Line(7) = {8, 3};
//+
Point(11) = {1.1+ x, 4.1+ y, 0, pLc};
//+
Point(12) = {2.1+ x, 4.8+ y, 0, pLc};
//+
Point(13) = {3.5+ x, 5.1+ y, 0, pLc};
//+
Point(14) = {4.6+ x, 5.1+ y, 0, pLc};
//+
//Point(15) = {2, 0.2, 0, pLc};
//+
Point(16) = {2+ x, 2.2+ y, 0, pLc};
//+
// Point(17) = {4, 0, 0, pLc};
// +
// Point(18) = {4.2, 0, 0, pLc};
//+
Point(20) = {9+ x, 0.2+ y, 0, pLc};
//+
Line(8) = {2, 20};




//+
// Line(16) = {21, 20};
//+
Line(17) = {6, 20};
//+
Point(24) = {8.7+ x, 0.6+ y, 0, pLc};
//+
Line(18) = {7, 24};
//+


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
Line(28) = {4, 30};
//+
Line(29) = {3, 31};
//+
Point(32) = {2+ x, 2.4+ y, 0, pLc};
//+
Line(30) = {16, 32};

//+
Point(33) = {0.05+ x, 0.6+ y, 0, pLc};

//+
Point(34) = {+0.04+ x, 1.09+ y, 0, pLc};
//+
Point(35) = {0.24+ x, 1.3+ y, 0, pLc};
//+
Point(36) = {1.2+ x, 2.3+ y, 0, pLc};
//+
Point(37) = {1.75+ x, 2.4+ y, 0, pLc};
//+
BSpline(34) = {33, 34,35};
//+
Line(35) = {35, 31};
//+
BSpline(36) = {31, 36,37,32};
//+

// Line(37) = {19, 6};


//+
Line(38) = {8, 35};


// Point(40) = {0.5, 0.9, 0, pLc};
// +
// Point(41) = {0.9, 1.4, 0, pLc};
// +
// Point(42) = {1.6, 1.8, 0, pLc};
// +
// BSpline(41) = {38, 40, 41, 42, 22};
// +

//+
Point(43) = {1.75+ x, 2.2+ y, 0, pLc};
//+
Point(44) = {1.25+ x, 2.1+ y, 0, pLc};
//+
Point(45) = {0.91+ x, 1.91+ y, 0, pLc};
//+
Point(46) = {0.63+ x, 1.73+ y, 0, pLc};
//+
Point(47) = {0.39+ x, 1.41+ y, 0, pLc};
//+
Point(48) = {0.15+ x, 1.15+ y, 0, pLc};
//+
Point(49) = {0.05+ x, 0.83+ y, 0, pLc};

//+
BSpline(43) = {47, 46, 45};
//+
BSpline(44) = {45, 44, 43, 16};
//+
Line(45) = {47, 35};

//+
Line(46) = {45, 31};

//+
Point(50) = {-0.15+ x, 0.5+ y, 0, pLc};
//+
Point(51) = {-0.1+ x, 0.30+ y, 0, pLc};
//+
Point(52) = {-0+ x, 0.52+ y, 0, pLc};
//+
Point(53) = {-0.01+ x, 0.39+ y, 0, pLc};
//+
Line(47) = {50,33};
//+
Line(48) = {52,33};
//+
BSpline(49) = {50, 10, 9, 8};
//+
BSpline(50) = {52, 49, 48, 47};
//+
BSpline(51) = {2, 51, 50};
//+
BSpline(52) = {2, 53, 52};
//+
//+
BSpline(53) = {4, 11, 12, 13};
//+
Point(54) = {5.2+ x, 5+ y, 0, pLc};
//+
Point(55) = {5.7+ x, 4.6+ y, 0, pLc};
//+
BSpline(54) = {30, 26, 27, 28};
//+
Point(56) = {4.05+ x, 5.2+ y, 0, pLc};
//+
Point(57) = {4.05+ x, 5+ y, 0, pLc};
//+
BSpline(55) = {13, 56, 14};
//+
BSpline(56) = {28, 57, 29};
//+
BSpline(57) = {14, 54, 55, 5};
//+
Line(58) = {13, 28};
//+
Line(59) = {14, 29};
//+
Point(58) = {5.2+ x, 4.75+ y, 0, pLc};
//+
Point(59) = {5.7+ x, 4.35+ y, 0, pLc};
//+
BSpline(60) = {29, 58, 59, 25};
//+
Line(61) = {5, 25};
//+
Point(60) = {9.25+ x, 0.2+ y, 0, pLc};
//+
Line(62) = {24, 20};
//+
Line(63) = {1, 6};
//+
Line(64) = {60, 20};
//+
Line(65) = {60, 7};
//+
Line(66) = {1, 60};




//+
Recursive Delete {
  Curve{36}; 
}
//+
Recursive Delete {
  Curve{30}; 
}
//+
Recursive Delete {
  Curve{44}; 
}
//+
Recursive Delete {
  Point{43}; 
}
//+
Recursive Delete {
  Point{37}; 
}
//+
Recursive Delete {
  Point{36}; 
}
//+
Recursive Delete {
  Point{44}; 
}
//+
Recursive Delete {
  Curve{50}; 
}
//+
Recursive Delete {
  Curve{43}; 
}
//+
Recursive Delete {
  Point{46}; 
}
//+
Recursive Delete {
  Curve{45}; 
}
//+
Recursive Delete {
  Curve{38}; 
}
//+
Recursive Delete {
  Curve{46}; 
}
//+
Recursive Delete {
  Point{48}; 
}
//+
Recursive Delete {
  Point{49}; 
}
//+
Recursive Delete {
  Curve{48}; 
}
//+
Recursive Delete {
  Curve{52}; 
}
//+
Recursive Delete {
  Point{53}; 
}
//+
Line(67) = {8, 35};
//+
Recursive Delete {
  Curve{51}; 
}
//+
Point(61) = {0+ x, -0+ y, 0, pLc};
//+
Recursive Delete {
  Curve{8}; 
}
//+
Line(68) = {61, 6};
//+
BSpline(69) = {50, 51, 61};
//+
Point(62) = {0.15+ x, 0.2+ y, 0, pLc};
//+
Line(70) = {33, 62};
//+
Line(71) = {61, 62};
//+
Line(72) = {20, 62};
//+
Curve Loop(1) = {72, -71, 68, 17};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {70, -71, -69, 47};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {34, -67, -49, 47};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {29, -35, -67, 7};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {27, -29, 3, 28};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {54, -58, -53, 28};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {55, 59, -56, -58};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {60, -61, -57, 59};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {5, 61, 26, -18};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {62, -64, 65, 18};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {63, 17, -64, -66};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {26, 62, 72, -70, 34, 35, -27, 54, 56, 60};
//+
Plane Surface(12) = {12};

//+

r = 1/prog_z; // progression
a = (r - 1) / (r^nLayer_z - 1); 
one[0] = 1; 
layer[0] = a; 
For i In {1:nLayer_z-1}    
one[i] = 1;   
layer[i] = layer[i-1] + a * r^i; 
EndFor

Extrude {0,0,height_z} {    
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6}; 
  Surface{9}; Surface{7}; Surface{8}; Surface{10}; Surface{11}; Surface{12}; 
  //Layers{nLayer_z}; 
  Layers{one[], layer[]};
  Recombine; 
}
Delete one;
Delete r;
Delete a;
Delete layer;

//+
Transfinite Curve {17, 80, 66, 127, 71, 77} = 1* trans Using Progression prog;
//+
Transfinite Curve {47, 85, 67, 89, 29, 93, 28, 100, 58, 104, 117, 117, 59, 61, 110, 18, 113, 64, 123, 63, 126} = trans Using Progression prog;
//+
Transfinite Curve {79, 68, 72, 75} = 25*basis Using Progression 1;

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
Recombine Surface {12};

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
Surface{17}; Surface{21}; Surface{25}; 
Surface{29}; Surface{33}; Surface{37}; 
Surface{46}; Surface{49}; Surface{42}; 
Surface{53}; Surface{56}; Surface{57};
Recombine; 
Layers{one[], layer[]}; }
Delete one;
Delete r;
Delete a;
Delete layer;


r = prog_Ext; // progression
a = (r - 1) / (r^nLayer_Ext - 1); 
one[0] = 1; 
layer[0] = a; 
For i In {1:nLayer_Ext-1}    
one[i] = 1;   
layer[i] = layer[i-1] + a * r^i; 
EndFor

Extrude {-lExt / Sqrt(2),lExt / Sqrt(2),0} {    
  Surface{81};
  Layers{one[], layer[]};
  Recombine; 
}
//Extrude {-lExt / Sqrt(2),lExt / Sqrt(2),0} {    
Extrude {-lExt / Sqrt(1),0,0} {    
  Surface{76}; Surface{73}; Surface{69}; Surface{64};
  Layers{one[], layer[]};
  Recombine; 
}
Extrude {0, lExt / Sqrt(1),0} {    
  Surface{83};
  Layers{one[], layer[]};
  Recombine; 
}
Extrude {lExt / Sqrt(2), lExt / Sqrt(2),0} {    
  Surface{89}; Surface{91}; Surface{97}; Surface{100};
  Layers{one[], layer[]};
  Recombine; 
}
Delete one;
Delete r;
Delete a;
Delete layer;

Physical Surface("inlet") = {43};
//+
Physical Surface("outlet") = {52, 55};
//+
Physical Surface("wall") = {38, 48, 36, 31, 156, 159, 162, 161, 151, 155, 154, 160, 149, 157, 147, 152};
//+
Physical Surface("tool") = {28, 24, 19 };
//+
//Physical Surface("workpiece") = {15, 54, 60, 99};
//+
Physical Surface("front") = {102, 62, 66, 70, 74, 78, 82, 86, 90 ,94, 98, 101};
//+
Physical Surface("back") = {1, 2, 3, 4, 5, 7, 6, 9, 8, 10, 11, 12};
//+
Physical Surface("outlet_side_1") = {64, 69};
//+
Physical Surface("outlet_side_2") = {73};
//+
Physical Surface("outlet_side_3") = {76};
//+
Physical Surface("outlet_side_4") = {81};
//+
Physical Surface("outlet_side_5") = {83};
//+
Physical Surface("outlet_side_6") = {89};
//+
Physical Surface("outlet_side_7") = {91};
//+
Physical Surface("outlet_side_8") = {97, 100};
//+
//Physical Surface("outlet_side") = {76, 81, 83, 89, 91, 97, 100, 64, 69, 73};
//+
Physical Surface("Surface") = {13, 58, 18, 63,22,67,27,72,34,79,47,87,40,92,50,95,85,30,75 };
//+
Physical Volume("spanraum") = {1, 2, 3, 4, 5, 7, 6, 9, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24};
Physical Volume("spanraum") += {34, 33, 32, 31, 30, 25, 26, 27, 28, 29};
//+
Physical Surface("outlet_ext") = {124, 120, 116, 112, 107, 129, 134, 138, 142, 146};
//+
Physical Surface("outlet_wall") = {123, 119, 115, 111, 106, 128, 133, 137, 141, 145};
//+
Physical Surface("outlet_empty") = {143, 136, 140, 144, 132, 130, 126, 127, 125, 104, 121, 105, 110, 114, 118, 122, 103, 109};
//+
Show "*";
//+
Extrude {0, -5, 0} {
  Surface{15}; Surface{60}; Surface{54}; Surface{99}; Layers {100}; Recombine;
}
//+
//Physical Surface("deadWaterWall") = {156, 159, 162, 161, 151, 155, 154, 160, 149, 157, 147, 152};
//+
Physical Volume("spanraum", 16) += {35, 36, 37, 38};
