
/*
L = 52;
W = 31.5;
H = 15;
halfH = 7;
R = 7.5;
Battery_H = 49;

difference(){
	cube([L,W,H]);
	union(){
		translate([1.5,0.5+R,0.5+R])rotate([0,90,0])cylinder(Battery_H,R,R);
		translate([1.5,-1,halfH])cube([Battery_H,W+2,2*H]);
		translate([1.5,0.5+R+0.5+2*R,0.5+R])rotate([0,90,0])cylinder(Battery_H,R,R);
	}
}
*/

// car_board:


//carback
carback_L = 118;
carback_W = 20;
carback_H = 20;

carback_motor_h = 9.5;
carback_motor_w = 12;
carback_motor_d = 15;

carback_screw_r = 1.0;
carback_screw_h = 10;
carback_screw_d1 = 4;
carback_screw_d2 = 10.5;

difference(){
	cube([carback_L,carback_W,carback_H]);
	union(){
		translate([-1,(carback_W-carback_motor_w)/2,carback_H-carback_motor_h])
			cube([carback_motor_d+1,carback_motor_w,carback_motor_h+1]);
		translate([carback_L-carback_motor_d,(carback_W-carback_motor_w)/2,carback_H-carback_motor_h])
			cube([carback_motor_d+1,carback_motor_w,carback_motor_h+1]);
		
		//screw four
		translate([carback_screw_d1,(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);
		translate([carback_screw_d2,(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);
		translate([carback_screw_d1,carback_W-(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);
		translate([carback_screw_d2,carback_W-(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);	
		
		//the other four screw:
		translate([carback_L-carback_screw_d1,(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);
		translate([carback_L-carback_screw_d2,(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);
		translate([carback_L-carback_screw_d1,carback_W-(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);
		translate([carback_L-carback_screw_d2,carback_W-(carback_W-carback_motor_w)/4,carback_H])
			cylinder(carback_screw_h,carback_screw_r,carback_screw_r,true,$fn=20);
	
		//wire
		wire = 1;
		wire_w = 2;
		wire_d = 3;
		translate([carback_motor_d-1,(carback_W-carback_motor_w)/2+wire,carback_H-carback_motor_h])
			cube([wire_d+1,wire_w,carback_motor_h+1]);
		translate([carback_motor_d-1,(carback_W+carback_motor_w)/2-wire-wire_w,carback_H-carback_motor_h])
			cube([wire_d+1,wire_w,carback_motor_h+1]);
		translate([carback_L-wire_d-carback_motor_d,(carback_W-carback_motor_w)/2+wire,carback_H-carback_motor_h])
			cube([wire_d+1,wire_w,carback_motor_h+1]);
		translate([carback_L-wire_d-carback_motor_d,(carback_W+carback_motor_w)/2-wire-wire_w,carback_H-carback_motor_h])
			cube([wire_d+1,wire_w,carback_motor_h+1]);
			
		//board MX1508
		b_w = 24;
		b_s = 2;
		b_top = 2;
		b_inner = 20;
		b_H = 4.2;
		b_back_c = 0.6;
		translate([carback_L/2-b_inner/2,b_s+b_back_c,carback_H-b_H-b_top])
			cube([b_inner,carback_W,b_H+b_top+1]);
		translate([carback_L/2-b_w/2,b_s,carback_H-b_H-b_top])
			cube([b_w,carback_W,b_H]);
		
	}
	
}

carback_lock_s = 15;
carback_lock_w = 5;
carback_lock_h = 1.5;
carback_lock_d = 10;
carback_lock_vs = 1;
carback_connection_h = 10;

carback_lockcore_d = 5;
carback_lockcore_h = 0.5;

translate([carback_L/2-carback_lock_s-carback_lock_w/2,carback_W,carback_connection_h/2-carback_lock_vs/2-carback_lock_h])
	cube([carback_lock_w,carback_lock_d,carback_lock_h]);
translate([carback_L/2-carback_lock_s-carback_lock_w/2,carback_W,carback_connection_h/2+carback_lock_vs/2])
	cube([carback_lock_w,carback_lock_d,carback_lock_h]);

polyhedron(
	   points=[ [carback_L/2-carback_lock_s+carback_lock_w/2,carback_W+carback_lock_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h],
				[carback_L/2-carback_lock_s-carback_lock_w/2,carback_W+carback_lock_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h], 
				[carback_L/2-carback_lock_s-carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h], 
				[carback_L/2-carback_lock_s+carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h], 
				[carback_L/2-carback_lock_s+carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h+carback_lockcore_h], 
				[carback_L/2-carback_lock_s-carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h+carback_lockcore_h]],
	   faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
	   );


translate([carback_L/2+carback_lock_s-carback_lock_w/2,carback_W,carback_connection_h/2-carback_lock_vs/2-carback_lock_h])
	cube([carback_lock_w,carback_lock_d,carback_lock_h]);
translate([carback_L/2+carback_lock_s-carback_lock_w/2,carback_W,carback_connection_h/2+carback_lock_vs/2])
	cube([carback_lock_w,carback_lock_d,carback_lock_h]);
	
polyhedron(
	   points=[ [carback_L/2+carback_lock_s+carback_lock_w/2,carback_W+carback_lock_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h],
				[carback_L/2+carback_lock_s-carback_lock_w/2,carback_W+carback_lock_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h], 
				[carback_L/2+carback_lock_s-carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h], 
				[carback_L/2+carback_lock_s+carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h], 
				[carback_L/2+carback_lock_s+carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h+carback_lockcore_h], 
				[carback_L/2+carback_lock_s-carback_lock_w/2,carback_W+carback_lock_d-carback_lockcore_d,carback_connection_h/2+carback_lock_vs/2+carback_lock_h+carback_lockcore_h]],
	   faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
	   );
