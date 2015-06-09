function q = setdiff(o,p) % --*-- Unitary tests --*--

% Overloads setdiff function for dates objects.
%
% INPUTS 
% - o [dates]
% - p [dates]
%
% OUTPUTS 
% - q [dates]
%
% See also pop, remove.

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

if ~isa(o,'dates') || ~isa(o,'dates')
    error('dates;setdiff','All input arguments must be dates objects!')
end

if ~isequal(o.freq,p.freq)
    error('dates;setdiff','All input arguments must have common frequency!')
end

if o==p
    q = dates(o.freq);
    return
end

if isoctave || matlab_ver_less_than('8.1.0')
    time = setdiff(o.time,p.time,'rows');
else
    time = setdiff(o.time,p.time,'rows','legacy');
end

q = dates(o.freq);
if isempty(time)
    return
end

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
%$ t(2) = dassert(isempty(c2),logical(1));
%$ T = all(t);
%@eof:1
