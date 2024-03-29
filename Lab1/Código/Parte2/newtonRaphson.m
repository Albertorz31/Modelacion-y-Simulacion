function [valorX] = newtonRaphson(polinomio,iteraciones,error,x0)
    if(iteraciones==0) %Condicion inicial
        valorX =x0;
    else
        y= polyval(polinomio,x0); %Se evaluan los puntos en la funcion polinomial
        derPol = polyder(polinomio); %Calculo la derivada del polinomio
        derivada= polyval(derPol,x0); %Obtengo los valores de la derivada del polinomio
        x1 = x0 - (y/derivada); %Aplico funcion de newton-rhapson
        y1 = polyval(polinomio,x1);
        if(y1<error)
            valorX=x1;
        else
            valorX = newtonRaphson(polinomio,iteraciones-1,error,x1);
        end
    end
end
      
      