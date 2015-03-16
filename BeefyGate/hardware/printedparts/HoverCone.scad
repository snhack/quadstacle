// Connectors

HoverCone_Con_Beam = [[0,SwivelMount_Depth,0], [0,-1,0], 0,0,0];


module HoverCone_STL() {

    printedPart("printedparts/HoverCone.scad", "Hover Cone", "HoverCone_STL()") {

        view(t=[0,0,0],r=[72,0,130],d=400);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(HoverCone_Con_Beam);
        }

        color(Level3PlasticColor) {
            if (UseSTL) {
                import(str(STLPath, "HoverCone.stl"));
            } else {
                HoverCone_Model();
            }
        }
    }
}


module HoverCone_Model()
{
    w = bs + 2*tw;
    t = 3.2;
    d = SwivelMount_Depth;

    ir1 = 8/2;  // assume 8mm silicone tube
    h = 20;

    // model
    difference() {
        union() {

            // beam housing
            translate([-w/2, 0, -w/2])
                cube([w,d,w]);

            // cone
            translate([0,d-eta,w/2 + ir1])
                rotate([-90,0,0])
                conicalTube(or1=ir1+tw,ir1=ir1,or2=h+dw,ir2=h,h=h);

            // tube fitting
            translate([0,0,w/2 + ir1])
                rotate([-90,0,0])
                tube(ir1+tw, ir1, d, center=false);
        }

        // beam fixing
        translate([0, d/2, 0])
            rotate([0,90,0])
            cylinder(r=4/2, h=200, center=true);


        // beam - less slots
        difference() {
            translate([-bs/2,-eta,-bs/2])
                cube([bs,d+2*eta,bs]);

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
