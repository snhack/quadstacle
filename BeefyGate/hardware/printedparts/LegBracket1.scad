// Connectors

LegBracket1_Con_Beam = [[0,0,0], [0,1,0], 0,0,0];
LegBracket1_Con_Axle = [[0, -LegBracket1_InnerWidth/2, -LegBracket1_AxleOffset], [1,0,0], 0,0,0];
LegBracket1_Con_Fixing = [[-LegBracket1_InnerWidth/2-tw/3, bs/2, 0], [1,0,0], 0,0,0];


module LegBracket1_STL() {

    printedPart("printedparts/LegBracket1.scad", "Leg Bracket 1", "LegBracket1_STL()") {

        view(t=[0,0,0],r=[72,0,130],d=400);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(LegBracket1_Con_Beam);
            connector(LegBracket1_Con_Axle);
            connector(LegBracket1_Con_Fixing);
        }

        color(Level3PlasticColor) {
            if (UseSTL) {
                import(str(STLPath, "LegBracket1.stl"));
            } else {
                LegBracket1_Model();
            }
        }
    }
}


module LegBracket1_Model()
{
    // local frame - beam centred on y+, base at y=0
    // bracket points down z-

    w = LegBracket1_InnerWidth;
    ow = LegBracket1_OuterWidth;
    ar = 3.5 + tw;

    // model
    difference() {
        union() {

            // beam housing
            translate([-w/2, -tw, -w/2])
                cube([w,w,w]);

            // arms
            for (i=[0,1])
                mirror([i,0,0]) {

                    *hull() {
                        translate([w/2-tw, w-tw, -w/2])
                            cube([tw,eta,w]);

                        translate([w/2-eta, -tw, -LegBracket1_AxleOffset])
                            cube([tw,tw,LegBracket1_AxleOffset + w/2]);
                    }

                    hull() {
                        translate([w/2-eta, -tw, -w/2])
                            cube([(ow-w)/2,w,w]);

                        translate([w/2-eta, -w/2, -LegBracket1_AxleOffset])
                            rotate([0,90,0])
                            cylinder(r=ar, h=tw);

                    }
                }


        }

        // beam fixing
        translate([0, bs/2, 0])
            rotate([0,90,0])
            cylinder(r=4/2, h=200, center=true);
        // CS
        for (i=[0,1])
            mirror([i,0,0])
            translate([w/2 + tw/3, bs/2, 0])
            rotate([0,90,0])
            cylinder(r=10/2, h=200);

        // axle
        translate([0, -w/2, -LegBracket1_AxleOffset])
            rotate([0,90,0])
            cylinder(r=3.5/2, h=200, center=true);




        // beam
        translate([-bs/2,-10,-bs/2])
            cube([bs,500,bs]);
    }

    // dummy beam
    *translate([-bs/2,0,-bs/2])
        cube([bs,500,bs]);
}
