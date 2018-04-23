%Se van colocando cargas y se muestran las lineas equipotenciales.
clear all
axes
axis([-1 1 -1 1])
axis square
title('Lineas Equipotenciales - Por Ezequiel Wajs');
h = get(gcf)%handler a los ejes (x las dudas - NO USADO)
hold on
S = sprintf('Puede colocar cargas en el plano.\nBotón Izquierdo: +Q.\nBotón Derecho: -Q.\nRueda: Ver Equipotenciales.\nPresione una tecla del teclado para continuar');
msg = msgbox(S, 'Instrucciones') 
n=1;
[X Y] =meshgrid(-1:.01:1);
[Xred Yred] = meshgrid(-1:0.15:1);
Vred = 0;
V = 0;
k = 1
Potencial = inline(vectorize('1/((X-xcur)^2+(Y-ycur)^2)^0.5'),'X','Y','xcur','ycur');
while(n < 3)
    [x(n) y(n) b] = ginput(1)
    x(n)
    y(n)
    if (b == 1)
        plot(x(n),y(n),'or')
        text(x(n)+0.02,y(n),'+Q')
        k = 1
    elseif (b == 3)
        plot(x(n),y(n),'og')
        text(x(n)+0.02,y(n),'-Q')
        k = -1
    else
       break
    end
         V = V + k*Potencial(X,Y,x(n),y(n));
         Vred = Vred +k*Potencial(Xred,Yred,x(n),y(n));
    n = n + 1
end
[Ex,Ey] = gradient(-500*Vred);
versorear = inline(vectorize('Ex/(Ex^2+Ey^2)^.5'),'Ex','Ey');
%Ex = versorear(Ex,Ey);
%Ey = versorear(Ey,Ex);
V = abs(V);
Vmin = floor(min(V(:)));
Vmax = ceil(max(V(:)));
Vinc =(Vmax - Vmin) / 700;
%Elevs = Emin:Einc:Emax;
t = 60:-1.5:3;
Vlevs = Vmax./((t).^2);
contour(X,Y,V,Vlevs);
colormap autumn;
Aux = -1:.01:1;
quiver(Xred,Yred, Ex, Ey);
print -djpeg100 EquipotencialesByEWajs;
