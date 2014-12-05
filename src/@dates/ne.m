function l = ne(varargin) % --*-- Unitary tests --*--

% Overloads ~= operator for dates objects.
%
% INPUTS
% - o [dates] dates object with n or 1 elements.
% - p [dates] dates object with n or 1 elements.
%
% OUTPUTS
% - l [logical] column vector of max(n,1) elements (zeros or ones).

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

[o, p] = comparison_arg_checks(varargin{:});

if isequal(o.ndat, p.ndat)
    l = logical(transpose(any(transpose(ne(o.time,p.time)))));
else
    l = logical(transpose(any(transpose(bsxfun(@ne,o.time,p.time)))));
end

%@test:1
%$ % Define some dates objects
%$ d1 = dates('1950Q1','1950Q2','1950Q3','1950Q4') ;
%$ d2 = dates('1960Q1','1960Q2','1960Q3','1960Q4') ;
%$ d3 = dates('1950Q1','1960Q2','1950Q3','1960Q4') ;
%$
%$ % Call the tested routine.
%$ t1 = d1~=d1;
%$ t2 = d1~=d2;
%$ t3 = d1~=d3;
%$
%$ % Check the results.
%$ t(1) = dassert(t1,false(4,1));
%$ t(2) = dassert(t2,true(4,1));
%$ t(3) = dassert(t3,[false; true; false; true]);
%$ T = all(t);
%@eof:1

%@test:2
%$ % Define some dates objects
%$ d1 = dates('1950Q1') ;
%$ d2 = dates('1960Q1') ;
%$ d3 = dates('1960Q1') ;
%$
%$ % Call the tested routine.
%$ t1 = d1~=d1;
%$ t2 = d1~=d2;
%$ t3 = d1~=d3;
%$
%$ % Check the results.
%$ t(1) = dassert(t1,false);
%$ t(2) = dassert(t2,true);
%$ t(3) = dassert(t3,true);
%$ T = all(t);
%@eof:2

%@test:3
%$ % Define some dates objects
%$ d1 = dates('1950Q1','1950Q2','1950Q3','1950Q4') ;
%$ d2 = dates('1950Q2') ;
%$ d3 = dates('1970Q1') ;
%$
%$ % Call the tested routine.
%$ t1 = d1~=d2;
%$ t2 = d1~=d3;
%$
%$ % Check the results.
%$ t(1) = dassert(t1,[true; false; true; true]);
%$ t(2) = dassert(t2,true(4,1));
%$ T = all(t);
%@eof:3
