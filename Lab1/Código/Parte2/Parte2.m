clear,clc

%-------------------------------------------------------------------------------------%
%                           Segunda parte
%-------------------------------------------------------------------------------------%



%-----------------------------------------------------------------------------------%
%En el primer caso tenemos que entregar como resultado una raiz de una funcion dada
%-----------------------------------------------------------------------------------%

%-----------Ingresar por consola las variables------------
%Ingresar polinomio
pol='Ingrese polinomio:';
polinomio = input(pol);

%Ingresar iteraciones
ite='Ingrese la cantidad de interaciones:';
iteraciones = input(ite);

%Ingresar error
err='Ingrese error:';
error=input(err);

%Ingresar valor inicial x0
valInicial='Ingresar valor inicial x0:';
x0= input(valInicial);

%Ahora se debe aplicar el método de Newton-Rhapson
salida = newtonRaphson(polinomio,iteraciones,error,x0);
salida





