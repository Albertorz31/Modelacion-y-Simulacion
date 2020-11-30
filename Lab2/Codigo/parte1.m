clear,clc

%Primera parte de laboratorio

%ADVERTENCIA: Se dejaron todos los graficos (step) comentados, si se desean
%ver se deben descomentar


%Se explica como obtener los gráficos de las respuestas de lazo abierto
%y cerrado de las siguientes funciones

%%%%%%Funcion 1%%%%%%

%6*y'(t) + 2*y(t) = 8*u'(t)
%Despues se utilizada la tranformada de Laplace, dejando la función
%expresada en el parametro s. Realizando una serie de calculos la funcion
%de tranferencia quedaría:
%Y(s) = 4*s*u(s) / (3*s+1)

%Definimos el numerador y denominador de la función de transferencia
num1= [4,0];
den1= [3,1];
%Se utiliza tf para definir la función de trasnferencia
s1 = tf(num1,den1);

%Gráfico de lazo abierto
%step(s1)
%title("Función de transferencia 1: Lazo Abierto");
%grid on

%Utilizando la función 'feedback' se calcula el lazo cerrado
%Se coloca 1 como H2 porque el feedback entre dos funciones debe ser el
%mismo que si fuera solo una función (el cual es este caso).
s_cerrado = feedback(s1,1);

%Gráfico de lazo cerrado
%step(s_cerrado)
%title("Función de transferencia 1: Lazo Cerrado");
%grid on

%%%%%%Funcion 2%%%%%%

%y''(t) + 6*y'(t) + 3*y(t) = 5*u''(t) + 7*u'(t) + 4*u(t)
%Despues se utilizada la tranformada de Laplace, dejando la función
%expresada en el parametro s. Realizando una serie de calculos la funcion
%de tranferencia quedaría:
%Y(s) = (5*s² + 7*s + 4) / (s² + 6*s)

%Definimos el numerador y denominador de la función de transferencia
num2= [5,7,4];
den2= [1,6,3];
%Se utiliza tf para definir la función de trasnferencia
s2 = tf(num2,den2);

%Gráfico de lazo abierto
%step(s2)
%title("Función de transferencia 2: Lazo Abierto");
%grid on

s_cerrado2 = feedback(s2,1);
%Gráfico de lazo cerrado
%step(s_cerrado2)
%title("Función de transferencia 2: Lazo Cerrado");
%grid on

%Funcion 3

%Dale chun inventa alguno










