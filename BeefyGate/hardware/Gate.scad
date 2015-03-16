include <config/config.scad>

STLPath = "printedparts/stl/";
VitaminSTL = "vitamins/stl/";

DebugCoordinateFrames = 0;
DebugConnectors = false;

UseSTL = true;

machine("Gate.scad","Quadstacle Gate") {

    view(size=[1024,768], t=[68, 49, -37], r=[73, 0, 229], d=1951);


    GateAssembly();

}
