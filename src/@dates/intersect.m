function q = intersect(o, p) % --*-- Unitary tests --*--

% Overloads intersect function for dates objects.
%
% INPUTS 
% - o [dates]
% - p [dates]
%
% OUTPUTS 
% - q [dates] All the common elements in o and p.

% Copyright (C) 2013-2015 Dynare Team
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

if ~isa(o,'dates') || ~isa(p,'dates')
    error('dates:intersect:ArgCheck','All input arguments must be dates objects!')
end

if o.length()==p.length() && o==p
    q = copy(a);
    return
end

if ~isequal(o.freq,p.freq)
    q = dates();
    return
end

if isoctave || matlab_ver_less_than('8.1.0')
    time = intersect(o.time,p.time,'rows');
else
    time = intersect(o.time,p.time,'rows','legacy');
end

q = dates();
if isempty(time)
    return
end

q.freq = o.freq;
q.time = time;

%@test:1
%$ % Define some dates objects
%$ d1 = dates('1950Q1'):dates('1969Q4') ;
%$ d2 = dates('1960Q1'):dates('1969Q4') ;
%$ d3 = dates('1970Q1'):dates('1979Q4') ;
%$
%$ % Call the tested routine.
%$ c1 = intersect(d1,d2);
%$ c2 = intersect(d1,d3);
%$
%$ % Check the results.
%$ t(1) = dassert(c1,d2);
%$ t(2) = dassert(isempty(c2),true);
%$ T = all(t);
%@eof:1
