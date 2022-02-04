# Light Sensor Mirror
<img align="right" width="400" height="*" src="/assets/holder.jpg">

The main file is a [SCAD file](holder.scad) that was used to create the other .stl files.

Use the *.stl files* if you have a mirror as in the description, otherwise create your own .stl file using *OpenSCAD*.

## OpenSCAD

- Download [OpenSCAD](https://openscad.org). OpenSCAD is an Free and Open Source Software (FOSS). Use it for parametric 3D CAD modeling.
- The main SCAD file uses the [Nuts 'n Bolts library from Johannes Kneer](https://github.com/JohK/nutsnbolts).
- Change this line: `xyz = [1,1,0.05,true];`.
  - 1st parameter (1), is the width of the mirror.
  - 2nd parameter (1), is the height of the mirror.
  - 3rd parameter (0.05), is the thickness of the mirror.
  - 4th parameter (true), is `true` if inches are used, and `false` if millimeters are used.
- Press `F6` to render the model.
- Press `F7` to export the model to a .stl file.

## stl files
The .stl files are based on listed measures from [this collection](https://www.amazon.com/gp/product/B07T8Z58SF) of craft mirrors from Amazon. 
> I haven't tested if the measures are accurate. 

| .stl file | X | Y | Z | Use inches |
| --- | ---: | ---: | ---: | :---: | 
| [holder_1x1x0.05_i](stl/holder_1x1x0.05_i.stl) |  1" | 1" | 0.05" | true |
| [holder_.75x.75x0.05_i](stl/holder_.75x.75x0.05_i.stl) |  0.75" | 0.75" | 0.05" | true |
| [holder_.5x.5x0.05_i](stl/holder_.5x.5x0.05_i.stl) |  0.5" | 0.5" | 0.05" | true |
