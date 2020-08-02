// PDX mask project base
// initial by Jesse Laird
// github j-laird; twitter @jesselaird

include <3m_bayonet.scad>
include <PDX_mask_dimensions.scad>

base_mount_inner_radius = attachment_od/2;
base_mount_outer_radius = base_mount_inner_radius + base_wall_thickness;
base_fin_width = 0.8;
base_rib_corner_radius = ((base_filter_inner_radius - base_mount_inner_radius) * 
                    (attachment_height / base_cone_height)
                    + base_mount_inner_radius + 0.1);

union(){
    // bayonet mount 
    3m_attachment();
    // cone transition between mount base and filter
    difference(){
        cylinder(h=base_cone_height,
                 r1=base_mount_outer_radius, 
                 r2=base_filter_outer_radius);
        cylinder(h=base_cone_height,
                 r1=base_mount_inner_radius, 
                 r2=base_filter_inner_radius);
    }
    // support between mount and cone:
    difference(){
        // Had to add fudge factor 0.1 to calculation to keep base manifold -JL
        cylinder(h=attachment_height,
                 r1=base_mount_inner_radius,
                 r2=base_rib_corner_radius);
        cylinder(h=attachment_height,
                 r=base_mount_inner_radius);
    }
    // interior ribs for reinforcement:
    difference(){
        intersection(){
            cylinder(h=base_cone_height,
                     r1=base_mount_inner_radius,
                     r2=base_filter_inner_radius);
            for(rot_deg = [0:45:135]){
                rotate([0,0,rot_deg]){
                    translate([base_fin_width/2, 
                               -1 * base_filter_inner_radius,
                               attachment_height]){
                        cube([base_fin_width, 
                              base_filter_inner_radius * 2, 
                              base_cone_height - attachment_height]);
                    }
                }
            }
        }
        translate([0,0,attachment_height]){
            cylinder(h=base_cone_height - attachment_height,
                     r1 = bayonet_od/2 + bayonet_extra,
                     r2 = base_filter_inner_radius);
        }
    }
    // filter area:
    translate([0,0,30]){
        difference(){
            // basic hollow cylinder:
            cylinder(h=base_filter_height,r=base_filter_outer_radius);
            cylinder(h=base_filter_height,r=base_filter_inner_radius);
            // now we'll remove a grove on the outside, 2mm up from where cone meets the filter area
            // - this forms a retention grove that interlocks a feature on the cap
            translate([0,0,retention_groove_offset]){
                difference(){
                    cylinder(h=retention_groove_height,
                             r=base_filter_outer_radius);
                    cylinder(h=retention_groove_height,
                             r=base_filter_outer_radius - retention_groove_depth); 
                }
            }
        }
    }
}