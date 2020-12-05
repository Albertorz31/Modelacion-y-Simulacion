%Segunda parte de laboratorio

%Se define s
s = tf('s');

%Se definen las funciones de transferencia del sistema
H1 = 8*s / (4*s + 6);
H2 = 6 / (s + 5);
H3 = (4*s+3)/(3*s^3 + 5*s^2 + 1);
H4 = 6 / (7*s + 1);
H5 = (5*s + 3)/(5*s^3 + s^2 + 4);
H6 = (5*s + 1)/(s^3 + 6*s^2 + 5);

% Operaciones para obtener la funcion de transferencia final
B1 = H1 + H2;
B2 = feedback(H3,1,1);
B3 = H4 + H5;

final = B1 + (H6 * B3 * B2);


figure(6)
step(final)
title("Respuesta al escalón");
grid on



