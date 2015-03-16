//
// Machine
//

// Coding-style
// ------------
//
// Global variables are written in UpperCamelCase.
// A logical hierarchy should be indicated using underscores, for example:
//     StepperMotor_Connections_Axle
//
// Global short-hand references should be kept to a minimum to avoid name-collisions


// Global Settings for Printed Parts
//

DefaultWall 	= 4*perim;
ThickWall 		= 8*perim;

// short-hand
dw 				= DefaultWall;
tw 				= ThickWall;


// Global design parameters

BeamSize = 20 + 0.5;  // assume square, inc print tolerance
bs = BeamSize;  // shortcut

MirrorWidth = 20 + 0.5;  // assume square, inc print tolerance
MirrorThickness = 2;

Collapse = false;

GantryWidth = 400;   // length of beam

LegLength = 400;  // of beam

FootLength = 100;  // of beam


LeftLegAngle = -270;  // 0 = closed, -270 = open
RightLegAngle = -90;  // 0 = closed, -90 = open


LegBracket1_InnerWidth = bs + 2*tw;
LegBracket1_OuterWidth = bs + 4*tw;
LegBracket1_AxleOffset = 35;  // z dist between beam centreline and axle


ToeLength = 180;
ToeAngleRef = 45;
ToeAngle = 45;

ToeBracket_AxleOffset = 25;
ToeBracket_Offset = ToeLength*cos(ToeAngleRef) - bs/2 + 2;  //  offset from base of leg to beam connector


SwivelMount_Depth = 4+2*dw;
SwivelMount_AxleOffset = 20;


LaserBeamAngle = 5;  // from horizontal
LaserBeamSpacing = GantryWidth*sin(LaserBeamAngle);
