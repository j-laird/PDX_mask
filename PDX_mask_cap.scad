// PDX mask project - vent cap
// initial by Jesse Laird
// github j-laird; twitter @jesselaird

include <PDX_mask_dimensions.scad>

cap_inner_radius = cap_fit_factor * base_filter_outer_radius;
cap_outer_radius = cap_inner_radius + cap_wall_thickness;
cap_height_total_inner = base_filter_height;
cap_height_total_outer = base_filter_height + cap_thickness;

module cap_vent(){
    difference(){
        //circular vent features:
        union(){
            for(i=[2*cap_vent_thickness:5*cap_vent_thickness:cap_inner_radius]){
                difference(){
                    cylinder(h=cap_thickness*1.1, r=i);
                    cylinder(h=cap_thickness*1.2, r=i-3*cap_vent_thickness);
                }
            }
        }
        // support ribs for circular vent:
        union(){
            for(rot_deg=[0:60:120]){
                rotate([0,0,rot_deg]){
                    translate([0,0,cap_thickness/2]){
                        cube([2*cap_vent_thickness,2*cap_inner_radius,cap_thickness],center=true);
                    }
                }
            }
        }
    }
}

module blank_cap(){
    union(){
        // basic cap body
        difference(){
            cylinder(h=cap_height_total_outer,r=cap_outer_radius);
            translate([0,0,cap_thickness]){
                cylinder(h=cap_height_total_inner,r=cap_inner_radius);
            }
        }
        // add in retaining grove
        translate([0,0,cap_height_total_outer - retention_bump_offset]){
            rotate_extrude(){
                translate([base_filter_outer_radius + (retention_bump_depth/4),0,0]){
                    circle(r=retention_bump_depth);
                }
            }
        }
    }
}

module cap_relief_slots(){
    translate([0,0,cap_thickness+cap_height_total_inner]){
        // support ribs for circular vent:
        union(){
            for(rot_deg=[0:60:120]){
                rotate([0,0,rot_deg]){
                    translate([0,0,0]){
                        cube([cap_wall_thickness,2*cap_outer_radius,cap_height_total_inner],center=true);
                    }
                }
            }
        }
    }
}

union(){
    // main cap body with vents removed:
    difference(){
        blank_cap();
        cap_vent();
        cap_relief_slots();
    }
}
