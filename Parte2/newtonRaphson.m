function [valorX] = newtonRaphson(polinomio,iteraciones,error,x0)
    e = 1;
    for i=1: iteraciones
      y= polyval(polinomio,x0); %Se evaluan los puntos en la funcion polinomial
      derPol = polyder(polinomio); %Calculo la derivada del polinomio
      derivada= polyval(derPol,x0); %Obtengo los valores de la derivada del polinomio
      x1 = x0 - (y/derivada); %Aplico funcion de newton-rhapson
      e = abs((x1-x0)/x1);
      x0=x1;

      if(e <= error)
          break;
      end
    end

    valorX=x1;
end
      
      