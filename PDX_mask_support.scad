// PDX mask project filter support
// initial by Jesse Laird
// github j-laird; twitter @jesselaird

include <PDX_mask_dimensions.scad>
include <3m_bayonet.scad>

// chose this for quick printing w/ 0.4mm nozzle:
fin_width = 0.8;

// calculated based on other design parameters:
cone_top_radius = base_filter_inner_radius;
cone_bottom_radius = bayonet_od/2+bayonet_extra+2 - base_wall_thickness;
cone_height = base_cone_height-attachment_height;
// from base cone design:
base_mount_inner_radius = attachment_od/2;
base_rib_corner_radius = ((base_filter_inner_radius - base_mount_inner_radius) * 
                    (attachment_height / base_cone_height)
                    + base_mount_inner_radius + 0.1);

union(){
    // circular filter supports:
    translate([0,0,cone_height/-2]){
        difference(){
            cylinder(h=fin_width,r=0.9*cone_top_radius);
            cylinder(h=fin_width,r=0.9*cone_top_radius - fin_width);
        }
        difference(){
            cylinder(h=fin_width,r=0.75*cone_top_radius);
            cylinder(h=fin_width,r=0.75*cone_top_radius - fin_width);
        }
        difference(){
            cylinder(h=fin_width,r=0.60*cone_top_radius);
            cylinder(h=fin_width,r=0.60*cone_top_radius - fin_width);
        }
        difference(){
            cylinder(h=fin_width,r=0.45*cone_top_radius);
            cylinder(h=fin_width,r=0.45*cone_top_radius - fin_width);
        }
        difference(){
            cylinder(h=fin_width,r=0.30*cone_top_radius);
            cylinder(h=fin_width,r=0.30*cone_top_radius - fin_width);
        }
    }
    // cone shaped fins:
    intersection(){
        union(){
            cube([cone_top_radius * 2,fin_width,cone_height],center=true);
            cube([fin_width,cone_top_radius * 2,cone_height],center=true);
            rotate([0,0,45]){
                cube([cone_top_radius * 2,fin_width,cone_height],center=true);
                cube([fin_width,cone_top_radius * 2,cone_height],center=true);
            }
        }
        cylinder(h=cone_height, r1=cone_top_radius, r2=base_rib_corner_radius,center=true);
    }
}