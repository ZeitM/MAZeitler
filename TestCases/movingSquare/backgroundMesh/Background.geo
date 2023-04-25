// Gmsh project created on Wed Nov  9 14:52:00 2022
SetFactory("OpenCASCADE");
//+
Point(1) = {2, -10, 0, 1.0};
//+
Point(2) = {5, -10, 0, 1.0};
//+
Point(3) = {5, 1, 0, 1.0};
//+
Point(4) = {2, 1, 0, 1.0};
//+
Point(5) = {3, 1.5, 0, 1.0};
//+
Point(6) = {4, 1.5, 0, 1.0};
//+
Line(1) = {5, 4};
//+
Line(2) = {4, 1};
//+
Line(3) = {1, 2};
//+
Line(4) = {2, 3};
//+
Line(5) = {3, 6};
//+
Line(6) = {6, 5};
//+
Curve Loop(1) = {1, 2, 3, 4, 5, 6};
//+
Plane Surface(1) = {1};
//+
Transfinite Curve {6} = 10 Using Progression 1;
//+
Transfinite Curve {2} = 100 Using Progression 1;
//+
Transfinite Curve {4} = 100 Using Progression 1;
//+
Transfinite Curve {3} = 30 Using Progression 1;
//+
Transfinite Curve {1} = 20 Using Progression 1;
//+
Transfinite Curve {5} = 20 Using Progression 1;
//+
Extrude {0, 0, 0.5} {
  Surface{1}; Layers {1}; Recombine;
}
//+
Physical Surface("inlet", 19) = {7};
//+
Physical Surface("outlet", 20) = {4};
//+
Physical Surface("wall", 21) = {3, 5, 6, 2};
//+
Physical Volume("fluid", 22) = {1};
