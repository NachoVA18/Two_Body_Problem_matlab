%Resolución del problema de los 2 cuerpos mediante el método Runge-kutta

%Fijamos el salto
dt = 0.1;%(s)
%Fijamos el tiempo final 
t = 1000;%(s)

%Fijamos la masa del 1º
m1 = 6*10^23; %(kg)
%Fijamos la masa del 2º
%m2 = 6*10^23; %(kg)

%fijamos la función
f = @(t,x) dos_cuerpos(t, x, m1, m2); % función anónima con los valores de m1 y m1 predefinidos

%Fijamos valores iniciales
% Cuerpo 1
x1_0 = 0;
y1_0 = 0;
z1_0 = 0;
vx1_0 = 0;
vy1_0 = -10^3;
vz1_0 = 3000;

% Cuerpo 2
x2_0 = 10^6;
y2_0 = 0;
z2_0 = 0;
vx2_0 = 0;
vy2_0 = 10^3;
vz2_0 = -3000;

%Lo metemos todo en el vector
x = [x1_0; y1_0; z1_0; vx1_0; vy1_0; vz1_0; x2_0; y2_0; z2_0; vx2_0; vy2_0; vz2_0];

%Llamamos al metodo Runge Kutta
a = runge_kutta(f,x,dt,t);
% Esta matriz nos devuelve la siguiente estructura
%       -a(1-3): posición cuerpo 1
%       -a(4-6): velocidad cuerpo 1
%       -a(7-9): posición cuerpo 2
%       -a(10-12): velocidad cuerpo 2

% Configuración de la animación
fig = figure();
hold on;
axis equal;
xlim([-10 10^6]);
ylim([-5*10^5 5*10^5]);
zlim([-4*10^5 4*10^5]);
grid on;
view(-45,30);
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
title('Órbita de dos cuerpos');

% Creamos los objetos gráficos para los cuerpos
h1 = plot3(a(1,:), a(2,:), a(3,:), 'bo', 'MarkerSize', 3, 'MarkerFaceColor', 'b');
h2 = plot3(a(7,:), a(8,:), a(9,:), 'ro', 'MarkerSize', 3, 'MarkerFaceColor', 'r');

% Creamos una estructura con los datos de los cuerpos
datos_cuerpos = struct('x1', a(1,:), 'y1', a(2,:), 'z1', a(3,:), 'x2', a(7,:), 'y2', a(8,:), 'z2', a(9,:));
    
    % Animación de la órbita
    for i=1:length(a)
    set(gcf, 'Color', [0 0 0])
    datos_cuerpos = struct('x1', a(1,i), 'y1', a(2,i), 'z1', a(3,i), 'x2', a(7,i), 'y2', a(8,i), 'z2', a(9,i));
    actualiza_datos(datos_cuerpos, h1, h2);
    pause(0.001);
    end
    
% Graficar las posiciones en 3D
figure(2);
plot3(a(1,:), a(2,:), a(3,:), 'MarkerSize', 10);
hold on;
plot3(a(7,:), a(8,:), a(9,:), 'MarkerSize', 10);
xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
zlabel('$z$','Interpreter','latex');
legend('Cuerpo 1', 'Cuerpo 2','Interpreter','latex');
title('Posición de los cuerpos en el espacio');

% Función para actualizar los datos de los objetos gráficos
function actualiza_datos(datos_cuerpos, h1, h2)
    set(h1, 'XData', datos_cuerpos.x1, 'YData', datos_cuerpos.y1, 'ZData', datos_cuerpos.z1);
    set(h2, 'XData', datos_cuerpos.x2, 'YData', datos_cuerpos.y2, 'ZData', datos_cuerpos.z2);
end


