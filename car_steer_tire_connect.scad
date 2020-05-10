module bcube(size,cr=0,cres=0)
{
  //-- Internal cube size
  bsize = size - 2*[cr,cr,0];

  //-- Get the (x,y) coorner coordinates in the 1st cuadrant
  x = bsize[0]/2;
  y = bsize[1]/2;

  //-- A corner radius of 0 means a standar cube!
  if (cr==0)
    cube(bsize,center=true);
  else {

      
      //-- The height of minkowski object is double. So
      //-- we sould scale by 0.5
      scale([1,1,0.5])

      //-- This translation is for centering the minkowski objet
      translate([-x, -y,0])

      //-- Built the  beveled cube with minkowski
      minkowski() {

        //-- Internal cube
        cube(bsize,center=true);

        //-- Cylinder in the corner (1st cuadrant)
        translate([x,y, 0])
          cylinder(r=cr, h=bsize[2],center=true, $fn=4*(cres+1));
      }
  }

}


//----------------------
low_bar = 11;
left_bar = 5;
r1 = 4;
r2 = 2;
r3 = 1.5/2;
h = 25;
t = 6;
r_join = 5.8/2;
translate([0,0,0])
difference(){
union()
{
    difference(){
      bcube([60,60,7],cr=10, cres=10);
      union(){
      bcube([60-left_bar*2,60-low_bar*2,9],cr=10,cres=10);
      translate([-50,0,-10])
          cube([80,50,20]);
      translate([0,-50,-10])
          cube([80,80,20]);
      }
    }
    translate([0,-30+low_bar*0.5,0.5])
        rotate([90,0,0]){
            difference(){
            cylinder(low_bar,r1,r1,true,$fn=30);
            cylinder(low_bar+2,r2,r2,true,$fn=30); 
            }
        }
    translate([0,-30+0.5*low_bar,h/2])
        bcube([t,11,h],cr=2.1, cres=10);
    translate([0,-30+low_bar-r_join,h])
        cylinder(6,r_join,r_join,false,$fn=30);
}
translate([0,-30+low_bar*0.5,0.5])
        rotate([90,0,0]){
            cylinder(low_bar+2,r2,r2,true,$fn=30); 
        }
translate([-30+left_bar*0.5,0])
        rotate([90,0,0]){
            cylinder(8,r3,r3,true,$fn=30); 
        }
}




