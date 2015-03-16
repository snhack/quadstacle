
// Connectors
SwivelMount_Con_Beam = [[0,0,0], [0,1,0], 0,0,0];
SwivelMount_Con_Axle = [[0,0,0],[1,0,0],0,0,0];


module SwivelMount_STL() {

    printedPart("printedparts/SwivelMount.scad", "Swivel Mount", "SwivelMount_STL()") {

        view(t=[0,0,0],r=[72,0,130],d=400);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(SwivelMount_Con_Beam);
            connector(SwivelMount_Con_Axle);

        }

        color(Level3PlasticColor) {
            if (UseSTL) {
                import(str(STLPath, "SwivelMount.stl"));
            } else {
                SwivelMount_Model();
            }
        }
    }
}


module SwivelMount_Model()
{
    w = bs + 2*dw;
    t = 3.2;
    d = SwivelMount_Depth;

    // model
    difference() {
        union() {

            // beam housing
            translate([-w/2, 0, -w/2])
                cube([w,d,w]);

            // bracket
            for (i=[0,1])
                mirror([i,0,0])
                translate([t/2, 0, 0])
                cube([dw, d, SwivelMount_AxleOffset + 3.5/2 + dw]);

        }

        // axle
        translate([0, d/2, SwivelMount_AxleOffset])
            rotate([0,90,0])
            cylinder(r=3.5/2, h=100, center=true);

        // beam fixing
        translate([0, d/2, 0])
            rotate([0,90,0])
            cylinder(r=4/2, h=200, center=true);


        // beam - less slots
        difference() {
            translate([-bs/2,-10,-bs/2])
                cube([bs,500,bs]);

            for (i=[0,1])
                mirror([i,0,0])
                translate([bs/2-1.5,-10,-5.5/2])
                    cube([5,500,5.5]);
        }

        // trim the back off
        translate([-50,-50,-100 - 4/2 - tw])
            cube([100,100,100]);
    }
}
