clear all;
%L�mites START------------------------------------------------------------
Xmin = 0; %L�mite inferior del eje X
Xmax = 3; %L�mite superior dej eje X
Ymin = -2; %L�mite inferior del eje Y
Ymax = 2; %L�mite superior del eje Y
Mstart = 1; %Inicio del segundo medio
Mstop = 2; %Fin del segundo medio
Nvacio = 1; %�ndice de Refracci�n del Vac�o (Medio 1)
Nmedio = 3; %�ndice de Refracci�n del Medio (Medio 2)
Res = 1000; %Indicada en puntos por unidad.
Lambda0 = 0.1; %Longitud de onda en el vac�o
k0 = 2*pi/Lambda0; %N�mero de onda en el vac�o
k1 = Nmedio*2*pi/Lambda0; %N�mero de onda en el Medio (se deduce f�cilmente)
Amp = 0.1; %Amplitud de la onda
vel = 1; %Velocidad en el vac�o
w = vel/Lambda0; %Velocidad angular
Tita = pi/4; %�ngulo de incidencia (rad)
PInicioY = -1.5; %Altura inicial del rayo
%L�mites END--------------------------------------------------------------
%Variables START---------------------------------------------------------
X1 = Xmin:1/Res:Mstart;
X2 = Mstart:1/Res:Mstop;
X3 = Mstop:1/Res:Xmax;

Xmedio = [Mstart Mstop Mstop Mstart];
Ymedio = [Ymax Ymax Ymin Ymin];
t = 0:.01:6;
TitaR = asin(sin(Tita)/Nmedio);
tchange1 = Mstart/(vel*cos(Tita));
tchange2 = tchange1 + Nmedio*(Mstop - Mstart)/(vel*cos(TitaR));
for (n=1:numel(t))
    if (t(n) <= tchange1)
        Xfin = vel*cos(Tita)*t(n);
    elseif (t(n) <= tchange2)
        Xfin = Mstart + vel*cos(TitaR)*(t(n) - tchange1)/Nmedio;
    else
        Xfin = Mstop + vel*cos(Tita)*(t(n) - tchange2);
    end
    fill(Xmedio,Ymedio,[99/255 1 1]);
    hold on;
    if (Xfin <= Mstart)
        X1 = Xmin:1/Res:Xfin;
        Y1 = Amp*sin(k0*X1-w*t(n));
        Yrect1 = PInicioY + tan(Tita)*X1;
        plot(X1,Y1+Yrect1);
        plot(X1,Yrect1,'r');
    elseif (Xfin <= Mstop)
        X1 =Xmin:1/Res:Mstart;
        X2 = Mstart:1/Res:Xfin;
        Y1 = Amp*sin(k0*X1-w*t(n));
        Fase1 = k0*Mstart;
        Y2 = Amp*sin(k1*(X2-Mstart)-w*t(n)+Fase1);
        Yrect1 = PInicioY + tan(Tita)*X1;
        Yrect2 = Yrect1(numel(Yrect1)) + tan(TitaR)*(X2-Mstart);
        plot(X1,Y1+Yrect1);
        plot(X2,Y2+Yrect2);
        plot(X1,Yrect1,'r');
        plot(X2,Yrect2,'r');
    else%if (Xfin <= Xmax)
        X1 = Xmin:1/Res:Mstart;
        X2 = Mstart:1/Res:Mstop;
        X3 = Mstop:1/Res:Xfin;
        Y1 = Amp*sin(k0*X1-w*t(n));
        Fase1 = k0*Mstart;
        Y2 = Amp*sin(k1*(X2-Mstart)-w*t(n)+Fase1);
        Fase2 = k1*(Mstop-Mstart)+Fase1;
        Y3 = Amp*sin(k0*(X3-Mstop)-w*t(n)+Fase2);
        Yrect1 = PInicioY + tan(Tita)*X1;
        Yrect2 = Yrect1(numel(Yrect1)) + tan(TitaR)*(X2-Mstart);
        Yrect3 = Yrect2(numel(Yrect2)) + tan(Tita)*(X3-Mstop);
        plot(X1,Y1+Yrect1);
        plot(X2,Y2+Yrect2);
        plot(X3,Y3+Yrect3);
        plot(X1,Yrect1,'r');
        plot(X2,Yrect2,'r');
        plot(X3,Yrect3,'r');
    end
    axis([Xmin Xmax Ymin Ymax]);
    text(Mstart+0.1,Ymin+0.5,'Por Ezequiel Wajs');
    M(n) = getframe;
    hold off;
end
movie2gif(M,'ondasEM3Ewajs');
movie2avi(M,'ondasEM3Ewajs','fps',40,'compression','Cinepak');
movieview(M);

