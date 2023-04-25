// Gmsh project created on Mon Nov 28 14:52:52 2022
SetFactory("OpenCASCADE");//+
Point(33) = {-0.5, -0.5, 0, 1.0};
//+
Point(34) = {-0.5, 1.5, 0, 1.0};
//+
Point(35) = {2.5, 1.5, 0, 1.0};
//+
Point(36) = {2.5, -0.5, 0, 1.0};
//+
Line(33) = {34, 33};
//+
Line(34) = {33, 36};
//+
Line(35) = {35, 36};
//+
Line(36) = {35, 34};
//+
//+
Curve Loop(1) = {36, 33, 34, -35};
//+
Plane Surface(1) = {1};
//+
Transfinite Curve {36, 34} = 30 Using Progression 1;
//+
Transfinite Curve {33, 35} = 20 Using Progression 1;
//+
//+
Extrude {0, 0, 0.25} {
  Surface{1}; Layers {1}; Recombine;
}
//+
Physical Surface("inlet", 45) = {3};
//+
Physical Surface("outlet", 46) = {5};
//+
Physical Surface("wall", 47) = {2, 4};
//+
Physical Volume("fluid", 48) = {1};
