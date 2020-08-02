// PDX mask project - core dimensions (mm)
// initial by @jesselaird

retention_groove_depth = 0.5;
retention_groove_height = 1.5;
retention_groove_offset = 2;
retention_bump_depth = 0.5;
retention_bump_height = 1;
retention_bump_offset = retention_groove_offset + (retention_groove_height - retention_bump_height)/2;

base_filter_height = 15;
base_wall_thickness = 0.8;
base_cone_height = 30;
base_filter_inner_radius = 40;
base_filter_outer_radius = base_filter_inner_radius + base_wall_thickness + retention_groove_depth;

cap_thickness = 0.8;
cap_wall_thickness = 0.8;
cap_vent_thickness = 2;  // 0.8 makes a nice looking vent, but had issues reliably printing this - also, OpenSCAD can't preview the cap at 0.8 - you have to do full render to see the design.
cap_fit_factor = 1.0035;

$fn=200;