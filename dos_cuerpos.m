function dxdt = dos_cuerpos(t, x, m1, m2)
% Función que devuelve las ecuaciones de movimiento de dos cuerpos en tres
% dimensiones

% Parámetros de entrada:
% t: tiempo (s), No lo usamos pero hay que tenerlo 
% x: vector columna con las coordenadas y velocidades iniciales del
% sistema:
%       -x(1-3): posición cuerpo 1
%       -x(4-6): velocidad cuerpo 1
%       -x(7-9): posición cuerpo 2
%       -x(10-12): velocidad cuerpo 2
% m1: masa del cuerpo 1 (kg).
% m2: masa del cuerpo 2 (kg).

% Parámetros de salida:
% dxdt: vector columna con las ecuaciones de movimiento, ordenadas de la 
% misma manera que el vector de entrada x. Se llama dxdt para que sepamos
% que son los parametros de los que queremos resolver una EDO, pero
% realmente depende de la coordenada(dy/dt, dz/dt) y de la velocidad
% (dvx/dt, dvy/dt, dvz/dt).

% Constante gravitacional
G = 6.67428e-11;

%Declaramos las posiciones y velocidades por claridad

% Posiciones de los cuerpos
x1 = x(1);
y1 = x(2);
z1 = x(3);

x2 = x(7);
y2 = x(8);
z2 = x(9);

% Velocidades de los cuerpos
vx1 = x(4);
vy1 = x(5);
vz1 = x(6);

vx2 = x(10);
vy2 = x(11);
vz2 = x(12);


% Distancia entre los cuerpos
r12 = sqrt((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2);

% Ecuaciones de la masa 1
dxdt(1) = vx1; %Posición x
dxdt(2) = vy1; %Posición y
dxdt(3) = vz1; %Posición z
dxdt(4) = G * m2 * (x2 - x1) / r12^3; %velocidad x
dxdt(5) = G * m2 * (y2 - y1) / r12^3; %velocidad y
dxdt(6) = G * m2 * (z2 - z1) / r12^3; %velocidad z

% Ecuaciones de la masa 2
dxdt(7) = vx2; %Posición x
dxdt(8) = vy2; %Posición y
dxdt(9) = vz2; %Posición z
dxdt(10) = G * m1 * (x1 - x2) / r12^3; %velocidad x
dxdt(11) = G * m1 * (y1 - y2) / r12^3; %velocidad y
dxdt(12) = G * m1 * (z1 - z2) / r12^3; %velocidad z

dxdt=dxdt';
end
