//Use 2x M2-8 with hex nuts.
//Uses this library: https://github.com/JohK/nutsnbolts
//Change the below x,y,z paremeters to match you craft mirrow..
//Choose if the values are in inches or mm

//maximum 1" or 25.4mm

//1st parameter = x = Mirror width
//2nd parameter = y = Mirror height
//3rd parameter = z = Mirror thinkness
//4th parameter = true = inches, false = mm
//leave only one xyz not commented out
//https://www.amazon.com/gp/product/B07T8Z58SF
xyz = [1,1,0.05,true]; // 1" x 1" x 0.05"
//xyz = [.75,.75,0.05,true]; // .75" x .75" x 0.05"
//xyz = [.5,.5,0.05,true]; // .5" x .5" x 0.05"


/// DON'T CHANGE ANYTHING BELOW THIS LINE - unless you know what you are doing!

x = getmm(xyz.x);
y = getmm(xyz.y);
z = getmm(xyz.z);

$fn=20;
include <cyl_head_bolt.scad>;

gx = x;
gy = sqrt(y^2/2);
gz = gy;


frame = 5; //frame dimension
precut = 0.01; //for cutwaway
pluscut = 0.02;
xchip = 31.8;
holepos = 2.4;
slack =0.2;
backpos = sqrt((z+slack*2)^2*2);
assert((xchip-gy)/2-backpos > 2.11142, "Mirror too big"); 
lift = frame-sqrt((z+slack*2)^2*2);

// rounded corners - not recommended - 
// takes long time to render and causes problems with fitting 
//minkowski() 
{
    structure();
    //sphere(.3);
}

module structure() {
    difference() {
        union () {  
            // Make a 5x5x5 frame.
            difference() {
                color("yellow") cube([xchip,xchip,frame]); //Bottom square 
                translate([frame, (xchip-gy)/2, -precut]) 
                    cube([xchip-(2*frame),100,frame+pluscut]); 
            }
            // Make housing
            difference() {
                translate([0,5,0]) color("yellow") cube([xchip, xchip-(2*frame), gz+z]); 
                cav_w=gx-2;
                cav_x=(xchip-cav_w)/2;
                // Cutaway the cavity
                translate([cav_x,7,-0.1]) cube([cav_w,21.9-2,gz+5]); 
                // Cutaway the backwall space
                translate([-precut,(xchip-gy)/2-backpos,0]) rotate(a=45, v=[1,0,0]) 
                    color("grey") cube([xchip+pluscut,100,100]); 
            }
            // Make backwall
            translate([0,(xchip-gy)/2-backpos+precut,0]) rotate(a=45, v=[1,0,0])
                color("yellow") cube([xchip,y+pluscut+20,2]);
        } 

        // Cutaway the mirror slide
        translate([(xchip-gx)/2,(xchip-gy)/2,0]) rotate(a=45, v=[1,0,0])
            color("blue") cube([x+slack,y+slack+10,z+slack*2]);

        // Cutaway for connectors
        translate([-0.2,10.7,-0.1]) color("red") cube([32.2,10.4,2.5]); // East+West
        translate([10.7,-0.2,-0.1]) color("red") cube([10.4,32.2,2.5]); // South+ North
        
        // Cutaway excessive height
        translate([-precut,-precut,gz+z-precut]) color("grey") cube([100,100,100]); 
        
        // Cutaway recess for nut
        nut(0,0);
        nut(0, xchip-(2*holepos));
        nut(xchip-(2*holepos),0);
        nut(xchip-(2*holepos), xchip-(2*holepos));
    }
}

module nut(x,y) {
    translate([holepos+x, holepos+y, -precut]) cylinder(frame+pluscut,1.1);
    translate([holepos+x, holepos+y, 3.3]) rotate([180,0,0]) nutcatch_parallel("M2", clh=0.1);
}

function getmm(n) = (xyz[3]) ? n*25.4 : n ;

   

