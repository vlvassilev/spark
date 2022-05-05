$fn=50*1.0;

include <lego_beam.scad>;

scale([1,1,1]) {
    horizontal_w_hole();
    vertical_lego_placed();
}

module vertical_lego()
{
    lego_beam_placed();
    vertical_w_hole();
}

module lego_beam_placed()
{
	translate([6,24,-4]) {
		rotate([0,0,0]) {
			lego_beam(4);
		}
	}
	translate([10,4,-4]) {
		rotate([0,0,90]) {
			lego_beam(4);
		}
	}
}

module vertical_lego_placed()
{
	translate([4,0,4]) {
		rotate([0,-90,0]) {
			vertical_lego();
		}
	}
}


module vertical()
{
	linear_extrude(height=4, center=false, convexity=10)
		import(file="vertical.dxf");
}

module vertical_w_hole()
{
    cr=6.1/2; //lego hole radius
    ch=5.1; //cilinder height 4+1.1
    difference() {
        vertical();
        union() {
            translate([6,4,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([6,12,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([6,20,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([6,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([14,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([22,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([30,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
        }
    }
}

module horizontal()
{
	linear_extrude(height=4, center=false, convexity=10)
		import(file="horizontal.dxf");
}

module horizontal_w_hole()
{
    difference() {
        horizontal();
        union() {
            translate([12,12,-1])
                cylinder(h=5.1, r1=1.25, r2=1.25);
        }
    }
}

module horizontal_w_hole_flipped()
{
	translate([4,0,4]) {
		rotate([0,180,0]) {
            horizontal_w_hole();
        }
    }
}
