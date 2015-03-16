
module MirrorHolderAssembly () {

    assembly("assemblies/MirrorHolder.scad", "Mirror Holder", str("MirrorHolderAssembly()")) {

    // base part
    MirrorHolder_STL();

    // steps
    step(1, "Hot glue the mirror tile onto the holder") {
            view(t=[0,0,0], r=[52,0,218], d=400);

            attach(MirrorHolder_Con_Mirror, DefConDown)
                  color("white")
                  translate([-MirrorWidth/2, -MirrorWidth/2, 0])
                  cube([MirrorWidth, MirrorWidth, MirrorThickness]);
        }



    }
}
