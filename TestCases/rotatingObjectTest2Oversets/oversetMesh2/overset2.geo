// Gmsh project created on Sun Feb  5 14:30:48 2023
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {2, 0, 0, 1.0};
//+
Point(3) = {2, -0.5, 0, 1.0};
//+
Point(4) = {0, -0.5, 0, 1.0};
//+
Point(5) = {0, -0.7, 0, 1.0};
//+
Point(6) = {2, -0.7, 0, 1.0};
//+
Point(7) = {2, 0.2, 0, 1.0};
//+
Point(8) = {0, 0.2, 0, 1.0};
//+
Line(1) = {8, 1};
//+
Line(2) = {1, 2};
//+
Line(3) = {2, 7};
//+
Line(4) = {7, 8};
//+
Line(5) = {4, 3};
//+
Line(6) = {3, 6};
//+
Line(7) = {6, 5};
//+
Line(8) = {5, 4};
//+
Curve Loop(1) = {1, 2, 3, 4};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {8, 5, 6, 7};
//+
Plane Surface(2) = {2};
//+
Transfinite Curve {4, 2, 5, 7} = 20 Using Progression 1;
//+
Transfinite Curve {3, 6, 8, 1} = 2 Using Progression 1;
//+
Extrude {0, 0, 0.25} {
  Surface{1}; Surface{2}; Layers {1}; Recombine;
}
//+
Physical Surface("overset2", 25) = {6, 11};
//+
Physical Surface("wall", 26) = {3, 8, 9, 4, 5, 10};
//+
Physical Volume("c2", 27) = {1, 2};
