//Example:
// lego_beam(4);


//$fn=50*1.0;

pitch = 8.0*1.0;
radius1 = 5.0/2;
radius2 = 6.1/2;
height = 8.0*1.0; //7.8
depth = 0.95*1.0;
width = 8.0*1.0; //7.3 
overhang = 0.05*1.0;

module body(beam_len)
{
    translate([0, width/2, 0]) 
    hull() {
        cylinder(r=width/2, h=height);
        
        translate([(beam_len-1)*pitch, 0, 0]) 
            cylinder(r=width/2, h=height);
    }
}

module hole(beam_len)
{
    union()
	{
        //core
        cylinder(r=radius1,h=height);
        
        //top countersink
        translate([0,0,height-depth+overhang]) 
            cylinder(r=radius2,h=depth);
        
        //bottom countersink
        translate([0,0,-overhang/2]) 
            cylinder(r=radius2,h=depth);
        
        translate([0,0,depth-overhang])
            cylinder(h=(radius2 - radius1), r1=radius2, r2=radius1);
    }
}

module lego_beam(beam_len)
{
    difference()
    {
        body(beam_len);
       
        for (i = [1:beam_len])
        {
            translate([(i-1)*pitch, width/2, 0])
                hole(beam_len);
        }
    }
}

