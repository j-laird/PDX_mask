// PDX mask project - core dimensions (mm)
// initial by @jesselaird

base_filter_height = 15;
base_wall_thickness = 0.8;
base_cone_height = 30;
base_filter_outer_radius = 40;
base_filter_inner_radius = base_filter_outer_radius - base_wall_thickness;


cap_thickness = 0.8;
cap_wall_thickness = 0.8;
cap_pin_extension = 1;
cap_pin_dia = 1;
cap_vent_thickness = 2;  // 0.8 makes a nice looking vent, but had issues reliably printing this - also, OpenSCAD can't preview the cap at 0.8 - you have to do full render to see the design.
cap_fit_factor = 1.005;

$fn=200;