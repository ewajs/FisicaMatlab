%Genera un GIF y un Movie con las lineas equipotenciales de 2 cargas opuestas acercándose.
clear all
axes
axis([-1 1 -1 1])
axis square
title('Lineas Equipotenciales - Por Ezequiel Wajs');
h = get(gcf);%handler a los ejes (x las dudas - NO USADO)

[X Y] =meshgrid(-1:.01:1);
[Xred Yred] = meshgrid(-1:0.15:1);
Potencial = inline(vectorize('1/((X-xcur)^2+(Y-ycur)^2)^0.5'),'X','Y','xcur','ycur');
versorear = inline(vectorize('Ex/(Ex^2+Ey^2)^.5'),'Ex','Ey');
y(1) = 0;
y(2) = 0;
t = 200:-5:3;
framemax = 40;
flag = 1;
for frame = 1:framemax     
    x(1) = -0.8+(0.75/framemax)*frame;
    x(2) = 0.8-(0.75/framemax)*frame;    
    V = Potencial(X,Y,x(1),y(1));       
    %Vred = Potencial(Xred,Yred,x(2),y(2));
    V = V - Potencial(X,Y,x(2),y(2));        
    %Vred = Vred - Potencial(Xred,Yred,x(2),y(2)); 
    %[Ex,Ey] = gradient(-500*Vred); 
    %Ex = versorear(Ex,Ey);
    %Ey = versorear(Ey,Ex);
    %Elevs = Emin:Einc:Emax;
    V = abs(V);
    if (flag) %primera corrida
        Vmin = floor(min(V(:)));
        Vmax = ceil(max(V(:)));
        Vinc =(Vmax - Vmin) / 700;
        Vlevs = Vmax./((t).^2);
        flag = 0;
    end
    contour(X,Y,V,Vlevs);
    hold on;
    plot(x(1),y(1),'or')
    text(x(1)+0.02,y(1),'+Q')
    plot(x(2),y(2),'og')
    text(x(2)+0.02,y(2),'-Q')
    colormap autumn;
    %quiver(Xred,Yred, Ex, Ey);
    M(frame) = getframe;
    hold off;
end
    movieview(M);
    movie2gif(M,'videocargasEwajs');
