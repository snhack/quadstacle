
module LeftLegAssembly (legAng, legOffset) {

    assembly("assemblies/Legs.scad", "Leg", str("LeftLegAssembly()")) {

        // base part
        LegBracket1_STL();

        attach(rollConnector(LegBracket1_Con_Axle, legAng), LegBracket2_Con_Axle) {
            LegBracket2_STL();

            attach(offsetConnector(LegBracket2_Con_Beam, [0,-legOffset,0]), DefConUp) {
                color(Grey80)
                    translate([-bs/2,-bs/2,0])
                    cube([bs, bs, LegLength]);

                attach([[0, 0, LegLength-ToeBracket_Offset],[0,0,-1],0,0,0], ToeBracket_Con_Beam)
                    ToeAssembly();


                // mirrors
                for (i=[0:3])
                    if (i!=2)
                    attach([[0,0,82 + LaserBeamSpacing + i*2*LaserBeamSpacing],[0,0,1],180,0,0], MirrorHolder_Con_Beam)
                    MirrorHolderAssembly();
            }
        }

    }

}


module RightLegAssembly (legAng, legOffset) {

    assembly("assemblies/Legs.scad", "Leg", str("LeftLegAssembly()")) {

        // base part
        LegBracket1_STL();

        attach(rollConnector(LegBracket1_Con_Axle, legAng), LegBracket2_Con_Axle) {
            LegBracket2_STL();

            attach(offsetConnector(LegBracket2_Con_Beam, [0,-legOffset,0]), DefConUp) {
                color(Grey80)
                    translate([-bs/2,-bs/2,0])
                    cube([bs, bs, LegLength]);

                attach([[0, 0, LegLength-ToeBracket_Offset],[0,0,-1],0,0,0], ToeBracket_Con_Beam)
                    ToeAssembly();


                // hover cone
                attach([[0,0,0],[0,0,1],90,0,0], HoverCone_Con_Beam)
                    HoverCone_STL();


                // swivel mounts
                attach([[0,0,100],[0,0,1],0,0,0], SwivelMount_Con_Beam)
                    SwivelMount_STL();

                attach([[0,0,LegLength-20],[0,0,1],0,0,0], SwivelMount_Con_Beam)
                    SwivelMount_STL();

                // mirrors
                for (i=[0:2])
                    attach([[0,0,82 + 2*LaserBeamSpacing + i*2*LaserBeamSpacing],[0,0,1],0,0,0], MirrorHolder_Con_Beam)
                    MirrorHolderAssembly();
            }
        }

    }

}
