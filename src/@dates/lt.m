function l = lt(varargin)  % --*-- Unitary tests --*--

% Overloads the < operator for dates objects.
%
% INPUTS
% - o [dates] dates object with n or 1 elements.
% - p [dates] dates object with n or 1 elements.
%
% OUTPUTS
% - l [logical] column vector of max(n,1) elements (zeros or ones).

% Copyright (C) 2013-2017 Dynare Team
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

if isequal(o.ndat(), p.ndat())
    l = false(o.ndat(),1);
    for i=1:o.ndat()
        l(i) = lessthan(o.time(i,:),p.time(i,:));
    end
else
    if isequal(o.ndat(),1)
        l = false(p.ndat(),1);
        for i=1:p.ndat()
            l(i) = lessthan(o.time,p.time(i,:));
        end
    else
        l = false(o.ndat(),1);
        for i=1:o.ndat()
            l(i) =  lessthan(o.time(i,:),p.time);
        end
    end
end

%@test:1
%$ % Define some dates
%$ date_2 = '1950Q2';
%$ date_3 = '1950Q3';
%$ date_4 = '1950Q1';
%$ date_5 = '1949Q2';
%$
%$ % Call the tested routine.
%$ d2 = dates(date_2);
%$ d3 = dates(date_3);
%$ d4 = dates(date_4);
%$ d5 = dates(date_5);
%$ i1 = (d2<d3);
%$ i2 = (d3<d4);
%$ i3 = (d4<d2);
%$ i4 = (d5<d4);
%$
%$ % Check the results.
%$ t(1) = dassert(i1,true);
%$ t(2) = dassert(i2,false);
%$ t(3) = dassert(i3,true);
%$ t(4) = dassert(i4,true);
%$ T = all(t);
%@eof:1

%@test:2
%$ % Define some dates
%$ B1 = '1945Q1';
%$ B2 = '1945Q2';
%$ B3 = '1945Q3';
%$ B4 = '1945Q4';
%$ B5 = '1950Q1';
%$
%$ % Create dates objects.
%$ dd = dates(B1,B2,B3,B4);
%$
%$ % Check the results.
%$ t(1) = dassert(dates(B1)<dates(B2),true);
%$ t(2) = dassert(dates(B2)<dates(B1),false);
%$ t(3) = dassert(dates(B2)<dates(B1),false);
%$ t(4) = dassert(dd<dates(B5),true(4,1));
%$ t(5) = dassert(dates(B5)<dd,false(4,1));
%$ t(6) = dassert(dates(B1)<dd,[false; true(3,1)]);
%$ T = all(t);
%@eof:2
