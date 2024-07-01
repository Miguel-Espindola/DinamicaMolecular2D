import PySide6.QtWidgets
app = PySide6.QtWidgets.QApplication() 

import math
from ovito.vis import *
from ovito.io import import_file
from ovito.modifiers import AssignColorModifier
vp = Viewport()
vp.type = Viewport.Type.Perspective
vp.camera_pos = (50,25,70)
vp.camera_dir = (0,0,-1)
vp.fov = math.radians(60.0)
xs = (x*0.01 for x in range(1,100))
pipeline = import_file("pos.xyz")
pipeline.add_to_scene()
pipeline.modifiers.append(AssignColorModifier(color=(1.0,1.0,1.0)))
vis_elem = pipeline.compute().particles.vis
vis_elem.radius = 0.5
for j in range(0,1000):
    name = "frame"+str("{:03d}".format(j))+".jpg"
    vp.render_image(size=(800,600),filename=name,background=(0,0,0),frame=j,renderer=OpenGLRenderer())
    
