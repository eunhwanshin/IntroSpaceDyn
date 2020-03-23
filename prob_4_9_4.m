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

% Section 4.9 Problem 4
% Calculate the orbit period, the eccentricity and the maximum speed
% of the Explorer No.6 launched in August 1959.

% WGS84's GM = 3986004.418e+8 m^3/s^2

GM = 3986004.418e+8;

% mile to m
mi2m = 1609.34;

% earth's mean radius
R = 3960 * mi2m;

% Perigee
rp = 157 * mi2m + R;

% Apogee
ra = 26400 * mi2m + R;

% Semi-major axis
a = (ra + rp)/2;
fprintf('Semi-major = %.3f km\n', a*1.0e-3);

% Period
T = 2*pi * a^(3/2) / sqrt(GM);
fprintf('Period = %.3f hours\n', T/3600);

% eccentricity
e = 1 - rp/a;
fprintf('Eccentricity = %.9e\n', e);

% from (4.13-9)
% v^2 = K * (2/r - 1/a)

% Perigee speed
vp = sqrt(GM * (2/rp -1/a));
fprintf('Perigee speed = %.3f km/s\n', vp * 1.0e-3);




