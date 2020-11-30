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

%Conexiones del sistema
A1 = feedback(H3,1)
A2 = parallel(H4,H5)
A3 = series(A1,A2)
A4 = series(A3,H6)
A5 = parallel(H1,H2)
final = parallel(A5,A4)


step(final)
title("Respuesta al escalón");
grid on



