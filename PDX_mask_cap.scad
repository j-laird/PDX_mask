// PDX mask project - vent cap
// initial by Jesse Laird
// github j-laird; twitter @jesselaird

include <PDX_mask_dimensions.scad>

cap_inner_radius = cap_fit_factor * base_filter_outer_radius;
cap_outer_radius = cap_inner_radius + cap_wall_thickness;
cap_height_min = base_filter_height;
cap_height_total_inner = cap_height_min + cap_pin_dia;
cap_height_total_outer = cap_height_total_inner + cap_thickness;
cap_pin_height = cap_wall_thickness + cap_pin_extension;


module cap_vent(){
    for(i=[2*cap_vent_thickness:5*cap_vent_thickness:cap_inner_radius]){
        difference(){
            cylinder(h=cap_thickness*1.1, r=i);
            cylinder(h=cap_thickness*1.2, r=i-3*cap_vent_thickness);
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
        // snap pins around edge (x4)
        translate([cap_outer_radius-cap_wall_thickness,0,cap_height_total_inner + cap_pin_dia/2]){
            rotate([0,90,0]){
                cylinder(h=cap_pin_height, d=cap_pin_dia,center=true);
            }
        }
        translate([-1*(cap_outer_radius-cap_wall_thickness),0,cap_height_total_inner + cap_pin_dia/2]){
            rotate([0,90,0]){
                cylinder(h=cap_pin_height, d=cap_pin_dia,center=true);
            }
        }
        translate([0,cap_outer_radius-cap_wall_thickness,cap_height_total_inner + cap_pin_dia/2]){
            rotate([90,0,0]){
                cylinder(h=cap_pin_height, d=cap_pin_dia,center=true);
            }
        }
        translate([0,-1*(cap_outer_radius-cap_wall_thickness),cap_height_total_inner + cap_pin_dia/2]){
            rotate([90,0,0]){
                cylinder(h=cap_pin_height, d=cap_pin_dia,center=true);
            }
        }
    }
}

union(){
    // support ribs for circular vent:
    for(rot_deg=[0:60:120]){
        rotate([0,0,rot_deg]){
            translate([0,0,cap_thickness/2]){
                cube([2*cap_vent_thickness,2*cap_inner_radius,cap_thickness],center=true);
            }
        }
    }
    // main cap body with vents removed:
    difference(){
        blank_cap();
        cap_vent();
    }
}

   