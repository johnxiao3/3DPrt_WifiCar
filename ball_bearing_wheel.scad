


module ball_bearing(ri = 3, ra = 20, height = 7, support=false, freefaktor = 1.05) {
	difference() {
		cylinder(r=ra, h=height, $fn=60);
		translate([0,0,-0.1]) cylinder(r=ri,h=height + 0.2, $fn=60);
		translate([0, 0, height/2]) rotate_extrude($fn=60) translate([(ri + ra)/2, 0, 0]) circle(r=(height*freefaktor)/2);
	}
	rb=height/2;
	R=(ri+ra)/2;
	phi=asin(rb/sqrt(R*R-rb*rb));
	echo("R,rb,phi", R, rb, phi);
	balls=1+floor( 180/phi );
	echo("180/phi, Number of balls=", 180/phi, balls);
	for ( i = [0 : balls-1] ) {
		rotate( i * 360 / balls, [0, 0, 1]) translate([(ri + ra)/2, 0, height/2]) sphere(r=height/2-0.15, $fn=60);
	}
    /*
	if (support) {
		difference() {
			cylinder(r=(ri+ra)/2+0.15,h=1);
				translate([0, 0, -0.05]) cylinder(r=(ri+ra)/2-0.15,h=1.0);
		}
		for ( i = [0 : balls-1] ) {
			rotate( i * 360 / balls, [0, 0, 1]) translate([ri+0.1, 0, 0]) cube([ra-ri-0.2, 0.3, 0.9]);
		}
	}*/
    //cylinder(r=(ri+ra)/2+0.15,h=0.1);
}


// ball_bearing(ri=3, ra=11.5, height=4.5, support=true, freefaktor=1.05);


//------------------------------------tire--------------------------
/*
*/

$fs = 0.5; // change me to 2 for viewing/alterations, and 0.5 for final export render

extrusion_width = 0.5;
layer_height = 0.2;

ribs = 10;

outer_diameter = 68;

tread_teeth = 12;
tread_depth = 3;
tread_layers = 5;

bell_radius = 24;

height = 20;

hex_diameter = 12;

hole_diameter = 4;

socket_depth = 5;
socket_diameter = 14;

$fa = 0.01;

wall_width = extrusion_width * 2;

outer_radius = outer_diameter / 2;

rim_width = wall_width * 1.5;
rib_width = wall_width;
bell_width = wall_width * 2;

module treadsection(r = outer_radius - tread_depth, a=7, h=5) {
	render()
	linear_extrude(height = h, convexity = 5)
	hull() {
		difference() {
			circle(r - 0.1);
			circle(r - 0.2);
			for (i=[0:1]) mirror([0, i, 0])
				rotate(a) translate([-outer_diameter, 0]) square(outer_diameter * 2);
		}
		for (i=[0:1])
			translate([outer_radius - 1, (1 - (i * 2)) * 1.4]) circle(1);
	}
}

module tread(h = 4) {
	for (i=[0:tread_layers - 1])
		translate([0, 0, i * h])
			rotate([0, 0, (i % 2) * 180 / tread_teeth])
				treadsection(h=height / tread_layers);
}

module inner(r1 = bell_radius, r2 = 3) {
	render()
	hull() {
		translate([0, 0, r2])
			rotate_extrude(convexity=5)
				translate([r1 - r2, 0]) circle(r2);
		translate([0, 0, height])
			cylinder(r=r1, h=1);
		cylinder(r=r1 - r2, h=1);
	}
}

module rib(r1=(outer_radius - tread_depth - rim_width) - (bell_radius + bell_width) - rib_width, r2=bell_radius + bell_width - 0.5, w=rib_width, a=110, h=height) {
	#render()
	linear_extrude(height=h, convexity=5)
	intersection() {
		circle(outer_radius - tread_depth - 0.1);
		translate([r2, -r1 + w * 0.5, 0])
		difference() {
			circle(r1);
			rotate(-a)
				translate([0, -r1 * 1.5])
					square([r1 * 3, r1 * 3]);
			if (a < 90)
				translate([-r1, -r1]) square([r1 * 2, r1]);
			translate([-r1, -r1]) square([r1, r1 * 2]);
			circle(r1 - w);
		}
	}
}

module wheel() {
	difference() {
		cylinder(r=outer_radius - tread_depth, h=height);
		translate([0, 0, socket_depth + layer_height-8])
			cylinder(r=18, h=height+10);

	}
	for (i=[0:tread_teeth]) {
		rotate([0, 0, i * 360 / tread_teeth])
			tread();
	}
}
union(){
translate([0,0,0])
    ball_bearing(support=false);
wheel();
}