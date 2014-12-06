function m = strings(o)

% Returns a cell array of strings containing the dates
%
% INPUTS 
% - o [dates] object with n elements.
%
% OUTPUTS
% - m [cell of char] object with n elements.

% Copyright (C) 2013-2014 Dynare Team
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

m = cell(1,o.ndat);

for i = 1:o.length()
    m(i) = { date2string(o.time(i,:), o.freq) };
end