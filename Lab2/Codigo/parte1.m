clear,clc

% Primera parte de laboratorio

% Se explica como obtener los gráficos de las respuestas de lazo abierto 
% y cerrado de las siguientes funciones

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Funcion 1 %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6*y'(t) + 2*y(t) = 8*u'(t)
% Despues se utilizada la tranformada de Laplace, dejando la función
% expresada en el parametro s. Realizando una serie de calculos la funcion
% de tranferencia quedaría:
% Y(s) = 4*s*u(s) / (3*s+1)

% Definimos el numerador y denominador de la función de transferencia
num1= [4,0];
den1= [3,1];
% Se utiliza tf para definir la función de trasnferencia
s1 = tf(num1,den1);

% Para obtener los polos y zeros de la funcion
[s1_z, s1_p, s1_k] = zpkdata(s1);

% Para obtener el tiempo de estabilizacion se utiliza stepinfo()
s1_estab = stepinfo(s1);

% Gráfico de lazo abierto
figure(1)
step(s1);
title("Función de transferencia 1: Lazo Abierto");
grid on;


%Utilizando la función 'feedback' se calcula el lazo cerrado
%Se coloca 1 como H2 porque el feedback entre dos funciones debe ser el
%mismo que si fuera solo una función (el cual es este caso).
s1_cerrado = feedback(s1,1,-1);


% Para obtener los polos y zeros de la funcion
[s1_cerrado_z, s1_cerrado_p, s1_cerrado_k] = zpkdata(s1_cerrado);

% Para obtener el tiempo de estabilizacion se utiliza stepinfo()
s1_cerrado_estab = stepinfo(s1_cerrado);

%Gráfico de lazo cerrado
figure(2)
step(s1_cerrado);
title("Función de transferencia 1: Lazo Cerrado");
grid on

% Grafico de polos y zeros lazo abierto y cerrado
figure(5)
title("Zeros y polos de función de transferencia 1");
pzmap(s1,"b", s1_cerrado,"r")
legend("abierto", "cerrado")
grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Funcion 2 %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%y''(t) + 6*y'(t) + 3*y(t) = 5*u''(t) + 7*u'(t) + 4*u(t)
%Despues se utilizada la tranformada de Laplace, dejando la función
%expresada en el parametro s. Realizando una serie de calculos la funcion
%de tranferencia quedaría:
%Y(s) = (5*s² + 7*s + 4) / (s² + 6*s + 3)

%Definimos el numerador y denominador de la función de transferencia
num2= [5,7,4];
den2= [1,6,3];
%Se utiliza tf para definir la función de trasnferencia
s2 = tf(num2,den2);

% Para obtener los polos y zeros de la funcion
[s2_z, s2_p ,s2_k] = zpkdata(s2);

% Para obtener el tiempo de estabilizacion se utiliza stepinfo()
s2_estab = stepinfo(s2)

%Gráfico de lazo abierto
figure(3)
step(s2)
title("Función de transferencia 2: Lazo Abierto");
grid on

s2_cerrado = feedback(s2,1,-1);

% Para obtener los polos y zeros de la funcion
[s2_cerrado_z, s2_cerrado_p , s2_cerrado_k] = zpkdata(s2_cerrado);

% Para obtener el tiempo de estabilizacion se utiliza stepinfo()
s2_cerrado_estab = stepinfo(s2_cerrado)

%Gráfico de lazo cerrado
figure(4);
step(s2_cerrado);
title("Función de transferencia 2: Lazo Cerrado");
grid on

% Grafico de polos y zeros lazo abierto y cerrado
figure(6)
title("Zeros y polos de función de transferencia 2");
pzmap(s2,"b", s2_cerrado,"r")
legend("abierto", "cerrado")
grid on;
