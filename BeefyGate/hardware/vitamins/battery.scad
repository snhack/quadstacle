
Battery_Length = 142;
Battery_Width = 50;
Battery_Height = 35;

Con_Battery_CenterBottom = [ [Battery_Width/2, Battery_Length/2, 0], [0, 0, -1], 0, 0, 0 ];


module battery()
{
	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_Battery_CenterBottom);
	}

	c = 2;

	color("blue")
		roundedRectX([Battery_Width, Battery_Length, Battery_Height], 5);

	// leads
	color("red")
		translate([Battery_Width-4,Battery_Length,Battery_Height/2])
		rotate([-90,0,0])
		cylinder(r=6/2, h=50);
}
