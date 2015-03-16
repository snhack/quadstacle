

Gate_Con_LeftLeg = [[0,bs/2,bs/2],[1,0,0],180,0,0];
Gate_Con_RightLeg = [[GantryWidth,bs/2,bs/2],[-1,0,0],0,0,0];


// Assembly
// --------

module GateAssembly () {

    assembly("assemblies/Gate.scad", "Final Assembly", str("GateAssembly()")) {

        // gantry beam

        color(Grey80)
            cube([GantryWidth, bs, bs]);

        // neopixel strip
        // carrier + strip


        // left leg
        attach(Gate_Con_LeftLeg, DefConFront)
            LeftLegAssembly(Collapse? 0 : LeftLegAngle, 0);


        // right leg
        attach(Gate_Con_RightLeg, DefConFront)
            RightLegAssembly(Collapse? 0 : RightLegAngle, 2*LegBracket1_AxleOffset);


        if (!Collapse) {
            // dummy hubsan
            translate([40,bs/2,-50])
                color([0,0,0,0.5])
                union() {
                    cube([70,1,30]);
                    translate([-30,0,15])
                        cube([130,1,15]);
                }

            // dummy hubsan 2
            translate([40,bs/2,-120])
                color([0,0,0,0.5])
                union() {
                    cube([70,1,30]);
                    translate([-30,0,15])
                        cube([130,1,15]);
                }



            // laser beam
            color([1,0,0,0.5])
                {
                    for (i=[0:3])
                        translate([0,bs/2,-i*2*LaserBeamSpacing]) {

                            // beam 1
                            translate([GantryWidth, 0, -35])
                                rotate([0,-LaserBeamAngle,0])
                                rotate([0,-90,0])
                                cylinder(r=1, h=GantryWidth);

                            // beam 2
                            translate([0, 0, -35 - LaserBeamSpacing])
                                rotate([0,LaserBeamAngle,0])
                                rotate([0,90,0])
                                cylinder(r=1, h=GantryWidth);

                        }


                }
        }


	}
}
