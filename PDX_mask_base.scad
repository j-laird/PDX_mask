// PDX mask project base
// initial by Jesse Laird
// github j-laird; twitter @jesselaird

include <3m_bayonet.scad>
include <PDX_mask_dimensions.scad>

base_mount_outer_radius = bayonet_od/2+bayonet_extra+2;
base_mount_inner_radius = base_mount_outer_radius - base_wall_thickness;

union(){
    3m_attachment();
    translate([0,0,10]){
        difference(){
            cylinder(h=base_cone_height,r1=base_mount_outer_radius, r2=base_filter_outer_radius);
            cylinder(h=base_cone_height,r1=base_mount_inner_radius, r2=base_filter_inner_radius);
        }
        
    }
    translate([0,0,30]){
        difference(){
            cylinder(h=base_filter_height,r=base_filter_outer_radius);
            cylinder(h=base_filter_height,r=base_filter_inner_radius);
        }
    }
}
