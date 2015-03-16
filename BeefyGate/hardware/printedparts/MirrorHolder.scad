// Connectors

MirrorHolder_Con_Beam = [[0,0,0], [0,1,0], 0,0,0];
MirrorHolder_Con_Mirror = [[0,bs/2+dw, bs/2 + dw], [0,0,-1], 0,0,0];    // centre of mirror


module MirrorHolder_STL() {

    printedPart("printedparts/MirrorHolder.scad", "Mirror Holder", "MirrorHolder_STL()") {

        view(t=[0,0,0],r=[72,0,130],d=400);

        if (DebugCoordinateFrames) frame();
        if (DebugConnectors) {
            connector(MirrorHolder_Con_Beam);
            connector(MirrorHolder_Con_Mirror);
        }

        color(Level3PlasticColor) {
            if (UseSTL) {
                import(str(STLPath, "MirrorHolder.stl"));
            } else {
                MirrorHolder_Model();
            }
        }
    }
}


module MirrorHolder_Model()
{
    // local vars

    w = bs + 2*dw;

    // model
    difference() {
        union() {

            // beam housing
            translate([-w/2, 0, -w/2])
                cube([w,w,w]);

            // ticken around mirror
            translate([-w/2, 0, w/2-eta])
                cube([w,w,MirrorThickness]);
        }

        // mirror
        translate([-MirrorWidth/2, -50, w/2])
            cube([MirrorWidth,100,100]);


        // beam fixing
        translate([0, w/2, 0])
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
