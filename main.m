clc, clear, close all, format short g
% Parameters 
mu = 398600.5;              % Earth's gravitational parameter(km^3/s^2)
t = 0:30:720;               % Time span (s)
M = (0:15:360)*pi/180;      % Mean anomaly (rad)
r = [2105; -2105; -5946];   % initial radius vector (km)
v = [7.2; 7.2; 0];          % initial velocity vector (km/s)
i = 63.4 * pi/180;          % inclination (rad)
omega = 45 * pi/180;        % Right ascension of the ascanding node (rad)
w = 270 * pi/180;           % Argument of perigee (rad)

% use rv2coe to find semi-major axis, eccentricity, and angular momentum
[a, e, ~, ~, ~, ~, h] = rv2coe(r,v,mu); 

%--------------- in case M is not given -------------------------------
% n = sqrt(mu/(a^3));
% M = zeros(1,length(t)); % Mean anomaly (rad)
% for k=[1:length(t)]
%     M(k) = n*t(k)*60;   % Don't forget t was in minute!!!
% end
%-----------------------------------------------------------------------

% pre-allocate memory
rx = zeros(1, length(t));
ry = zeros(1, length(t)); 
rz = zeros(1, length(t)); 
vx = zeros(1, length(t));
vy = zeros(1, length(t));
vz = zeros(1, length(t)); 

% Calculate the spacecraf's future position
for j = 1:length(t)
 
    % Eccentric anomaly (rad)
    E0 = M(j) + e*sin(M(j)) + e*e*0.5*sin(2*M(j));   
    E = eccanomaly_newt(E0, M(j), e);
   
    % True anomaly (rad)
    f = 2*atan(sqrt((1+e)/(1-e))*tan(E/2));
    
    % Get r and v vector in RSW coordinate (coe2rv)
    r_rsw_norm = a*(1-e*cos(E));
    r_rsw = [r_rsw_norm; 0; 0];
    v_rsw = [h * e * sin(f)/(a*(1 - e^2)); h/r_rsw_norm; 0];
    
    % Convert RSW to IJK coordinate (rsw2ijk)
    [r, v, u] = rsw2ijk(r_rsw, v_rsw, omega, i, w, f)
    
    % Extract x, y, z components
    rx(j) = r(1); ry(j) = r(2); rz(j) = r(3);
    vx(j) = v(1); vy(j) = v(2); vz(j) = v(3);
    
end

% Make a table
mat = [t; rx; ry; rz; vx; vy; vz]'; % put all info into matrix
T = array2table(mat,'VariableNames',{'Time','x','y','z','xdot','ydot','zdot'}) 

% plot the orbit
figure('units','normalized','outerposition',[0 0 1 1])
plot3(rx, ry, rz, 'ok-', 'MarkerSize', 6, 'MarkerFaceColor', 'red')
hold on

% plot the Earth
[Earth, ~] = rsw2ijk(0, 0, omega, i, w, 0); % get position of the Earth
plot3(Earth(1),Earth(2),Earth(3), 'og','MarkerSize', 50, 'MarkerFaceColor', 'blue')
title('Molniya Orbit','FontSize',16)

xlabel('x (km)'), ylabel('y (km)'), zlabel('z (km)')
grid on

