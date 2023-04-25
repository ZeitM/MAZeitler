// Gmsh project created on Tue Jan 10 11:57:45 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0.5, 0, 0, 1.0};
//+
Point(2) = {0.7, 0, 0, 1.0};
//+
Point(3) = {1.3, 0, 0, 1.0};
//+
Point(4) = {1.3, -0.6, 0, 1.0};
//+
Point(5) = {1.3, -0.8, 0, 1.0};
//+
Circle(1) = {2, 3, 4};
//+
Circle(2) = {1, 3, 5};
//+
Line(3) = {1, 2};
//+
Line(4) = {4, 5};
//+
Point(6) = {0.25, 0.25, 0, 1.0};
//+
Point(7) = {0.95, 0.25, 0, 1.0};
//+
Recursive Delete {
  Point{6}; Point{7}; 
}
//+
Point(6) = {0.4, 0.1, 0, 1.0};
//+
Point(7) = {0.8, 0.1, 0, 1.0};
//+
Point(8) = {1.6, -0.9, 0, 1.0};
//+
Point(9) = {1.6, -0.5, 0, 1.0};
//+
Point(10) = {1.4, -0.5, 0, 1.0};
//+
Point(11) = {1.4, -0.9, 0, 1.0};
//+
Recursive Delete {
  Point{9}; Point{8}; 
}
//+
Point(12) = {1.4, 0.1, 0, 1.0};
//+
Circle(5) = {6, 12, 11};
//+
Circle(6) = {7, 12, 10};
//+
Line(7) = {6, 7};
//+
Line(8) = {10, 11};
//+
Curve Loop(1) = {7, 6, 8, -5};
//+
Curve Loop(2) = {3, 1, 4, -2};
//+
Plane Surface(1) = {1, 2};
//+
Transfinite Curve {1, 2} = 20 Using Progression 1;
//+
Transfinite Curve {6, 5} = 25 Using Progression 1;
//+
Transfinite Curve {7, 8} = 8 Using Progression 1;

//+
Extrude {0, 0, 0.25} {
  Surface{1}; Layers {1}; Recombine;
}
//+
Physical Surface("overset", 25) = {2, 3, 4, 5};
//+
Physical Surface("object", 26) = {6, 9, 7, 8};
//+
Physical Volume("c1", 27) = {1};
