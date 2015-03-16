// Connectors

ToeBracket_Con_Beam = [[0,0,0], [0,1,0], 0,0,0];
ToeBracket_Con_Fixing = [[0,LegBracket1_InnerWidth/2, LegBracket1_InnerWidth/2], [0,0,-1], 0,0,0];
ToeBracket_Con_Toe1 = [[-ToeBracket_AxleOffset,3.5+tw,0], [0,0,-1], Collapse?0:ToeAngle,0,0];
ToeBracket_Con_Toe2 = [[ToeBracket_AxleOffset,3.5+tw,0], [0,0,-1], Collapse?0:ToeAngle,0,0];


module ToeBracket_STL() {

    printedPart("printedparts/ToeBracket.scad", "Toe Bracket", "ToeBracket_STL()") {

        view(t=[0,0,0],r=[72,0,130],d=400);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(ToeBracket_Con_Beam);
            connector(ToeBracket_Con_Fixing);
            connector(ToeBracket_Con_Toe1);
            connector(ToeBracket_Con_Toe2);
        }

        color(Level3PlasticColor) {
            if (UseSTL) {
                import(str(STLPath, "ToeBracket.stl"));
            } else {
                ToeBracket_Model();
            }
        }
    }
}


module ToeBracket_Model()
{
    // local vars

    w = LegBracket1_InnerWidth;
    ow = LegBracket1_OuterWidth;
    ar = 3.5 + tw;

    // model
    difference() {
        union() {

            // beam housing
            translate([-w/2, 0, -w/2])
                cube([w,w,w]);

            // wings
            for (x=[0,1], z=[0,1])
                mirror([x,0,0])
                mirror([0,0,z])
                hull() {

                    translate([ToeBracket_AxleOffset, ar, tw/2+layers])
                        cylinder(r=ar, h=tw);

                    translate([w/2,0,tw/2 + layers])
                        cube([1,w,tw]);

                }

        }

        // beam fixing
        translate([0, w/2, 0])
            rotate([0,0,0])
            cylinder(r=4/2, h=200, center=true);


        // beam
        translate([-bs/2,-10,-bs/2])
            cube([bs,500,bs]);


        // axles
        for (x=[0,1])
            mirror([x,0,0])
            translate([ToeBracket_AxleOffset, ar, 0])
                cylinder(r=3.5/2, h=200, center=true);


    }
}
