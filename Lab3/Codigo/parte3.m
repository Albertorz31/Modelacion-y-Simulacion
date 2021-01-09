clear,clc

%-------------------------------------------------------------------------------------%
%                           Tercera parte
%-------------------------------------------------------------------------------------%

%Para esta parte se utilizan los mismos datos de la segunda parte

%Los valores que se le dá a los parametros son
A1=2;
A2=4;
R1=0.25;
R2=0.0625;

%Se inician las matrices
A=zeros(2,2);
B=zeros(2,1);
C=zeros(2,2);
D=zeros(2,1);
%Las matrices de las ecuaciones de estado son:
A(1,1)= -1/(A1*R1);
A(1,2)= 1/(A1*R1);
A(2,1)= 1/(R1*A2);
%A(2,2)= -1/(A2*(R1+R2));
A(2,2)= -(1/R1+1/R2)*(1/A2);
B(1,1)= 1/A1;
B(2,1)= 0;
C(1,1)=1;
C(2,2)=1;

%Modelo de estado
M = ss(A,B,C,D);

%Los tres tiempos de muestreos definidos son
T1 = 0.001;
T2 = 0.1;
T3 = 2;

%Para realizar la discretizacion del modelo se utiliza la funcion c2d y se
%aplica el algoritmo Zero order hold y First order hold

%La definicion de u(t) para T1 corresponde a:
t1 = 0:T1:50;
u1 = 100*sin(t1/4);
u1(u1<0) = 0.;

%Para graficar se utiliza la funcion lsim y se utiliza la funcion u(t)
%definida anteriormente
figure(1)
M1_z = c2d(M,T1,"zoh");
lsim(M1_z, u1, t1);
title("Discretización con algoritmo zoh con T1");

figure(2)
M1_f = c2d(M,T1,"foh");
lsim(M1_f, u1, t1);
title("Discretización con algoritmo foh con T1");


%La definicion de u(t) para T2 corresponde a:
t2 = 0:T2:50;
u2 = 100*sin(t2/4);
u2(u2<0) = 0.;

figure(3)
M2_z = c2d(M,T2,"zoh");
lsim(M2_z, u2, t2);
title("Discretización con algoritmo zoh con T2");

figure(4)
M2_f = c2d(M,T2,"foh");
lsim(M2_f, u2 ,t2);
title("Discretización con algoritmo foh con T2");


%La definicion de u(t) para T3 corresponde a:
t3 = 0:T3:50;
u3 = 100*sin(t3/4);
u3(u3<0) = 0.;

figure(5)
M3_z = c2d(M,T3,"zoh");
lsim(M3_z, u3, t3);
title("Discretización con algoritmo zoh con T3");

figure(6)
M3_f = c2d(M,T3,"foh");
lsim(M3_f, u3, t3);
title("Discretización con algoritmo foh con T3");