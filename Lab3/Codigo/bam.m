function[A,B,C,D]=bam(a,b,c,d,e,f)


%Se inician las matrices
A=zeros(2,2);
B=zeros(2,1);
C=zeros(1,2);
D=0;

%Para obtener los valores de las matrices, se deben realizar las siguientes
%funciones

%X1 = H1(U-X2); en la cual H1 es la función de transferencia del primer bloque
%donde H1 = a/(b*s - c) 
%Despues de una serie de calculos en X1 explicados en el informe, se obtiene la
%siguiente ecuación, a la cual se le aplicó la transformada de Laplace inversa
%X1' = a*u/b + c*x1/b - a*x2/b (1)

%Para X2=H2*X1; en la cual H2 es la función de transferencia del segundo bloque
%donde H2 = d/(e*s - f)
%Se realiza el mismo calculo que en X1, y se obtiene la ecuación
%X2'= d*x1/e + f*x2/e (2)

%Para X' = AX + BU
%Por lo tanto ahora se deben rellenar las matrices
%A
A(1,1)= c/b; %valor obtenido de la constante que acompaña a X1 en (1)
A(1,2)= a/b * (-1); %valor obtenido de la constante que acompaña a X2 en (1)
A(2,1)= d/e; %valor obtenido de la constante que acompaña a X1 en (2)
A(2,2)= f/e; %valor obtenido de la constante que acompaña a X2 en (2)

%B
B(1,1)=a/b; %valor obtenido de la constante que acompaña a "u" en (1)
B(2,1)=0; %Es 0 ya que en (2) no se encuentra la variable "u"

%En el caso de la variables de salida Y(s, esta depende solo de la variable
%de estado X1, por lo tanto Y = X1
%Y = CX + DX
%Por lo tanto C es siempre igual [1 0]
% y D es 0 ya que la variables "u" no se encuentra en este caso
C(1,1)=1;
C(1,2)=0;
D=0;

end
















