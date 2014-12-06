function str = dates4display(o, name, max_number_of_elements)

% Converts a list object to a string.
%
% INPUTS 
% - o                      [list]     A dates object to be displayed.
% - name                   [string]   Name of the dates object o.
% - max_number_of_elements [integer]  Maximum number of elements displayed.
%
% OUTPUTS 
% - str  [string] Representation of the dates object as a string. 

% Copyright (C) 2014 Dynare Team
%
% This code is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare dates submodule is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

if isempty(o)
    str = sprintf('%s is an empty dates object.\n', name);
    return
end

str = sprintf('%s = <dates: ', name);

if o.length()<=max_number_of_elements
    % All the elements are displayed
    for i=1:length(o)-1
        str = sprintf('%s%s, ', str, date2string(o.time(i,:),o.freq));
    end
else
    % Only display four elements (two first and two last)
    for i=1:2
        str = sprintf('%s%s, ', str, date2string(o.time(i,:),o.freq));
    end
    str = sprintf('%s%s, ', str, '...');
    str = sprintf('%s%s, ', str, date2string(o.time(o.length()-1,:),o.freq));
end
str = sprintf('%s%s>', str, date2string(o.time(o.length(),:),o.freq));