clear,clc

%-------------------------------------------------------------------------------------%
%                           Segunda parte
%-------------------------------------------------------------------------------------%

%Se debe analizar la respuesta del sistema ante un impulso, escalón y una
%función u(t)

%Se tiene que:
%Fe: Flujo de entrada
%R1: Resitencia 1
%h1: Nivel de agua del estanque 1
%h2: Nivel de agua del estanque 2
%Fi: Flujo intermedio
%A1: Area de superficie del estanque 1
%A2: Area de superficie del estanque 2
%R2: Resistencia2
%Fs: Flujo de salida

%La variable de entrada es Fe
%Las variables de salida escogidas son las alturas o nivel de agua: h1 y h2
%La variables de estado son: h1 y h2

%Para analizar la respuesta del sistema respecto a diferentes entrada
%Los valores que se le dá a los parametros son
A1=2;
A2=4;
R1=0.25;
R2=0.0625;

%Elaboramos el modelo fenomenologico
%dV1/dt = Fe - Fi
%dV2/dt = Fi - Fs
%Fi = h1-h2/R1
%Fs = h2/R2
%V1 = A1*h1
%V2 = A2*h2

%Por lo tanto
%dV1/dt = Fe - (h1-h2)/R1 => d(h1)/dt = Fe/A1 - (h1-h2)/R1*A1
%dv2/dt = h1-h2/R1 - h2/R2 0> d(h2)/dt = h1-h2/R1*A2 - h2/R2*A2


%Representacion matricial
%considerando: X' = AX + BU, se tiene entonces:
%d(h1)/dt = (-1/A1*R1)*X1 + (1/A1*R1)*X2 + (1/A1)*u
%d(h2)/dt = (1/R1*A2)*X1 - (1/(A2*(R1+R2)))X2 + 0*u

%Para el modelo de salida se sabe que y1=h1; y2=h2
%Y = CX +DU

%Se inician las matrices
A=zeros(2,2);
B=zeros(2,1);
C=zeros(2,2);
D=zeros(2,1);
%Entonces las matrices de las ecuaciones de estado son:
A(1,1)= -1/A1*R1;
A(1,2)= 1/A1*R1;
A(2,1)= 1/R1*A2;
A(2,2)= 1/(A2*(R1+R2));
B(1,1)= 1/A1;
B(2,1)= 0;
C(1,1)=1;
C(2,2)=1;

%Obtenemos el modelo de estado
M=ss(A,B,C,D);


%%%%%%%%%Caso1%%%%%%%%%%%
%Se grafica cuando se tiene un escalon como entrada
step(M) %step grafica respecto a un escalon como entrada

%%%%%%%%%Caso2%%%%%%%%%%%
%Se grafica cuando se tiene un impulso como entrada
impulse(M) %step grafica respecto a un impulso como entrada

%%%%%%%%%Caso3%%%%%%%%%%%
%Se grafica cuando se tiene una función u(t) como entrada

%La definicion de u(t) corresponde a:
t = linspace(0, 12*pi , 5000);
u = 100* sin(t/4);
u(u<0) = 0.;
lsim(M, u, t); %step grafica respecto a una funcion u(t) como entrada

















