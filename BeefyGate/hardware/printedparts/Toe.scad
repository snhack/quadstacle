// Connectors

Toe_Con_Axle = [[0,0,0], [0,0,-1], 0,0,0];


module Toe_STL() {

    printedPart("printedparts/Toe.scad", "Toe", "Toe_STL()") {

        view(t=[0,0,0],r=[72,0,130],d=400);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(Toe_Con_Axle);
        }

        color(Level3PlasticColor) {
            if (UseSTL) {
                import(str(STLPath, "Toe.stl"));
            } else {
                Toe_Model();
            }
        }
    }
}


module Toe_Model()
{
    // local frame = axle is at origin, toe extends in y-

    // local vars
    w = 10;

    // model
    difference() {
        union() {
            hull() {
                // leg stop
                translate([0,ToeBracket_AxleOffset-bs/2+0.5,-tw/2])
                    rotate([0,0,-ToeAngleRef])
                    translate([-5,-tw,0])
                    roundedRect([w,tw,tw], tw/2);

                // thicken the axle
                cylinder(r=w/2, h=tw, center=true);

                // toe tip against floor
                translate([0,-ToeLength,-tw/2])
                    rotate([0,0,ToeAngleRef])
                    translate([-w/2,0,0])
                    roundedRect([w,tw,tw], tw/2);
            }

            // thicken string hole
            translate([0,-ToeLength+10,0])
                cylinder(r=w/2, h=tw, center=true);

        }

        // axle
        cylinder(r=3.5/2, h=100, center=true);

        // string hole
        translate([0,-ToeLength+10,0])
            cylinder(r=3/2, h=100, center=true);

    }
}
