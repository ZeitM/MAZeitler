// Gmsh project created on Tue Jan 10 11:38:08 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {2, 0, 0, 1.0};
//+
Point(3) = {2, 2, 0, 1.0};
//+
Point(4) = {0, 2, 0, 1.0};
//+
Point(5) = {0.5, 2.5, 0, 1.0};
//+
Point(6) = {1.5, 2.5, 0, 1.0};
//+
Point(7) = {0, -2, 0, 1.0};
//+
Point(8) = {2, -2, 0, 1.0};
//+
Line(1) = {5, 4};
//+
Line(2) = {6, 3};
//+
Line(3) = {6, 5};
//+
Line(4) = {4, 1};
//+
Line(5) = {1, 2};
//+
Line(6) = {2, 3};
//+
Point(9) = {2, -1, 0, 1.0};
//+
Point(10) = {0, -1, 0, 1.0};
//+
Line(9) = {9, 10};
//+
Line(10) = {1, 10};
//+
Line(11) = {2, 9};
//+
Recursive Delete {
  Point{7}; Point{8}; 
}
//+
Curve Loop(1) = {1, 4, 5, 6, -2, 3};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {10, -9, -11, -5};
//+
Plane Surface(2) = {2};
//+
Transfinite Curve {5, 4, 6} = 20 Using Progression 1;
//+
Transfinite Curve {2, 1, 3} = 5 Using Progression 1;
//+
Transfinite Curve {9} = 10 Using Progression 1;
//+
Transfinite Curve {10, 11} = 5 Using Progression 1;
//+
Extrude {0, 0, 0.25} {
  Surface{1}; Surface{2}; Layers {1}; Recombine;
}
//+
Physical Surface("inlet", 29) = {8};
//+
Physical Surface("wall", 30) = {3, 4, 10, 11, 12, 6};
//+
Physical Surface("outlet", 31) = {7};
//+
Physical Volume("c0", 32) = {1, 2};
