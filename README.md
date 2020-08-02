# PDX Refillable Mask Cartridge Project

## Disclaimer
Home-made respirator cartridges have plenty of safety concerns.  From the design - to materials used - to workmanship when re-assembling, there are risks to using this and other designs.  If you can find commercially built cartridges, please use them instead.  If you need to experiment?  Read on.  Not my pig, not my farm.

![components](/cartridge_components.PNG)

## Design Philosophy
- Not about me - my name is on it for questions, but if you can improve, please do.  
- Print Efficiency: Getting the most cartridges out to those in need is a priority
- Printability: This idea works only if different people with different printers can scale production
- Customization: OpenSCAD allows people to use free software to tweak design (improve print quality - account for variation in printer accuracy, etc)
- STLs for the People: Hopefully the default parameters make usable parts for most printers without having to load/edit design files

## Construction
Prototypes have been printed on a Prusa i3mk3 printer using PETG filament.  The design was optimized for print time, and takes advantage of the flexibility and durability of this material to snap together.  Total print time at 0.3mm layer height / draft quality is about 1h 45m per cartridge.  However:

- Cap and support can be printed at 0.3mm for speed
- Base prints best at 0.2mm.  My print time for this part was ~1.5h at 0.2mm/speed on Prusaslicer

*new in latest version - cap has cap_fit_factor to grow/shrink for best fit.  1.00 was too tight for me, 1.01 was too loose - and 1.005 was perfect.*

The design is implemented in 3 parts to provide better print quality with short print times.  A printed support is placed inside the bayonet base.  The user-side filter material will probably be cut and glued around the periphery, and the space is designed to support the use of activated carbon granules.  A second layer (environment side) can be glued to either the inside of the snap-on cap, or somehow glued to the top of the base.  Feedback welcome.

The cap has 4 small "pin" features that are designed to snap around the base where it begins tapering down in a cone shape toward the bayonet fitting.  The size and extension of these are parameters in the OpenSCAD file and can be adjusted to balance security vs ease of disassembly for reloading.  

The height of the media (carbon) area is also parameteric if more/less is desired. 

## Customizing
Design implemented in OpenSCAD - Put all files in the same folder - most customization is in PDX_mask_dimensions.scad so that changes propogate to any affected parts.  

## Credits
Design leaned heavily on OpenSCAD 3M Bayonet adapter by james_lan: https://www.thingiverse.com/thing:4246959
