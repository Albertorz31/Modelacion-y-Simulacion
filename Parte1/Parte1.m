clear,clc

%En la primera parte del laboratorio tenemos que graficar funciones


%-------------------------------------------------------------------------------------%
%Para el primer caso se debe graficar por separado y conjunto las siguientes funciones
%-------------------------------------------------------------------------------------%

%-----------Gráficos de funciones por separado------------

%-------Función 1---------
%Para obtener log5(x) se aplica propiedad del logaritmo 
%log_a(X) = log_b(x)/ log_ b(a)
x = 0:.01:15*pi;% Defino los puntos a ser evaluados por la funcion como se indica
a = 8*(log(4*x+12)/log(5)); 
%Se gráfica la primera funcion (en rojo con *)
figure1 = figure;
plot(x,a,'r *');
title('Función a(x) = 8log5(4x+12)');
ylabel('funcion a(x)');
xlabel('x');

%-------Función 2---------
%b(x) = sen(6(log2(x+9))) + cos(7(log6(4x+32)))
%Al igual que en la funcion anterior se aplica la propiedad de logaritmos
%en log6(4x+32)
x2 = 0:0.01:15*pi;
b = sin(6*(log2(x2+9))) + cos(7*(log(4*x2+32)/log(6)));
%Se gráfica la primera funcion (en verde con +)
figure2 = figure;
plot(x2,b,'g +');
title('Función b(x) = sen(6(log2(x+9))) + cos(7(log6(4x+32)))');
ylabel('funcion b(x)');
xlabel('x');


%-----------Gráficos de funciones juntas------------
figure3=figure;
hold on;
title('Fuciones a(x) y b(x) juntas')
plot(x,a,'r +');
plot(x2,b,'g +');
legend('a(x)','b(x)');


%-------------------------------------------------------------------------------------%
%Segundo caso graficar em escala normal y logarítmica la siguiente funcion
%-------------------------------------------------------------------------------------%

%-------Función---------
%c(x) = 6e^(x+18)

%Escala normal
x3 = -10:0.05:10; %Defino los puntos a ser evaluados por la funcion como se indica
c = 6 * exp(x3+18);
figure4=figure;
plot(x3,c,'g+');
title('Función 6*exp(x+18)en Escala normal');
ylabel('Funcion c(x)');
xlabel('x');
grid on;
%Escala logaritmica
figure5=figure;
semilogy(x3,c,'r-');
title('Función 6*exp(x+18) en Escala Logarítmica');
ylabel('Funcion c(x)');
xlabel('x');
grid on; %Muestra el grafico con grilla



