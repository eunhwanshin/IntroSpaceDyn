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

% Section 4.10 Problem 3

% WGS84's GM = 3986004.418e+8 m^3/s^2

K = 3986004.418e+8;

% mile to m
mi2m = 1609.34;

% earth's mean radius
R = 3960 * mi2m;

% launch altitue
z = [1:400] * mi2m;

% launch position
r = R + z;

% Escape velocity: (4.10-2)
ve = sqrt(2*K) * r.^(-1/2);

plot(z*1.0e-3, ve*1.0e-3)
title('Eascape Velocity (km/s)')
xlabel('Launch Altitude (km)')
grid on 
