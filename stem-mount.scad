$fn=64;
module wedge(b=[1,1],t=[1,1],h=10,to=[0,0])
{
    hull()
    {
        cube([b[0],b[1],0.00001],true);
        
        translate([to[0],to[1],h])
            cube([t[0],t[1],0.00001],true);
    };
}
difference()
{
union()
    {
        wedge([4.75,3.75],[3.75,2.75],11.5,[0,0.5]);
        intersection()
        {
        translate([0,0.3,7.75])sphere(4.5/2,true);
            translate([0,0.3,0])cube([100,2.2,100],true);
        }
    }
translate([0,0,11.5-7])
    {
        translate([0,5,0])rotate([90,0,0])cylinder(h=10,r=1.5/2);
        wedge([1.5,5.75],[1.5,3.75],8,[0,0.5]);
    }
    
translate([0,0,11.5-1])
    {
        wedge([1.5,5.75],[2.5,5.75],1,[0,0.5]);
    }
}