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
        'enemies confused', ...
        'raindrops falling on my head'});

% now change the legend to be clickable
legend_curve_selector(legend);