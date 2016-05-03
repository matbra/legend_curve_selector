% $Revision: 29 $
% $Author: brandt $
% $Date: 2011-03-30 20:43:53 +0200 (Mi, 30 Mrz 2011) $

% clear the workspace
clear, close, clc

% generate a random matrix
mat_data = rand(30, 3);

% plot the data
figure(1);
plot(mat_data);
xlabel('day of month');

% create a standard legend
% (and obtain the handle)
legend({'number of shoes', ...
        'enemies killed', ...
        'raindrops falling on my head'});

% now change the legend to be clickable
legend_curve_selector(legend);