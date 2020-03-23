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

% Section 4.10 Problem 1

% Let x be r_0 v_0^2 / K
x = 1.2;

% r_0 / R
r0_R = 1.1;

% (4.10-1)
e = x - 1;
fprintf('Eccentricity = %.2f\n', e);

% Apogee distance r_a / r_0: (4.10-5)
da = (1+e)/(1-e);
fprintf('Apogee distance = %.2f\n', da);

% Apogee altitude z_a / R: (4.10-6)
za = r0_R * da - 1;

% Perigee altitude z_p / R: (4.10-7)
zp = r0_R - 1;

fprintf('Ration of the apogee to perigee altitude = %.2f\n', za / zp);
