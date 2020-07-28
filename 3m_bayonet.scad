// source of this is https://www.thingiverse.com/thing:4246959
// with minor tweaks by @jesselaird

tolerance=0.5;
attachment_od=30;
attachment_height=10;
bayonet_od=21.5+tolerance;
bayonet_extra=2; //radius
bayonet_under=2.25;
bayonet_width=7;
bayonet_height=attachment_height-bayonet_under;
$fn=200;

module 3m_attachment() {
difference(){
	cylinder(r=attachment_od/2, h=attachment_height);
	cylinder(r=bayonet_od/2, h=attachment_height+2);
	for(i=[0:2]){
		rotate([0,0,120*i]){
            intersection(){
                cylinder(r=bayonet_od/2+bayonet_extra, h=attachment_height);
                translate([-bayonet_width/2, 0,0])
                cube([bayonet_width, attachment_od, attachment_height]);
            }
            translate([0,0,bayonet_under]) {
                intersection(){
                    cylinder(r=bayonet_od/2+bayonet_extra, h=bayonet_height);
                    translate([-bayonet_width/2, 0,0])
                    cube([bayonet_width*4, attachment_od, attachment_height]);
                }
            }
        }
	}
}
}


//To use:
// Put in same folder as 3m_bayonet.scad and in your file: 
//use <3m_bayonet.scad>
//3m_attachment();