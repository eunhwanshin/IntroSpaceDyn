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

% Section 4.10 Problem 2

% WGS84's GM = 3986004.418e+8 m^3/s^2

K = 3986004.418e+8;

% mile to m
mi2m = 1609.34;

% earth's mean radius
R = 3960 * mi2m;

% launch speed
v0 = 18000/3600 * mi2m;

% launch position
r0 = R + 400 * mi2m;

x = r0 * v0^2 / K;
fprintf('r0 v0^2 / K = %.2f\n', x);

r0_R = r0 / R;
fprintf('r0/R = %.2f\n', r0_R);

% Eccentricity
e = x - 1;
fprintf('Eccentricity = %.9e\n', e);

% Semi-major axis: (4.10-3)
a = r0 / (1-e);
fprintf('Semi-major axis = %.3f km\n', a * 1.0e-3);

% Apogee distance r_a/r_0: (4.10-5)
da = (1+e)/(1-e);

% Apogee altitude: (4.10-6)
za = r0 * da - R;
fprintf('Apogee altitude = %.3f km\n', za * 1.0e-3);

% Period (4.10-8)
T = 2*pi * a^(3/2) / sqrt(K);
fprintf('Period = %.3f hours\n', T/3600);