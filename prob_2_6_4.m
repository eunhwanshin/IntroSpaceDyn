% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as
% published by the Free Software Foundation, either version 3
% of the License, or (at your option) any later version.
%
% This is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
%
% Copyright (c) 2020, Eun Hwan Shin.

% Section 2.6 Problem 4

clear
close all

mi2m = 1609.344;
h = 150 * mi2m;
fprintf('Maximum h = %.3f m\n',h);

lat = 35*pi/180;
omega_e = 0.729e-4;
g = 9.8;
T = sqrt(2*h/g);
fprintf('Time to reach maximum h: %.3f\n', T);
v0 = g*T;
fprintf('Initial velocity = %.3f\n', v0);

gv = [0; 0; g];

w = [omega_e*cos(lat); 0; -omega_e*sin(lat)];

t = 0;
r = [0; 0; 0];
v = [0; 0; -v0];
a = gv - 2*cross(w,v);
dt = 0.05;
trj = [t, r', v'];
while 1,
    t1 = t + dt;
	v1 = v + a*dt;
	r1 = r + 0.5*(v+v1)*dt;
	
	a = gv - 2*cross(w,v1);
	
	trj = [trj; t1, r1', v1'];
	
	if v(3) < 0 && 0 < v1(3)
	  f = -v(3)/(v1(3) - v(3));
	  f1 = 1-f;
	  th = f1*t + f*t1;
	  rh = f1*r + f*r1;
      vh = f1*v + f*v1;	  
	  fprintf('Reached maximum height: t = %.3f, r =[%.3f, %.3f, %.3f], v = [%.3f, %.3f, %.3f]\n',
	     th, rh(1), rh(2), rh(3), vh(1), vh(2), vh(3));
    end	
	
	if r1(3) > 0
	   f = -r(3)/(r1(3) - r(3));
	   f1 = 1-f;
	   te = f1*t + f*t1;
	   re = f1*r + f*r1;
	   ve = f1*v + f*v1;
	   fprintf('Reached ground: t = %.3f, r =[%.3f, %.3f, %.3f], v = [%.3f, %.3f, %.3f]\n',
	     te, re(1), re(2), re(3), ve(1), ve(2), ve(3));
	   break;
	end
	
	t = t1;
	r = r1;
	v = v1;
end

rd = re - rh;
fprintf('Downward deviation: dr = [%.3f, %.3f, %.3f]\n', rd(1), rd(2), rd(3));

n = length(trj(:,1));

figure
subplot(3,1,1)
plot(trj(:,1), trj(:,2))
grid on
title('S2.6 P4: Position (m)')
ylabel('North')
subplot(3,1,2)
plot(trj(:,1), trj(:,3))
grid on
ylabel('East')
subplot(3,1,3)
plot(trj(:,1), -trj(:,4))
grid on
ylabel('Up')
xlabel('Time (s)')
%saveas(1, '..\Fig\s2_6_p4_1.jpg');

figure
subplot(3,1,1)
plot(trj(:,1), trj(:,5))
grid on
title('S2.6 P4: Velocity (m/s)')
ylabel('North')
subplot(3,1,2)
plot(trj(:,1), trj(:,6))
grid on
ylabel('East')
subplot(3,1,3)
plot(trj(:,1), -trj(:,7))
grid on
ylabel('Up')
xlabel('Time (s)')
%saveas(2, '..\Fig\s2_6_p4_2.png')

%% - Analytical Method
%ve = -2*omega_e*cos(lat)*h;
%re = -4/3*h*omega_e*cos(lat)*sqrt(2*h/g);

%fprintf('Ve = %.3f m/s \n', ve)
%fprintf('Re = %.3f m \n', re)
