//render() rneders [F6], and stores the mesh for faster recall
//stuff for the modules///////////////////////////////////////////////////////////
radius = 4*(58.577+180);//200
theta = 8.6-6.5;//6.685

BCD = 5.1;//size for the bullet connector TBD, this makes it easy to change
/*==============================================================================
module creation date will be of the form: {dd Month, YYYY}
	*Any modules without dating, assume to be created before {2 June, 2018}

NOTES:
There will need to be an attachnemt point at the center of (or multiple places on) the board, to reduce flex and/or rattling. *Added 2 June 2018


/*/////////////////////////////////////////////////////////////////////////////////

//for(i = [-1.5:1:1.5]) translate([i*50, 3, 84.5]) rotate([0, 0, 90]) M4(len = 10, depth = 1.2);
//for(i = [-1.5:1:1.5]) translate([i*50, 3, -84.5]) rotate([0, 180, 90]) M4(len = 10, depth = 1.2);

//deck(H = 400, G = false, F = true);//406mm is the max height we have to work with.

//*
//translate([0, 0, 0])  shell();
//translate([0, -10, 0]) shellCover();
//*/
//separatorRib(75);
//innerds(D = 0);
//*
S = 73;//sepperation of the packs, 72mm is the min S
O = 5;//Upper and Lower Offset
/*
translate([-61, 0, 0]) rotate([0, 0, 3.4]) for(j = [-1.5:1.5]) {
	//if(j == 0)translate([0, 0, j*S]) {
	//	shell();
	// 	shellCover();
	//}
	if(j > 0) translate([0, 0, (j*S)+O]){
	 	shell();
		shellCover();
		echo(j, (j*S)+O);//print the position of the (center of) battery back
	}
	if(j < 0) translate([0, 0, (j*S)-O]){
		shell();
		shellCover();
		echo(j, (j*S)-O);//print the position of the (center of) battery back
	}

	//if(j == 0){
	//		color("gray") translate([-0.125, 0, ((S+O)/2)*j]) CenterHangars();
	//}
	color("gray") translate([-0.125, 0, 0]) CenterHangars();

	color("gray") rotate([0, 0 ,0]) translate([0, 0, ((2.5*S)-16)]) rotate([0, 0, 0]) EndHangars(place = 0);
	color("gray") rotate([0, 0 ,0]) translate([0, 0, -((2.5*S)-16)]) rotate([0, 0, 0]) EndHangars(place = 1);
}//*/

//CenterHangars();
//EndHangars(palce = 0);
//EndHangarsHoles(palce = 0);
powerSwitchHousing();
//pwrSW();

//#translate([0, -28+9, 9]) mirror([0, 1, 0]) polygon([[-95,6.2],[-80,4.08],[-65,1.75],[-50,0.09],[50,0.09],[65,1.75],[80,4.08],[95,6.2]]);

//rr = 151.491*3.55;

//color("blue") translate([0, -(rr)-19+2.1, 6]) scale([1, 1, 1]) cylinder(r = rr, h = 1, $fn = 128);


//translate([61, 0, 0]) rotate([0, 180, -3.4]) for(j = [-2:2]) translate([0, 0, j*S]) shell();
//translate([61, 0, 0]) rotate([0, 180, -3.4]) for(j = [-2:2]) translate([0, 0, j*S]) shellCover();
//*/
//translate([0, 0, 0]) shell();
//translate([0, 0, 0]) shellCover();

//%innerds(D = 2, Bl = 0, W = true, F = true);
/*
translate([-61, 0, 0]) rotate([0, 0, 3.4]) Pack();
translate([61, 0, 0]) rotate([0, 180, -3.4]) Pack();

translate([0, 0, -225]) rotate([90, 180, 0]) ESC_cutOut();
//*/

/*
translate([0, 0, 0]){
	intersection(){
	//difference(){
		control(false);
		translate([0, 19, 48]) cube([70, 50, 100], center = true);
	}
}//*/
/* Special inserts for knurled brass inserts (a bit after the fact, I had 10 shells printed already)
difference(){
	cylinder(d = 9, h = 5, center = true, $fn = 64);
	cylinder(d = 5.5, h = 6, center = true, $fn = 32);
}//*/
//MODULES
//////////////////////////////////////////////////////////////////////////////////

module Pack(){
	for(j = [-2:2]) translate([0, 0, j*74]){
		for(i = [-0.5:0.5]) translate([0, 0, 33*i]) rotate([0, 90, 0]) color("Cyan") cylinder(d = 32, h = 70, center = true);
		translate([35+(BCD/2), -12, 16.5]) rotate([90, 0, 0]) color("red") cylinder(d = BCD, h = 24, center = true, $fn = 16);//positive terminal
		translate([35+(BCD/2), -12, -16.5]) rotate([90, 0, 0]) color("black") cylinder(d = BCD, h = 24, center = true, $fn = 16);//negitive terminal
	}

	color("gray") translate([0, 21.5, 0]) cube([52, 4.25, 400], center = true);//aluminum extrusion


	for(i = [-2:2]) translate([0, 0, i*74]){
		translate([20, 20, 0]) rotate([90, 0, 0]) M5(10, 0, 0);
		translate([-20, 20, 0]) rotate([90, 0, 0]) M5(10, 0, 0);
	}
}

module shell(){
	//main shell for holding the 32650 (32700) LiFePo4 cells
	pPos = 17.0625;//connector position, 17.0625
	difference(){//main shell
		translate([-1, 0, 0]) cube([77, 36, 72], center = true);//main object
		innerds(D = 2, Bl = 0, W = true, F = true);//the shape of the stuff going inside

		color("silver") translate([35, -12, 0]) rotate([0, 90, 0]) M3(5, 0);//cover attachment screw
		color("silver") translate([-37, -12, 0]) rotate([0, -90, 0]) M3(5, 0);//cover attachment screw

		translate([0, 18.5, 36]) rotate([180, 90, 0]) angle(height = 80, size = 14);//angled bits at the side
		translate([0, 18.5, -36]) rotate([180, 90, 0]) angle(height = 80, size = 14);//angled bits at the side

		translate([33.5, 18.5, 0]) rotate([180, 90, 0]) angle(height = 13, size = 14);//angled bits at the center
		translate([-33.5, 18.5, 0]) rotate([180, 90, 0]) angle(height = 13, size = 14);//angled bits at the center

		translate([36.5+(BCD/2), -17, pPos]) rotate([0, 90, 0]) elipse(D = BCD, H = 8, L = 10, FN = 24);
		translate([36.5+(BCD/2), -17, -pPos]) rotate([0, 90, 0]) elipse(D = BCD, H = 8, L = 10, FN = 24);
	}

	difference(){//positive terminal
		color("brown") translate([35+(BCD/2), -6, pPos]) rotate([90, 0, 0]) cylinder(d = BCD+5, h = 24, center = true, $fn = 36);
		color("brown") translate([35+(BCD/2), -10, pPos]) rotate([90, 0, 0]){
			cylinder(d = BCD, h = 24, center = true, $fn = 36);
			translate([-5, 0, 0]) cube([10, BCD, 24], center = true);
			translate([1.5, 0, 7]) rotate([90, 0, 90]) elipse(D = BCD, H = 8, L = 10, FN = 24);//wire allowence
		}
		translate([34, -1, 0]) cube([5, 36, 60], center = true);//cube to avoid trouble
		color("brown") translate([35+5+(BCD/2), -6-12, pPos]) cylinder(d = BCD+5, h = 24, center = true, $fn = 36);
	}
	difference(){//lower cone, to make thinks easier to print
		color("brown") translate([35+(BCD/2), 10.5, pPos]) rotate([90, 0, 0]) cylinder(d = 0, d2 = BCD+5, h = 9, center = true, $fn = 36);
		translate([34, -1, 0]) cube([5, 36, 60], center = true);//cube to avoid trouble
	}

	difference(){//negitive terminal
		color("white") translate([35+(BCD/2), -6, -pPos]) rotate([90, 0, 0]) cylinder(d = BCD+5, h = 24, center = true, $fn = 36);
		color("white") translate([35+(BCD/2), -10, -pPos]) rotate([90, 0, 0]){
			cylinder(d = BCD, h = 24, center = true, $fn = 36);
			translate([-5, 0, 0]) cube([10, BCD, 24], center = true);

			translate([1.5, 0, 7]) rotate([90, 0, 90]) elipse(D = BCD, H = 8, L = 10, FN = 24);//wire allowence
		}
		translate([34, -1, 0]) cube([5, 36, 60], center = true);//cube to avoid trouble
		color("white") translate([35+5+(BCD/2), -6-12, -pPos]) cylinder(d = BCD+5, h = 24, center = true, $fn = 36);
	}
	difference(){
		color("white") translate([35+(BCD/2), 10.5, -pPos]) rotate([90, 0, 0]) cylinder(d = 0, d2 = BCD+5, h = 9, center = true, $fn = 36);
		translate([34, -1, 0]) cube([5, 36, 60], center = true);//cube to avoid trouble
	}

	//color("silver") translate([0, 21.706, 0]) cube([52, 4.25, 90], center = true);//2"x1/8" aluminum bar
}

module shellCover(){
	//cover for the main shell, presses up against the deck
	difference(){
		union(){//main body, makes up the main shape of the cover.
			color("Cyan") translate([-1.0, -23, 0]) cube([71.75, 10, 72], center = true);//main cover, the part that is up against the deck

			difference(){
				translate([-1.0, -13, 0]) cube([71.75, 10, 68], center = true);//cutout to get the parts in the shell

				rotate([180, 0, 0]) innerds(D = 0, Bl = 12, F = false, W = false);//the shape of the stuff going inside

				color("silver") translate([35, -12, 0]) rotate([0, 90, 0]) M3(15, 0);//cover attachment screw
				color("silver") translate([-35, -12, 0]) rotate([0, -90, 0]) M3(15, 0);//cover attachment screw
			}
		}

		translate([61, -3.65, 0]) rotate([0, 0, -3.4]) deck(H = 80, F = false, G = false);

		//Battery Managment Connector                           LOOK! COLORS!!! (below)
		translate([28, -19.42, 0]) rotate([0, 0, -3.4]) color([128/255, 128/255, 128/255]) cube([14, 2.62, 8], center = true);//JST connector location, glue or tape it in...
		translate([19.75, -13, 0]) cube([2.6, 15, 8], center = true);//passthrough for the wires
		translate([21.2, -8, 0]) rotate([0, 0, 45]) cube([4, 2.6, 7.8], center = true);//pertify the passthrough

		//wire notches
		sizes = [5, 36, 40];

		intersection(){
			translate([33.9, 0, 34.125/2]) rotate([0, 90, 0]) cylinder(d = 35, h = 2, center = true, $fn = 64);
			translate([34, 0, 0]) cube(sizes, center =true);
		}
		intersection(){
			translate([33.9, 0, -34.125/2]) rotate([0, 90, 0]) cylinder(d = 35, h = 2, center = true, $fn = 64);
			translate([34, 0, 0]) cube(sizes, center =true);
		}
		translate([27.5, -8.25, 2.8]) rotate([58.5, 0, 0]) cube([12, 2, 2], center = true);
		translate([27.5, -8.25, -2.8]) rotate([-58.5, 0, 0]) cube([12, 2, 2], center = true);
	}
}

module powerSwitchHousing(){
	ConHeight = 12.25+25;
	conD = 5.1;
	difference(){
		//translate([0, -5, 0]) cube([40, 35, 20], center = true);
		translate([0, 0, 0]) union() intersection(){
			rotate([90, 0, 0]) linear_extrude(height = 35, center = true)//X,Z profile
				polygon([[-30,-9],[-31,-8],[-31,-1],[-30,0],[-25,0],[-24,1],[-18,8.5],[-17,9],
								[17,9],[18,8.5],[24,1],[25,0],[30,0],[31,-1],[31,-8],[30,-9]]);

		  linear_extrude(height=25, center = true)//X,Y profile
				polygon([[-30,-17.5],[-31,-16.5],[-31,-1],[-30,0],[-25,0],[-24,1],[-18,16.5],[-17,17.5],
								[17,17.5],[18,16.5],[24,1],[25,0],[30,0],[31,-1],[31,-16.5],[30,-17.5]]);

		}
		translate([0, 1-2.5+5-0.05, 0]) rotate([0, 0, 0]) pwrSW();
		translate([(-conD/2)+9.3, -16.5, 0]) rotate([90, 0, 0]){
			for(i = [-0.5:0.5]) translate([0, BCD*i, 0]) cylinder(d = conD, h = ConHeight, $fn = 36, center = true);
			cube([conD, conD, ConHeight], center = true);
		}
		translate([(-conD/2)-0.425, -3.5, 0]) rotate([90, 0, 0]) cylinder(d = conD, h=ConHeight, center=true, $fn = 24);
		#for(i = [-0.5:0.5]) translate([i*50, -8.75, -10]) rotate([0, 0, 0]) M5(length = 20, depth = 10, offset = 0.15);//fastners

	}
}

//!CenterHangars();
module CenterHangars(){
	//Hangars to support the center of the board, {2 June 2018}
	difference(){
		translate([0, -2.5, 0]) cube([55, 41, 9], center = true);//main body
		translate([61, -3.65, 0]) rotate([0, 0, -3.4]) deck(H = 80, F = true, G = false);//Deck Shape

		translate() scale([1.5, 0.9, 1]) cylinder(d = 25, h = 10, center = true, $fn = 512); // inner cutout

		difference(){//outer shaping
			translate([0, 9.5-6, 0]) cube([56, 30, 10], center = true);
			scale([1.3, 0.9, 1]) cylinder(d = 42, h = 11, center = true, $fn = 512);
			translate([0, -10.5, 0]) difference(){
				di = 4;
				len = 52.35;
				cube([len, di, 11], center = true);
				translate([0, 1, 0]) for(i = [-1:0]) rotate([0, 0, 180*i]) translate([len/2, 0, 0]) cylinder(d = di, h = 12, center = true, $fn = 128);
			}
		}

		translate([0, 16.675, 0]) rotate([-90, 0, 0]) cylinder(d = 5.5, h = 16, $fn = 36, center = true);//knurled insert goes here
		translate([20, -18, 0]) rotate([90, 0, 0]) M5(25, 10, 0.05);//Fastner, Deck side
		translate([-20, -18, 0]) rotate([90, 0, 0]) M5(25, 10, 0.05);//Fastner, Deck side
	}
	difference(){
		//lip for the knurled insert
		translate([0, 16, 0]) rotate([-90, 0, 0]) cylinder(d = 6, h = 2);
		translate([0, 16, 0]) rotate([-90, 0, 0]) cylinder(d = 5, h = 5, $fn = 36, center = true);
	}
}

//!EndHangars();
module EndHangars(place){
	//Hangars to connect the ends of the aluminum to the board, {13 June, 2018}
	// 'place' determines if a z-flip is happening, because you need one for each end of the pack.
	difference(){
		cylDiam = 5;
		minkowski(){
			difference(){
				translate([0, -2.5, 0]) cube([55-cylDiam, 41, 30-cylDiam], center = true);//main body

				mirror([0, 0, place]) translate([0, 0, 20]) rotate([-20, 0, 0]) cube([50, 50, 20], center = true);
			}
			rotate([90, 0, 0]) cylinder(d = cylDiam, h = 1, $fn = 6);
		}

		translate([61, -3.65, 0]) rotate([0, 0, -3.4]) deck(H = 80, F = true, G = false);//Deck Shape, with furrows

		mirror([0, 0, place]){
			translate([18, 16.675, -8]) rotate([-90, 0, 0]) cylinder(d = 5.5, h = 25, center = true, $fn = 36);//Brass insert, Rail side
			translate([0, 16.675, -3]) rotate([-90, 0, 0]) cylinder(d = 5.5, h = 25, center = true, $fn = 36);//Brass insert, Rail side
			translate([-18, 16.675, -8]) rotate([-90, 0, 0]) cylinder(d = 5.5, h = 25, center = true, $fn = 36);//Brass insert, Rail side
		}

		LVP = 8;//verticle position (Z) for the Deck side mounting holes

		mirror([0, 0, place]){
			translate([20, -18, -LVP]) rotate([90, 0, 0]) cylinder(d = 5.5, h = 25, center = true, $fn = 36);//+Z Brass insert, Deck side
			translate([-20, -18, -LVP]) rotate([90, 0, 0]) cylinder(d = 5.5, h = 25, center = true, $fn = 36);//+Z Brass insert, Deck side
			translate([20, -19, LVP]) rotate([-90, 0, 0]) M5(20, 25, 0.05);//-Z Fastner, Deck side
			translate([-20, -19, LVP]) rotate([-90, 0, 0]) M5(20, 25, 0.05);//-Z Fastner, Deck side
		}
	}
	//translate([0, 0, 4.9718]) color("red") cube(20);//
}

module EndHangarsHoles(){
	//Hangars to connect the ends of the aluminum to the board, {13 June, 2018}
	// 'place' determines if a z-flip is happening, because you need one for each end of the pack.
	difference(){
		cylDiam = 5;
		minkowski(){
			difference(){
				translate([0, -13, 0]) cube([55-cylDiam, 20, 30-cylDiam], center = true);//main body
				//translate([0, 0, 20]) rotate([-20, 0, 0]) cube([50, 50, 20], center = true);
			}
			rotate([90, 0, 0]) cylinder(d = cylDiam, h = 1, $fn = 6);
		}

		translate([61, -3.65, 0]) rotate([0, 0, -3.4]) deck(H = 80, F = true, G = false);//Deck Shape, with furrows


		LVP = 8;//verticle position (Z) for the Deck side mounting holes

		translate([20, -19, -LVP]) rotate([-90, 0, 0]) M5(20, 25, 0.05);//-Z Fastner, Deck side
		translate([-20, -19, -LVP]) rotate([-90, 0, 0]) M5(20, 25, 0.05);//-Z Fastner, Deck side
		translate([20, -19, LVP]) rotate([-90, 0, 0]) M5(20, 25, 0.05);//-Z Fastner, Deck side
		translate([-20, -19, LVP]) rotate([-90, 0, 0]) M5(20, 25, 0.05);//-Z Fastner, Deck side
	}
	//translate([0, 0, 4.9718]) color("red") cube(20);//
}

//DeckFastnerHoleTemplate();
module DeckFastnerHoleTemplate(){
	//Template for drilling the holes {12 June, 2018}
	difference(){
		translate([0, -2.5, 0]) cube([55, 41, 8], center = true);//main body
		translate([61, -3.65, 0]) rotate([0, 0, -3.4]) deck(H = 80, F = true, G = false);//Deck Shape, with grooves

		translate([0, 10, 0]) cube([56, 20, 9], center = true);//rather than re-calculating the positions, just cut it.

		translate([20, -18, 0]) rotate([90, 0, 0]) cylinder(d = 5.1, h = 36, center = true, $fn = 36);//Fastner, Deck side
		translate([-20, -18, 0]) rotate([90, 0, 0]) cylinder(d = 5.1, h = 36, center = true, $fn = 36);//Fastner, Deck side

		for(i = [-1:2:1]) translate([27.75*i, 0, 0]) rotate([90, 0, 0]) cylinder(d = 2.5, h = 50, center = true, $fn = 6);
	}
}

module innerds(D, Bl, F, W){ //this is the accounting for the objects that will be in the final pack, to make space
	pPos = -17.0625;
		for(i = [-0.5:0.5]) translate([-1, 0, 34.125*i]) rotate([0, 90, 0]) cylinder(d = 33, h = 72+Bl, center = true);//32650 cells

		translate([-1, -5.5-(D/2), 0]) cube([72, 22+D, 2*34.125], center = true);//cutout to get the parts in the shell

		if(W == true) translate([35+(BCD/2), -10, pPos]) rotate([90, 0, 0]) color("red"){ //BulletConnector (red)
			cylinder(d = BCD, h = 24, center = true, $fn = 36);//positive terminal
			translate([-5, 0, 0]) cube([10, BCD, 24], center = true);
		}

		if(W == true) translate([35+(BCD/2), -10, -pPos]) rotate([90, 0, 0]) color("black"){ //BulletConnector (black)
			cylinder(d = BCD, h = 24, center = true, $fn = 36);//negitive terminal
			translate([-5, 0, 0]) cube([10, BCD, 24], center = true);
		}

		if(F == true){
			#translate([20, 20, 0]) rotate([90, 0, 0]) M5(length = 10, depth = 10, offset = 0);//fastners
			translate([-20, 20, 0]) rotate([90, 0, 0]) M5(length = 10, depth = 10, offset = 0);
		}
}

module control(mock){
	difference(){//crossbrace
		minkowski(){
			difference(){//any alterations to the shape of the block happen in here
				translate([0, 5.5, 47.5]) cube([45, 35.5-4, 95-8], center = true);//main body
				translate([0, 0, -10]) rotate([-60, 0, 0]) cube([50, 25, 75], center = true);//-30 degree champfer
				translate([0, 0, 105]) rotate([65, 0, 0]) cube([50, 25, 75], center = true);//-30 degree champfer
			}
			sphere(d = 8, $fn = 24);//this is the diameter of the bevels, it also adds the diameter to the sides of the primary cube
		}
		translate([0, -16.25, 50]) cube([60, 8, 100], center = true);
		translate([15, -8, 6.5]) rotate([-90, 0, 0]) color("red") M5(16, 20, 0.5);//Fastners to attach it to the aluminum
		translate([-15, -8, 6.5]) rotate([-90, 0, 0]) color("red") M5(16, 20, 0.5);
		translate([0, -8, 89]) rotate([-90, 0, 0]) color("red") M5(16, 20, 0.5);
		color("green") translate([0, 2.25-1.78, 25+5]) rotate([-90, 0, 180]) ESC_cutOut();//ESC shape
		translate([0, 15, 55+11.75-6]) cube([25, 13, 40], center = true);//RC reciever shape/recess
	}

	if(mock == true){
		color("gray") translate([0, 2.25-1.78, 25+5]) rotate([-90, 0, 180]) ESC();
	}
}

module control_cover(){
	difference(){
		intersection(){
			translate([0, 50, 0]) cylinder(d = 86.3, h = 300, center = true, $fn = 120);
			translate([0, 15, 36.25]) cube([62.75, 16, 97.5], center = true);
		}
		color("green") translate([0, 3.8, 25]) rotate([-90, 0, 180]) ESC_cutOut();
		//translate([0, 0, 70]) cube([60, 60, 40], center = true);

		translate([0, 15, 55]) cube([25, 13, 40], center = true);
		translate([0, 17.5, 55]) cube([25, 8, 40], center = true);

		translate([0, 8, 81]) rotate([-90, 90, 0]) M3(15, 10, 8);
		translate([12, 8, -8]) rotate([-90, -90, 0]) M3(15, 10, 8);
		translate([-12, 8, -8]) rotate([-90, -90, 0]) M3(15, 10, 8);
	}
}

module chargePort(D){
	//barrel connector for V input
	translate([0, 0, -D/2]) rotate([0, 180, 0]) cylinder(d = 12.5, h = D, center = true, $fn = 32);//base
	translate([0, 6.25, -((D)/2)]) cube([5.2, 1, 16], center = true);//nock
	translate([0, 0, 3]) cylinder(d = 12.5, h = 2+D, $fn = 6);//nut
	cylinder(d = 8.25, h = 5.5, $fn = 32);//threadded shaft
}

module ESC(){
	difference(){
		translate([0, 0, 6.35]) cube([33.5, 36.75, 12.75], center = true);
		translate([13.75, 0, 9.75]) rotate([90, 0, 0]) corner(3, 37, 32);
		translate([-13.75, 0, 9.75]) rotate([90, 0, 180]) corner(3, 37, 32);
	}
	translate([0, -1, -4.75]) cube([33.5, 36.75, 9.5], center = true);
	translate([0, -4.625, -3.25/2]) cube([33.5, 36.75+7.25, 9], center = true);
	translate([5.375, -34.125, 1]) rotate([90, 0, 0]) cylinder(d = 10.75, h = 35, center = true, $fn = 32);//Capacater
	translate([-5.375, -34.125, 1]) rotate([90, 0, 0]) cylinder(d = 10.75, h = 35, center = true, $fn = 32);
	translate([0, -34.125, 1]) cube([10.75, 35, 10.75], center = true);
	translate([13.75, -34.125, 2.75]) rotate([90, 0, 0]) cylinder(d = 6, h = 55, center = true, $fn = 32);//power wires
	translate([-13.75, -34.125, 2.75]) rotate([90, 0, 0]) cylinder(d = 6, h = 55, center = true, $fn = 32);
	translate([0, -34.125, -5]) cube([6, 35, 2.25], center = true);//control wires
	translate([0, 15, 5.5]) rotate([-90, 0, 0]) cylinder(d = 12, h = 32, $fn = 64);//motor wires
}

module ESC_cutOut(){
	difference(){
		translate([0, 0, 6.35]) cube([33.5, 36.75, 12.75], center = true);
		translate([13.75, 0, 9.75]) rotate([90, 0, 0]) corner(3, 37, 32);
		translate([-13.75, 0, 9.75]) rotate([90, 0, 180]) corner(3, 37, 32);
	}
	translate([0, -1, -4.75]) cube([33.5, 38.75, 9.5], center = true);
	translate([0, -4.625, -3.25/2]) cube([33.5, 36.75+7.25, 9], center = true);
	translate([5.375, -34.125, 1+3.5]) rotate([90, 0, 0]) cylinder(d = 10.75, h = 35, center = true, $fn = 32);//Capacater
	translate([-5.375, -34.125, 1+3.5]) rotate([90, 0, 0]) cylinder(d = 10.75, h = 35, center = true, $fn = 32);
	translate([0, -34.125, 1+3.5]) cube([10.75, 35, 10.75], center = true);
	translate([0, -34.125, -8+3.5]) cube([10.75*3, 35, 20], center = true);
	translate([13.75, -34.125, 2.75+3.5]) rotate([90, 0, 0]) cylinder(d = 6.75, h = 65, center = true, $fn = 32);//power wires
	translate([-13.75, -34.125, 2.75+3.5]) rotate([90, 0, 0]) cylinder(d = 6.75, h = 65, center = true, $fn = 32);
	translate([13.75, -34.125, 2.75-10+3.5]) rotate([90, 0, 0]) cube([6, 20, 35], center = true);
	translate([-13.75, -34.125, 2.75-10+3.5]) rotate([90, 0, 0]) cube([6, 20, 35], center = true);
	translate([0, -34.125, -5]) cube([6, 35, 2.25], center = true);//control wires
	translate([0, 15, 4.5]) rotate([-90, 0, 0]) cylinder(d = 15, h = 32, $fn = 64);//motor wires
	//translate([0, 25, 4.5+7.5]) cube([15, 32, 15], center = true);
}

module deck(H, G, F){
	color("orange") difference(){
		intersection(){
			translate([0, -28, 0]) cube([196, 18, H], center = true);
			translate([0, -537.79305-19+2.1, 0]) scale([1.01, 1, 1]) cylinder(r = 537.79305, h = H+1, $fn = 512, center = true);//Cylinder, whose radius approximates the deck curvature.
		}
		//translate([73.125, -12.75, 0]) rotate([0, 0, -6.8]) cube([58, 18, 965.5], center = true);//slope things to make the deck look like the real thing (not very accurate)
		//translate([-73.125, -12.75, 0]) rotate([0, 0, 6.8]) cube([58, 18, 965.5], center = true);

		if(F==true){//furrows running the length of the deck
			translate([61, -18, 0]) scale([1, 0.87, 1]) cylinder(d = 23, h = H+1, center = true, $fn = 64);//furrows running the length of the usable deck, scaled to mach teh curvature of the actual
			translate([-61, -18, 0]) scale([1, 0.87, 1])cylinder(d = 23, h = H+1, center = true, $fn = 64);
		}
	}
	//color("gray") translate([0, 21.5, 0]) cube([52, 4.25, H], center = true);//tranlate of y = -20 origianl

	%if(G == true){
		translate([0, 74, 0]) cube([200, 2, H+10], center = true);
	}
}

module ribs(h, s){//this is the placement of the objects, determined by radius and angle (theta parameter).
	for(i=[-1.5:1.5]) for(j=[0:1]) for(k=[-.5,.5]){
		translate([0, -radius, 85*k]) rotate([0, 0, i*theta]) translate([0, radius-.125, 0]) rotate([0, 0, 180*j]) color("gray") separatorRib(70);
		if(s == true){
			translate([0, -radius, 85*k]) rotate([0, 0, i*theta]) translate([0, radius-.125, 0]) rotate([0, 0, 180*j]) cylinder(d = 10, h = h, center = true);
		}
	}
}

module separatorRib(H){//this is the shape of the separator ribs to go between the cells and reinforce the pack shell.
	difference(){
		linear_extrude(height = H, center = true) polygon([[0,-15],[4,-15],[6,-10],[2.5,-2.5],[0,-1],[-2.5,-2.5],[-6,-10],[-4,-15]]);
		for(i = [0:1]) rotate([0, 0, 360*(i/2)]) translate([sin(theta/2)*radius, 0, 0]) cylinder(d = 32.2, h = H+1, center =true, $fn = 256);
		//translate([-17.31, 0, 0]) cylinder(d = 32.4, h = H+1, center =true, $fn = 256);
	}
}

module angle(height, size){//triangle with 30 degree sides
	linear_extrude(height = height, center = true) polygon([[-0.5*size,0],[0.5*size,0],[0,(sqrt(3)/2)*size]]);
}

module bracket(){
	difference(){
		cube([15, 8, 30], center = true);
		rotate([90, 0, 0]) cylinder(d = 5.4, h = 10, center = true, $fn = 36);
	}
}

module elipse(D, H, L, FN){
	translate([0, (L/2)-(D/2), 0]) cylinder(d = D, h = H, center = true, $fn = FN);
	translate([0, -(L/2)+(D/2), 0]) cylinder(d = D, h = H, center = true, $fn = FN);
	cube([D, L-D, H], center = true);
}

module M5(length, depth, offset){
	cylinder(d = 5.2+offset, h = length+.1, $fn = 16, center = true);//Shank
	translate([0, 0, (length/2)]) cylinder(d = 9.25, h = 5+depth, $fn = 32);//Head
	//translate([0, 0, 3-length/2]) rotate([0, 180, 0]) cylinder(d = 9.3, h = 4.5+depth, $fn = 6);//Nut
}

module M4(len, depth){
	cylinder(d = 4.3, h = len+.1, $fn = 16, center = true);//Shank
	translate([0, 0, (len/2)]) cylinder(d = 7.5, h = 4+depth, $fn = 32);//Head
	translate([0, 0, 3-len/2]) rotate([0, 180, 0]) cylinder(d = 8, h = 4+depth, $fn = 6);//Nut
}


module M3(len, depth, slot){
	cylinder(d = 3.3, h = len+.1, $fn = 16, center = true);
	translate([0, 0, (len/2)-.1]) cylinder(d = 6, h = 5.2+depth, $fn = 32);//head
	//translate([0, 0, -((len+depth)/2)]) cylinder(d = 6.4, h = 3.75+depth, $fn = 6, center = true);//nut
	//translate([-slot/2, 0, -((len+depth)/2)]) cube([slot, 5.55, 3.75+depth], center = true);
}

module wireCutout(thick, width, height){
	cube([thick, width, (height-width)], center = true);
	translate([0, 0, (height-width)/2]) rotate([0, 90, 0]) cylinder(d = width, h = thick, center = true);
	translate([0, 0, -(height-width)/2]) rotate([0, 90, 0]) cylinder(d = width, h = thick, center = true);
}

module pwrSW(){
	translate([0, 3.3, 0]) color([38/255, 36/255, 30/255]) cube([30, 21.5, 14], center = true);//main body
	translate([0, -12.2, 0]) color("silver") cube([22.5, 10, 10], center = true);//terminals
	translate([0, 14.95, 0]) color("gray") cube([32.5, 1.8, 16], center = true);//face plate
	translate([0, 14.9, 0]) color("red") cube([22, 6, 10.5], center = true);//button

	translate([15, 7.75, 0]) cube([4, 6, 14], center = true);//latch points
	translate([-15, 7.75, 0]) cube([4, 6, 14], center = true);
}

module corntact(D){
	difference(){
		translate([0, 0, 0]) cube([7, 8, 10.5], center = true);
		translate([0, 0, -1.25]) cube([10, 3, 8], center = true);
	}
	translate([0, (D/2)+2, 0]) cube([7, D, 10.5], center = true);
}

module roun3(h){
	difference(){
		translate([0, -4, 0]) cube([16, 9, h+2], center = true);
		cylinder(d = 15, h = h+2, center = true, $fn = 28);
	}
}

module corner(diam, leng, fn){
	difference(){
		translate([diam/2+.5, diam/2+.5, 0]) cube([diam+1, diam+1, leng], center = true);
		cylinder(r = diam, h = leng+1, center = true, $fn = fn);
	}
}
