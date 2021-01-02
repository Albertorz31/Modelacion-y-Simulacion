
clear,clc

%-------------------------------------------------------------------------------------%
%                           Primera parte
%-------------------------------------------------------------------------------------%




%En el primer caso tenemos que entregar como resultado las matrices
%correspondientes al modelo de estado

%-----------Ingresar por consola los valores a, b,c ,d ,e, f------------
%Ingresar polinomio
val1='Ingrese a:';
a = input(val1);
val2='Ingrese b:';
b = input(val2);
val3='Ingrese c:';
c = input(val3);
val4='Ingrese d:';
d = input(val4);
val5='Ingrese e:';
e = input(val5);
val6='Ingrese f:';
f = input(val6);

%Se obtienen las matrices del modelo de estado
[A,B,C,D]=bam(a,b,c,d,e,f)

%Ahora se obtiene las funciones de transferencia H con las matrices
%anteriores
[H]=mab(A,B,C,D)





