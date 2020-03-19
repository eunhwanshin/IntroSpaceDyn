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
% This script generate Fig. 4.9-2. Orbit eccentricity estabilished initial 
% values of \beta and r v^2/K.

% Let x = r_0 v_0^2 / K

x1 = [0:0.01:1];
x2 = [1:0.01:5];
x = [x1 x2];

beta = [0, 20, 40] * pi/180;

% Note from (4.9-6) that e < 0 when r_0 v_0^2 / K < 1:
% \frac{r_0 v_0^2}{K} \cos^2 \beta_0 = 1 + e \cos \theta_0.

for i=1:length(beta),
  c = cos(beta(i))^2;
  s = sin(beta(i))^2;
  e1 = -((x1 - 1).^2 * c + s).^0.5; 
  e2 = ((x2 - 1).^2 * c + s).^0.5;

  plot(x, [e1 e2]);
  hold on
end
hold off

legend('\beta = 0^\circ', '\beta = 20^\circ', '\beta = 40^\circ', 'location', 'northwest')
xlabel('r_0 v_0^2 / K')
ylabel('e')
title('Orbit Eccentricity')
grid on