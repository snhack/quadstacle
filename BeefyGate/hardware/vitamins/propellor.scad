
Propellor_10inch = [10*25.4];
Propellor_12inch = [12*25.4];

Con_Propellor = DefCon;

module propellor(t=Propellor_10inch)
{
	if (DebugCoordinateFrames)  frame();

	if (DebugConnectors) {
		connector(Con_Propellor);
	}

	d = t[0];

	// Hub
	color(Grey20) {
		linear_extrude(8)
		difference() {
			circle(r=15/2);
			circle(r=6/2);
		}

		// Blades
		blade(d);
		rotate(a=180, v=[0,0,1])
			blade(d);
	}
}

module blade(d)
{
	translate([0,0,3])
	rotate(v=[1,0,0], a=25)
	linear_extrude(1)
	difference() {
		hull() {
			circle(r=11/2);

			// End
			translate([d/2 - 3,0,0])
				circle(r=13/2);

			translate([26,0,0])
				circle(r=23/2);

			// Center
			translate([d/4,0,0])
				circle(r=30/2);
		}

		circle(r=8/2);
	}
}
