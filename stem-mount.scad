$fn=64;

base = [4.75,3.75];

tip = [3.75,2.75];
height = 11.5;

split = 1.5;
split_depth = 7;

sphere_depth = 7.75;
sphere_radius = 2.25;
sphere_exposed = 2;


module wedge(b=[1,1],t=[1,1],h=10,to=[0,0])
{
    hull()
    {
        cube([b[0],b[1],0.00001],true);
        
        translate([to[0],to[1],h])
            cube([t[0],t[1],0.00001],true);
    };
}


module dasher_stem()
{
difference()
{
union()
    {
        wedge(base,tip,height,[0,(base.y - tip.y)/2]);
        intersection()
        {
            translate([0,((base.y-tip.y)*(sphere_depth/height))/2,sphere_depth])sphere(sphere_radius,true);
            translate([0,((base.y-tip.y)*(sphere_depth/height))/2,0])cube([base.x*2,sphere_exposed,100],true);
        }
    }
translate([0,0,height-split_depth])
    {
        translate([0,base.x,0])rotate([90,0,0])cylinder(h=base.x*2,r=split/2);
        wedge([split,base.y+2],[split,tip.y+2],split_depth+1,[0,0.5]);
    }
    
translate([0,0,height-1])
    {
        wedge([split,base.y+2],[split+1,base.y+2],1,[0,0]);
    }
}
}
dasher_stem();