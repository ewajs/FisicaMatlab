# FisicaMatlab
Distintos scripts de MATLAB que simulan situaciones físicas

## OndasEMN.m
Conjunto de tres scripts (N = 1, 2, 3) que simulan la incidencia de una onda electromagnética sobre un medio en distitnas condiciones (ángulo de incidencia). Los scripts producen tanto un .gif como un .avi de la situación simulada.

## planocargas.m
Script que permite al usuario colocar una cantidad arbitrarias de cargas positivas y negativas sobre un plano y luego muestra vectores de campo eléctrico y lineas equipotenciales de la distribución resultante.

## videocargas.m
Genera un .gif y un .avi de dos cargas eléctricas y sus líneas equipotenciales a medida que las cargas se acercan.

## vector.m
Dado un ángulo solicitado por input se gráfica un plano inclinado con una caja de masa m, gráficando sobre el centro de masas de la caja los vectores que denotan la Fuerza Peso y la Fuerza Normal.

## vector2.m
Ídem `vector.m` pero se grafican también las componenetes en x e y del peso, tomando como eje x a una paralela al plano inclinado.

### Dependencias
Algunos de estos scripts se valen de la función [movie2gif de Nicolae Cindea](https://www.mathworks.com/matlabcentral/fileexchange/17463-movie-to-gif-converter) para exportar la película resultante a un archivo .gif, en caso de no disponer de la misma, se deberán comentar las invocaciones a dicha función para evitar un error en el script, inhibiendo a la vez la producción la animación.

Otros utilizan la función [arrow de Erik Johnson](https://www.mathworks.com/matlabcentral/fileexchange/278-arrow) para el gráfico de vectores en un plot.
