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

clear
close all
% Section 4.9 Problem 7. 
% Plot the angle between the perigee and r0 
% with respec to values of \beta and r v^2/K.

% Let x = r_0 v_0^2 / K

x = [0:0.01:2];

beta = [0.5, 1, 5, 10, 30] * pi/180;

% Use (4.9-7):

for i=1:length(beta),
  c = cos(beta(i))^2;
  s = sin(beta(i))^2;
  
  N = x * c * sin(beta(i));
  D = x * c^2 - 1;

  %t = N ./ D;
  
  theta = atan2(D,N) * 180/pi;

  plot(x, theta);
  hold on
end
hold off

legend('\beta = 0.5^\circ', '\beta = 1^\circ', '\beta = 5^\circ', ...
   '\beta = 10^\circ', '\beta = 30^\circ', 'location', 'northwest')
xlabel('r_0 v_0^2 / K')
ylabel('\theta_0')
title('Angle between the Perigee and r_0 (deg)')
grid on