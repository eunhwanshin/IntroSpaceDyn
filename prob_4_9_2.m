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

% In this problem we compute the eccentricity and the perigee and
% apogee speed using the observations to the satellite Explorer 
% No.7 launched October 1959.

% We run Problem 4.9-1 first to set the variables.
prob_4_9_2;

% eccentricity
e = 1 - rp/a;
fprintf('Eccentricity = %.9e\n', e);

% from (4.13-9)
% v^2 = K * (2/r - 1/a)

% Perigee speed
vp = sqrt(K * (2/rp -1/a));
fprintf('Perigee speed = %.3f km/s\n', vp * 1.0e-3);

% Apogee speed
va = sqrt(K * (2/ra -1/a));
fprintf('Apogee speed = %.3f km/s\n', va * 1.0e-3);




