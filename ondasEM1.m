clear all;
%Límites START------------------------------------------------------------
Xmin = 0; %Límite inferior del eje X
Xmax = 3; %Límite superior dej eje X
Ymin = -2; %Límite inferior del eje Y
Ymax = 2; %Límite superior del eje Y
Mstart = 3; %Inicio del segundo medio
Mstop = 4; %Fin del segundo medio
Nvacio = 4; %Índice de Refracción del Vacío (Medio 1)
Nmedio = 2; %Índice de Refracción del Medio (Medio 2)
Res = 1000; %Indicada en puntos por unidad.
Lambda0 = 0.5; %Longitud de onda en el vacío
k0 = 2*pi/Lambda0; %Número de onda en el vacío
k1 = Nmedio*2*pi/Lambda0; %Número de onda en el Medio (se deduce fácilmente)
Amp = 0.5; %Amplitud de la onda
%Límites END--------------------------------------------------------------
%Variables START---------------------------------------------------------
X1 = Xmin:1/Res:Mstart;
X2 = Mstart:1/Res:Mstop;
X3 = Mstop:1/Res:Xmax;
axis([Xmin Xmax Ymin Ymax]);
n = 1;
for (wt=0:0.1:1000*pi)
    Y1 = Amp*sin(k0*X1-wt);
    Fase1 = k0*Mstart;
    Y2 = Amp*sin(k1*(X2-Mstart)-wt+Fase1);
    Fase2 = k1*Mstop+Fase1;
    Y3 = Amp*sin(k0*(X3-Mstop)-wt+Fase2);
    Xmedio = [Mstart Mstop Mstop Mstart];
    Ymedio = [Ymax Ymax Ymin Ymin];
    fill(Xmedio,Ymedio,[99/255 1 1]);
    hold on;
    plot(X1,Y1);
    plot(X2,Y2);
    plot(X3,Y3);
    axis([Xmin Xmax Ymin Ymax]);
    text(Xmin+0.1,Ymin+0.5,'Por Ezequiel Wajs');
    M(n) = getframe;
    n = n + 1;
    hold off;
end
movie2gif(M,'cambiodemedioEwajs');
%movieview(M);
