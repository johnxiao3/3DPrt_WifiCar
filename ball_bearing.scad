


module ball_bearing(ri = 3, ra = 20, height = 9, support=false, freefaktor = 1.15) {
	difference() {
		cylinder(r=ra, h=height, $fn=60);
		translate([0,0,-0.1]) cylinder(r=ri,h=height + 0.2, $fn=60);
		translate([0, 0, height/2]) rotate_extrude($fn=60) translate([(ri + ra)/2, 0, 0]) circle(r=(height*freefaktor)/2);
	}
	rb=height/2;
	R=(ri+ra)/2;
	phi=asin(rb/sqrt(R*R-rb*rb));
	echo("R,rb,phi", R, rb, phi);
	balls=floor( 180/phi );
	echo("180/phi, Number of balls=", 180/phi, balls);
	for ( i = [0 : balls-1] ) {
		rotate( i * 360 / balls, [0, 0, 1]) translate([(ri + ra)/2, 0, height/2]) sphere(r=height/2-0.05, $fn=60);
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
ball_bearing(support=false);