// Picture frame files
//


fr_w = 4*25.4+7;
fr_h = 6*25.4+7;
fr_th = 8;
fr_d = 10;

module bevel_cube_1(x,y,z)
{
    difference()
    {
       cube([x, y, z], center=true);
        translate([0, -y/2, z/3])
       rotate([10, 0,0])
       cube([x+10, y*3, z], center=true);
    }
    
}

module bevel_cube(x, y, z)
{
difference()
    {
        bevel_cube_1(x, y, z);
        translate([x/2+y/sqrt(2)-y, -y/2, 0])
       rotate([0, 0, -45+90])
       cube([x, y, z*2], center=true);
        
    }
}

module corner1()
{
bevel_cube(fr_w/2, fr_d, fr_th);
    translate([fr_w/4-fr_d/2, -fr_h/4+fr_d/2, 0])
    mirror([1,0,0])
    rotate([0,0,90])
bevel_cube(fr_h/2, fr_d, fr_th);
}



c=1;

if( c==1)
{
corner1();
}

if(c==2)
{
    
translate([0, -fr_h*1.1, 0])
mirror([0,1,0])
corner1();
}

translate([-fr_w, 0,0])
mirror([1,0,0])
{
if(c==3)
{
corner1();
}

if(c==4)
{
translate([0, -fr_h*1.1, 0])
mirror([0,1,0])
corner1();
}
}
