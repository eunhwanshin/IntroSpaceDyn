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

% mile to m
mi2m = 1609.34;

% earth's mean radius
R = 3960 * mi2m;

% GM
K = 3986004.418e+8;

% Section 4.11 Problem 7.

%% 1. Transfer from the initial elliptic orbit to a circular orbit 
% of which height is 300 miles.

% original perigee speed
vp = 18300 * mi2m;
rp = 300 * mi2m + R;


% speed of the circular orbit 
vc = sqrt(K/rp);

fprintf('First velocity increment = %.3f (km/s)\n', (vc - vp) * 1.0e-3);

%% 2. Transfer from the circular to an elliptic orbit whose perigee 
% height is 100 miles.

rp1 = 100 * mi2m + R;

vp1 = sqrt(K/rp) * sqrt(2/(1+rp/rp1));

fprintf('Second velocity increment = %.3f (km/s)\n', (vp1 - vc) * 1.0e-3);