
module ToeAssembly () {

    assembly("assemblies/Toe.scad", "Toe", str("ToeAssembly()")) {

    // base part
    ToeBracket_STL();

    // steps
    step(1, "Do something") {
            view(t=[0,0,0], r=[52,0,218], d=400);

            attach(ToeBracket_Con_Toe1, Toe_Con_Axle)
                  Toe_STL();

            attach(invertConnector(ToeBracket_Con_Toe2), Toe_Con_Axle)
                  Toe_STL();
        }

    if (!Collapse) {


        // string
        color("black")
            translate([0,-ToeBracket_Offset+5,0])
            rotate([0,90,0])
            cylinder(r=1, h=ToeBracket_Offset * 2 + 50, center=true);

    }



    }
}
