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
lExt = 1.;
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

Point(1) = {9.4 + x, 0 + y, 0, 100};
//+
Point(60) = {9.25+ x, 0.2+ y, 0, 100};
//+
Point(61) = {0+ x, -0+ y, 0, 100};
//+
Point(62) = {0.15+ x, 0.2+ y, 0, 100};
//+
Line(1) = {61, 62};
//+
Line(2) = {62, 60};
//+
Line(3) = {60, 1};
//+
Line(4) = {1, 61};
//+
Curve Loop(1) = {1, 2, 3, 4};
//+
Plane Surface(1) = {1};
//+
Transfinite Curve {4} = 78 Using Progression 1;
//+
Transfinite Curve {2} = 78 Using Progression 1;
//+
Transfinite Curve {1, 3} = 1* trans Using Progression prog;
//+
Transfinite Surface {1};
//+
Recombine Surface {1};
//+
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
  Surface{1}; 
  Layers{one[], layer[]};
  Recombine; 
}
Delete one;
Delete r;
Delete a;
Delete layer;



r = 1/prog_zGap; // progression

a = (r - 1) / (r^nLayer_zGap - 1); 
one[0] = 1; 
layer[0] = a; 
For i In {1:nLayer_zGap-1}    
one[i] = 1;   
layer[i] = layer[i-1] + a * r^i; 
EndFor
Extrude {0,0,0.15} {    
Surface{6};
Recombine; 
Layers{one[], layer[]}; }
Delete one;
Delete r;
Delete a;
Delete layer;
//+


r = prog_Ext; // progression
a = (r - 1) / (r^nLayer_Ext - 1); 
one[0] = 1; 
layer[0] = a; 
For i In {1:nLayer_Ext-1}    
one[i] = 1;   
layer[i] = layer[i-1] + a * r^i; 
EndFor

Extrude {lExt / Sqrt(2), lExt / Sqrt(2),0} {    
  Surface{9};
  Layers{9};                   //Layers{one[], layer[]};
  Recombine; 
}





Physical Volume("fluid", 21) = {1, 2, 3};
//+
Physical Surface("oversetWall", 22) = {5, 10};
//+
Physical Surface("overset2", 23) = {3, 8, 2, 4, 7, 13, 16, 14, 12};
//+
Physical Surface("front", 24) = {11, 15};
//+
Physical Surface("back", 25) = {1};
//+
//Physical Surface("oversetEmpty", 26) = {2, 4, 7, 9, 5, 10};
//+
