// Gmsh project created on Mon Nov 28 14:52:52 2022
SetFactory("OpenCASCADE");//+
Point(1) = {0.25, 0.0, 0, 1.0};
//+
Point(2) = {0.26092619963309716, 0.10395584540887966, 0, 1.0};
//+
Point(3) = {0.29322727117869957, 0.20336832153790008, 0, 1.0};
//+
Point(4) = {0.267386413, 0.12383834, 0, 1.0};
//+
Point(5) = {0.273846628, 0.143720835, 0, 1.0};
//+
Point(6) = {0.280306842, 0.163603331, 0, 1.0};
//+
Point(7) = {0.286767056, 0.183485826, 0, 1.0};

//+
Point(17) = {0.0, 0.0, 0, 1.0};
//+
Point(18) = {0.016389299449645733, 0.1559337681133195, 0, 1.0};
//+
Point(19) = {0.06484090676804932, 0.3050524823068501, 0, 1.0};
//+
Point(20) = {0.02607962, 0.185757511, 0, 1.0};
//+
Point(21) = {0.035769941, 0.215581253, 0, 1.0};
//+
Point(22) = {0.045460262, 0.245404996, 0, 1.0};
//+
Point(23) = {0.055150583, 0.275228739, 0, 1.0};

//+
Point(33) = {-0.09999999999999998, 0.0, 0, 1.0};
//+
Point(34) = {-0.08142546062373479, 0.1767249371950954, 0, 1.0};
//+
Point(35) = {-0.02651363899621073, 0.34572614661443013, 0, 1.0};
//+
Point(36) = {-0.070443096, 0.210525178, 0, 1.0};
//+
Point(37) = {-0.059460732, 0.244325419, 0, 1.0};
//+
Point(38) = {-0.048478368, 0.27812566, 0, 1.0};
//+
Point(39) = {-0.037496004, 0.311925901, 0, 1.0};

//+
Point(49) = {0.35, 0.0, 0, 1.0};
//+
Point(50) = {0.3587409597064777, 0.08316467632710373, 0, 1.0};
//+
Point(51) = {0.3845818169429596, 0.16269465723032006, 0, 1.0};
//+
Point(52) = {0.363909131, 0.099070672, 0, 1.0};
//+
Point(53) = {0.369077302, 0.114976668, 0, 1.0};
//+
Point(54) = {0.374245474, 0.130882664, 0, 1.0};
//+
Point(55) = {0.379413645, 0.146788661, 0, 1.0};





//+
Line(1) = {33, 34};
//+
Line(2) = {18, 17};
//+
Line(3) = {2, 1};
//+
Line(4) = {50, 49};
//+
Line(5) = {35, 19};
//+
Line(6) = {3, 51};
//+
Line(7) = {35, 39};
//+
Line(8) = {39, 38};
//+
Line(9) = {38, 37};
//+
Line(10) = {37, 36};
//+
Line(11) = {36, 34};
//+
Line(12) = {18, 20};
//+
Line(13) = {20, 21};
//+
Line(14) = {21, 22};
//+
Line(15) = {22, 23};
//+
Line(16) = {23, 19};
//+
Line(17) = {3, 7};
//+
Line(18) = {7, 6};
//+
Line(19) = {6, 5};
//+
Line(20) = {5, 4};
//+
Line(21) = {4, 2};
//+
Line(22) = {50, 52};
//+
Line(23) = {52, 53};
//+
Line(24) = {53, 54};
//+
Line(25) = {54, 55};
//+
Line(26) = {55, 51};
//+
Line(27) = {33, 17};
//+
Line(28) = {1, 49};
//+
Line(29) = {39, 23};
//+
Line(30) = {22, 38};
//+
Line(31) = {37, 21};
//+
Line(32) = {20, 36};
//+
Line(33) = {34, 18};
//+
Line(34) = {7, 55};
//+
Line(35) = {54, 6};
//+
Line(36) = {5, 53};
//+
Line(37) = {52, 4};
//+
Line(38) = {2, 50};
//+
Curve Loop(1) = {1, 33, 2, -27};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {11, 33, 12, 32};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {10, -32, 13, -31};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {30, 9, 31, 14};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {30, -8, 29, -15};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {16, -5, 7, 29};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {6, -26, -34, -17};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {34, -25, 35, -18};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {19, 36, 24, 35};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {20, -37, 23, -36};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {21, 38, 22, 37};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {3, 28, -4, -38};
//+
Plane Surface(12) = {12};
//+
Transfinite Curve {11, 12, 13, 10, 32, 33, 31, 30, 9, 14, 15, 29, 8, 7, 5, 16, 6, 34, 17, 26, 25, 35, 18, 19, 20, 36, 24, 23, 37, 38, 22, 21} = 3 Using Progression 1;
//+
Transfinite Curve {2, 1, 27, 3, 4, 28} = 4 Using Progression 1;
//+
Extrude {0, 0, 0.25} {
  Surface{6}; Surface{5}; Surface{4}; Surface{3}; Surface{2}; Surface{1}; Surface{12}; Surface{11}; Surface{10}; Surface{9}; Surface{8}; Surface{7}; Layers {1}; Recombine;
}
//+
Physical Surface("arcStart", 105) = {36, 39};
//+
Physical Surface("arcTop1", 106) = {35};
//+
Physical Surface("arcTop2", 107) = {32};
//+
Physical Surface("arcTop3", 108) = {28};
//+
Physical Surface("arcTop4", 109) = {24};
//+
Physical Surface("arcTop5", 110) = {20};
//+
Physical Surface("arcTop6", 111) = {13};
//+
Physical Surface("overTop1", 112) = {34};
//+
Physical Surface("overTop2", 113) = {30};
//+
Physical Surface("overTop3", 114) = {26};
//+
Physical Surface("overTop4", 115) = {22};
//+
Physical Surface("overTop5", 116) = {19};
//+
Physical Surface("overTop6", 117) = {15};
//+
Physical Surface("arcBot1", 118) = {38};
//+
Physical Surface("arcBot2", 119) = {43};
//+
Physical Surface("arcBot3", 120) = {47};
//+
Physical Surface("arcBot4", 121) = {51};
//+
Physical Surface("arcBot5", 122) = {57};
//+
Physical Surface("arcBot6", 123) = {61};
//+
Physical Surface("overBot1", 124) = {40};
//+
Physical Surface("overBot2", 125) = {44};
//+
Physical Surface("overBot3", 126) = {48};
//+
Physical Surface("overBot4", 127) = {52};
//+
Physical Surface("overBot5", 128) = {56};
//+
Physical Surface("overBot6", 129) = {60};
//+
Physical Surface("arcEnd", 130) = {14, 59};
//+
Physical Volume("arcZone1", 131) = {6, 7};
//+
Physical Volume("arcZone2", 132) = {5, 8};
//+
Physical Volume("arcZone3", 133) = {4, 9};
//+
Physical Volume("arcZone4", 134) = {3, 10};
//+
Physical Volume("arcZone5", 135) = {2, 11};
//+
Physical Volume("arcZone6", 136) = {1, 12};
