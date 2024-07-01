#!/bin/bash bash

# primer mandar a llamar el script para calcular los datos
echo "Se ha iniciado la simulacion en paralelo :)"
bash paralalleSim.sh 
# despues para hacer el render
echo "se ha iniciado el render en paralelo :)"
bash paralleRender.sh
echo "se termino el render :)"
