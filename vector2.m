%PLANO INCLINADO - AUTOR: EZEQUIEL WAJS
clear all

Angulo = input('Ingrese �ngulo en grados :');
Angulo = Angulo*2*pi/360;
Base = 5; %el 0,0 es la esquina inferior izquierda
LadoCaja = 1;
Masa = 0.1 + 0.05*sin(Angulo); %Modulo la masa para que aumente con el �ngulo.
Peso = Masa*10;
PesoX = Peso*sin(Angulo);
PesoY = Peso*cos(Angulo);
Normal = PesoY;
AlturaPlano = Base*tan(Angulo);
%Centro de Masas de la Caja
CentroX = Base/2;
CentroY = CentroX*tan(Angulo) + LadoCaja/(2*cos(Angulo));
Centro = [CentroX CentroY];
%V�rtices de la caja
P1X = CentroX - (LadoCaja/2 + LadoCaja*tan(Angulo)/2)*cos(Angulo); %Se demuestra gr�ficamente. 
P1Y = CentroX*tan(Angulo) + (LadoCaja/2 + LadoCaja*tan(Angulo)/2)*sin(Angulo);
P1 = [P1X P1Y];
P2X = P1X + LadoCaja*sin(Angulo);
P2Y = P1Y + LadoCaja*cos(Angulo);
P2 = [P2X P2Y];
P3X = P2X + LadoCaja*cos(Angulo);
P3Y = P2Y - LadoCaja*sin(Angulo);
P3 = [P3X P3Y];
P4X = P1X + LadoCaja*cos(Angulo);
P4Y = P1Y - LadoCaja*sin(Angulo);
VX = [P1X P2X P3X P4X];%Array de X
VY = [P1Y P2Y P3Y P4Y];%Array de Y

%Dibujo
hold off
fill([Base 0 0],[0 AlturaPlano 0],[153/255 51/255 0/255]);
hold on
fill(VX, VY, [255/255 102/255 0])
plot(CentroX,CentroY,'O');
axis image
if (AlturaPlano > Base)
    axis ([0 Base 0 AlturaPlano]);
else
    axis ([0 Base 0 Base]);
end
%Vector Peso
Hp = arrow(Centro, [CentroX CentroY-Peso]);
text(CentroX, (CentroY-Peso)*0.95,'P','FontSize', 20, 'FontWeight', 'bold');
%Vector PesoX
Hp = arrow(Centro, [CentroX+PesoX*cos(Angulo) CentroY-PesoX*sin(Angulo)]);
set(Hp,'FaceColor','b','EdgeColor','b');
text((CentroX+PesoX*cos(Angulo))*1.02, (CentroY-PesoX*sin(Angulo))*.98,'P_x','FontSize', 20, 'FontWeight', 'bold');
%Vector PesoY
Hp = arrow(Centro, [CentroX-Normal*sin(Angulo) CentroY-Normal*cos(Angulo)]);
text((CentroX-Normal*sin(Angulo))*0.9, (CentroY-Normal*cos(Angulo))*.9,'P_y','FontSize', 20, 'FontWeight', 'bold')
set(Hp,'FaceColor','b','EdgeColor','b');
%Vector Normal
Hp = arrow(Centro, [CentroX+Normal*sin(Angulo) CentroY+Normal*cos(Angulo)]);
text((CentroX+Normal*sin(Angulo))*1.02, (CentroY+Normal*cos(Angulo))*1.02,'N','FontSize', 20, 'FontWeight', 'bold')
