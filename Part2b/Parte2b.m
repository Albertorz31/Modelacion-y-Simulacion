clc;
clear;

vector = input('Ingrese vector: ');
%vector = [1 2 5 6 4 6 7]

check = isnumeric(vector);
if check == 1
    vectorSize = size(vector);
    if vectorSize(1) == 1 && vectorSize(2) > 4
        mayor = maxk(vector,4);
        menor = mink(vector,4);
        resultado = sqrt(sum(mayor)) - sqrt(sum(menor))
    else
        disp("El vector debe ser mayor a 4");
    end
else
    disp("El vector no fue ingresado de manera correcta");
end
