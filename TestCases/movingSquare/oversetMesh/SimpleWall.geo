// Gmsh project created on Thu Nov 10 15:36:05 2022
SetFactory("OpenCASCADE");
//+
Point(1) = {3, -2, 0, 1.0};
//+
Point(2) = {3, 1.5, 0, 1.0};
//+
Point(3) = {3, -1.5, 0, 1.0};
//+
Point(4) = {4, -1.5, 0, 1.0};
//+
Point(5) = {4, -2, 0, 1.0};
//+
Point(6) = {2.75, -1.25, 0, 1.0};
//+
Point(7) = {2.75, -2.25, 0, 1.0};
//+
Point(8) = {4.25, -2.25, 0, 1.0};
//+
Point(9) = {4.25, -1.25, 0, 1.0};
//+
Recursive Delete {
  Point{2}; 
}
//+
Line(1) = {6, 7};
//+
Line(2) = {7, 8};
//+
Line(3) = {8, 9};
//+
Line(4) = {9, 6};
//+
Line(5) = {3, 1};
//+
Line(6) = {1, 5};
//+
Line(7) = {5, 4};
//+
Line(8) = {4, 3};
//+
Curve Loop(1) = {1, 2, 3, 4};
//+
Curve Loop(2) = {5, 6, 7, 8};
//+
Plane Surface(1) = {1, 2};
//+
Transfinite Curve {1} = 15 Using Progression 1;
//+
Transfinite Curve {3} = 15 Using Progression 1;
//+
Transfinite Curve {8} = 15 Using Progression 1;
//+
Transfinite Curve {6} = 15 Using Progression 1;
//+
Transfinite Curve {5} = 7 Using Progression 1;
//+
Transfinite Curve {7} = 7 Using Progression 1;
//+
Transfinite Curve {2} = 23 Using Progression 1;
//+
Transfinite Curve {4} = 23 Using Progression 1;
//+
Extrude {0, 0, 0.5} {
  Surface{1}; Layers {1}; Recombine;
}
//+
Physical Surface("overset1x", 25) = {2, 4};
//+
Physical Surface("overset1y", 25) = {5, 3};
//+
Physical Surface("movingWallx", 26) = {8, 6;
//+
Physical Surface("movingWally", 26) = {9, 7};
//+
Physical Volume("fluid", 27) = {1};
