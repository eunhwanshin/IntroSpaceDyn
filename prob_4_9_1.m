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

% In this problem we compute the earth's gravitational constant
% using the observations to the satellite Explorer No.7 launched
% October 1959.

% mile to m
mi2m = 1609.34;

% earth's mean radius
R = 3960 * mi2m;

% Explorer No.7 perigee
rp = 346 * mi2m + R;

% Explorer No.7 apogee
ra = 664 * mi2m + R;

% Semi-major axis
a = (ra + rp)/2;
fprintf('Semi-major = %.3f km\n', a*1.0e-3);

% Period
T = 101.2 * 60;

% Earth's gravitational contant

K = a^3 * 4 * pi^2 / T^2;

fprintf('K = %.9e m^3/s^2\n', K)

% Compare against WGS84's GM = 3986004.418e+8 m^3/s^2

GM = 3986004.418e+8;

fprintf('Error = %.3f percent\n', (K-GM)*100/GM)
