function legend_curve_selector(h_legend)
% Usage legend_curve_selector(h_legend)%
% function to add on/off switching functionality to a figure's legend box.
%
% h_legend - the handle of the legend box

% The MIT License (MIT)
% 
% Copyright (c) 2016 Matthias Brandt
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

[h_legend, h_object, h_plot, text_strings] = legend(h_legend);

h_legend_lines = findobj(h_object, 'Type', 'line');
h_legend_strings = findobj(h_object, 'Type', 'text');

h_figure = get(h_legend, 'Parent');

N_legend_strings = length(h_legend_strings);

st_userData = guidata(h_figure);
st_userData.h_legend_lines = h_legend_lines;
guidata(h_figure, st_userData);

for a = 1 : N_legend_strings    
    temp_st_guidata = guidata(h_legend_strings(a));
    temp_st_guidata.index = a;
    guidata(h_legend_strings(a), temp_st_guidata);
    
    temp_s_legend_string_handle = sprintf('%5.13f', h_legend_strings(a));
    temp_s_plot_string_handle = sprintf('%5.13f', h_plot(a));
    set(h_legend_strings(a), 'ButtonDownFcn', ['b_on = get(' temp_s_legend_string_handle ', ''Color'') == [0 0 0]; if b_on, set(' temp_s_legend_string_handle ', ''Color'', [0.8 0.8 0.8]); set(' temp_s_plot_string_handle ', ''Visible'', ''off''); else, set(' temp_s_legend_string_handle ', ''Color'', [0 0 0]); set(' temp_s_plot_string_handle ', ''Visible'', ''on''); end']);
end

end % of function