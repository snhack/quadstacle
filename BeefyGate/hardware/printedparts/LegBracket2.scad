// Connectors

LegBracket2_Con_Beam = [[0,0,0], [0,1,0], 0,0,0];
LegBracket2_Con_Axle = [[0,LegBracket1_InnerWidth/2,0], [1,0,0], 0,0,0];
LegBracket2_Con_Fixing = [[0,LegBracket1_InnerWidth/2, LegBracket1_InnerWidth/2], [0,0,-1], 0,0,0];


module LegBracket2_STL() {

    printedPart("printedparts/LegBracket2.scad", "Leg Bracket 2", "LegBracket2_STL()") {

        view(t=[0,0,0],r=[72,0,130],d=400);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(LegBracket2_Con_Beam);
            connector(LegBracket2_Con_Axle);
            connector(LegBracket2_Con_Fixing);
        }

        color(Level3PlasticColor) {
            if (UseSTL) {
                import(str(STLPath, "LegBracket2.stl"));
            } else {
                LegBracket2_Model();
            }
        }
    }
}


module LegBracket2_Model()
{
    // local frame - beam centred on y+, base at y=0

    w = LegBracket1_InnerWidth;
    ow = LegBracket1_OuterWidth;

    // model
    difference() {
        union() {

            // beam housing
            translate([-w/2, 0, -w/2])
                cube([w,w,w]);

        }

        // beam fixing
        translate([0, w/2, 0])
            rotate([0,0,0])
            cylinder(r=4/2, h=200, center=true);


        // axle
        translate([0, w/2, 0])
            rotate([0,90,0])
            cylinder(r=3.5/2, h=200, center=true);

        // nut trap
        translate([0, w/2, 0])
            rotate([0,90,0])
            rotate([0,0,30])
            cylinder(r=6.5/2, h=bs - 4, center=true, $fn=6);


        // beam - less slots
        difference() {
            translate([-bs/2,-10,-bs/2])
                cube([bs,500,bs]);

            for (i=[0,1])
                mirror([i,0,0])
                translate([bs/2-5,-10,-5.5/2])
                    cube([5,500,5.5]);
        }

    }

}
