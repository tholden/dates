function s = char(o)

% Given a one element dates object, returns a string with the formatted date.
%
% INPUTS 
% - o  [dates]
%
% OUTPUTS
% - s  [string]

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

if length(o)>1
    error('dates:char:ArgCheck', 'The input argument must be a dates object with one element!')
end

s = date2string(o.time, o.freq);