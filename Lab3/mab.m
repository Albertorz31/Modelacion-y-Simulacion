function[H]= mab(A,B,C,D)

%se tienen las ecuaciones del modelo anterior
%X = AX + BU 
%Y = CX + DU
%Aplicando transformada de Laplace queda
%sX = AX + BU (1)
%y = CX + DU (2)
%Como estamos interesados en H(s) y este es independiente de las
%condiciones inciales, se eliminó x(0) en la ecuación anterior (1)
%Despues de factorizar (1) se obtiene
% X = (sI - A)^⁻1 * BU; donde I es la matriz de identidad
%Se reemplaza X en Y y despues de una serie de calculos se obtiene H(s)
%H(s) = C(sI -A)^⁻1 * B + D

I = [1 0;0 1]; %matriz de identidad
s = tf('s');
aux= s*I - A;
aux_inv = inv(aux);
aux2 = C*aux_inv;
H = aux2*B + D;

end

