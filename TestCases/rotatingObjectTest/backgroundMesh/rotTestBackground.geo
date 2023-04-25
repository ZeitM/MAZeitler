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
Point(11) = {0, -0.5, 0, 1.0};
//+
Point(12) = {2, -0.5, 0, 1.0};
//+
Line(10) = {1, 11};
//+
Line(11) = {11, 10};
//+
Line(12) = {12, 9};
//+
Line(13) = {2, 12};
//+
Line(14) = {12, 11};
//+
Curve Loop(1) = {4, 5, 6, -2, 3, 1};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {14, 11, -9, -12};
//+
Plane Surface(2) = {2};
//+
Recursive Delete {
  Point{7}; Point{8}; 
}
//+
Transfinite Curve {5, 14, 9} = 20 Using Progression 1;
//+
Transfinite Curve {6, 4} = 20 Using Progression 1;
//+
Transfinite Curve {2, 1, 11, 12} = 5 Using Progression 1;
//+
Transfinite Curve {3} = 10 Using Progression 1;

//+
Extrude {0, 0, 0.25} {
  Surface{1}; Surface{2}; Layers {1}; Recombine;
}
//+
Physical Surface("inlet", 35) = {7};
//+
Physical Surface("wall", 36) = {8, 3, 6, 5, 4, 10, 13, 12, 11};
//+
Physical Surface(" wall", 36) -= {4};
//+
Physical Surface("outlet", 37) = {4};
//+
Physical Volume("fluid", 38) = {1};
//+
Physical Volume("deadWater", 39) = {2};
