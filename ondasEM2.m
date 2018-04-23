clear all;
%Límites START------------------------------------------------------------
Xmin = 0; %Límite inferior del eje X
Xmax = 3; %Límite superior dej eje X
Ymin = -2; %Límite inferior del eje Y
Ymax = 2; %Límite superior del eje Y
Mstart = 1; %Inicio del segundo medio
Mstop = 2; %Fin del segundo medio
Nvacio = 1; %Índice de Refracción del Vacío (Medio 1)
Nmedio = 2.5; %Índice de Refracción del Medio (Medio 2)
Res = 1000; %Indicada en puntos por unidad.
Lambda0 = 0.5; %Longitud de onda en el vacío
k0 = 2*pi/Lambda0; %Número de onda en el vacío
k1 = Nmedio*2*pi/Lambda0; %Número de onda en el Medio (se deduce fácilmente)
Amp = 0.5; %Amplitud de la onda
vel = 1; %Velocidad en el vacío
w = vel/Lambda0; %Velocidad angular
%Límites END--------------------------------------------------------------
%Variables START---------------------------------------------------------
X1 = Xmin:1/Res:Mstart;
X2 = Mstart:1/Res:Mstop;
X3 = Mstop:1/Res:Xmax;

Xmedio = [Mstart Mstop Mstop Mstart];
Ymedio = [Ymax Ymax Ymin Ymin];
t = 0:.01:6;
tchange1 = Mstart/vel;
tchange2 = tchange1 + Nmedio*(Mstop - Mstart)/vel;
for (n=1:numel(t))
    if (t(n) <= tchange1)
        Xfin = vel*t(n);
    elseif (t(n) <= tchange2)
        Xfin = Mstart + vel*(t(n) - tchange1)/Nmedio;
    else
        Xfin = Mstop + vel*(t(n) - tchange2);
    end
    fill(Xmedio,Ymedio,[99/255 1 1]);
    hold on;
    if (Xfin <= Mstart)
        X1 = Xmin:1/Res:Xfin;
        Y1 = Amp*sin(k0*X1-w*t(n));
        plot(X1,Y1);
    elseif (Xfin <= Mstop)
        X1 = Xmin:1/Res:Mstart;
        X2 = Mstart:1/Res:Xfin;
        Y1 = Amp*sin(k0*X1-w*t(n));
        Fase1 = k0*Mstart;
        Y2 = Amp*sin(k1*(X2-Mstart)-w*t(n)+Fase1);
        plot(X1,Y1);
        plot(X2,Y2);
    elseif (Xfin <= Xmax)
        X1 = Xmin:1/Res:Mstart;
        X2 = Mstart:1/Res:Mstop;
        X3 = Mstop:1/Res:Xfin;
        Y1 = Amp*sin(k0*X1-w*t(n));
        Fase1 = k0*Mstart;
        Y2 = Amp*sin(k1*(X2-Mstart)-w*t(n)+Fase1);
        Fase2 = k1*Mstop+Fase1;
        Y3 = Amp*sin(k0*(X3-Mstop)-w*t(n)+Fase2);
        plot(X1,Y1);
        plot(X2,Y2);
        plot(X3,Y3);
    elseif (Xfin >= Xmax)
        X1 = Xmin:1/Res:Mstart;
        X2 = Mstart:1/Res:Mstop;
        X3 = Mstop:1/Res:Xmax;
        Y1 = Amp*sin(k0*X1-w*t(n));
        Fase1 = k0*Mstart;
        Y2 = Amp*sin(k1*(X2-Mstart)-w*t(n)+Fase1);
        Fase2 = k1*Mstop+Fase1;
        Y3 = Amp*sin(k0*(X3-Mstop)-w*t(n)+Fase2);
        plot(X1,Y1);
        plot(X2,Y2);
        plot(X3,Y3);        
    end
    axis([Xmin Xmax Ymin Ymax]);
     text(Mstart+0.1,Ymin+0.5,'Por Ezequiel Wajs');
    M(n) = getframe;
    hold off;
end
movie2avi(M,'ondasEM2Ewajs','fps',40,'compression','Cinepak');
movieview(M);
