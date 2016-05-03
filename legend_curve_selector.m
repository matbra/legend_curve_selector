function legend_curve_selector(h_legend)
% Usage legend_curve_selector(h_legend)%
% function to add on/off switching functionality to a figure's legend box.
%
% h_legend - the handle of the legend box

% $Revision: 29 $
% $Author: brandt $
% $Date: 2011-03-30 20:43:53 +0200 (Mi, 30 Mrz 2011) $

[h_legend, h_object, h_plot, text_strings] = legend(h_legend);

h_legend_lines = findobj(h_object, 'Type', 'line');
h_legend_strings = findobj(h_object, 'Type', 'text');

h_figure = get(h_legend, 'Parent');

N_legend_strings = length(h_legend_strings);

st_userData = guidata(h_figure);
st_userData.h_legend_lines = h_legend_lines;
guidata(h_figure, st_userData);

for a = 1 : N_legend_strings
    %temp_cur_c_buttondownfcn{1} = @legend_string_callback;
    
    temp_st_guidata = guidata(h_legend_strings(a));
    temp_st_guidata.index = a;
    guidata(h_legend_strings(a), temp_st_guidata);
    
    temp_s_legend_string_handle = sprintf('%5.13f', h_legend_strings(a));
    temp_s_plot_string_handle = sprintf('%5.13f', h_plot(a));
    set(h_legend_strings(a), 'ButtonDownFcn', ['b_on = get(' temp_s_legend_string_handle ', ''Color'') == [0 0 0]; if b_on, set(' temp_s_legend_string_handle ', ''Color'', [0.8 0.8 0.8]); set(' temp_s_plot_string_handle ', ''Visible'', ''off''); else, set(' temp_s_legend_string_handle ', ''Color'', [0 0 0]); set(' temp_s_plot_string_handle ', ''Visible'', ''on''); end']);
end

%function legend_string_callback(bla, bla2, bla3)

%k = 0;