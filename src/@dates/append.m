function o = append(o, d) % --*-- Unitary tests --*--

% append method for dates class.
%
% INPUTS
% - o [dates]
% - a [dates or string] dates object with one element or string that can be interpreted as a date.
%
% OUTPUTS
% - o [dates] dates object containing dates defined in o and d.

% Copyright (C) 2012-2017 Dynare Team
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

if isa(d, 'dates')
    if ~isequal(length(d), 1)
        error('dates:append:ArgCheck','Input argument %s has to be a dates object with one element.', inputname(2))
    end
    if isempty(d)
        return
    end
elseif isdate(d)
    d = dates(d);
end

if ~isequal(o.freq, d.freq)
    error('dates:append:ArgCheck','dates must have common frequency!')
end

o = copy(o);
o.append_(d);

%@test:1
%$ % Define some dates
%$ B1 = '1953Q4';
%$ B2 = '1950Q2';
%$ B3 = '1950Q1';
%$ B4 = '1945Q3';
%$ B5 = '2009Q2';
%$
%$ % Define expected results.
%$ e.time = [1945 3; 1950 1; 1950 2; 1953 4];
%$ e.freq = 4;
%$
%$ % Call the tested routine.
%$ d = dates(B4,B3,B2,B1);
%$ try
%$     d.append(dates(B5));
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ % Check the results.
%$ if t(1)
%$     t(2) = dassert(d.time,e.time);
%$     t(3) = dassert(d.freq,e.freq);
%$ end
%$ T = all(t);
%@eof:1

%@test:2
%$ % Define some dates
%$ B1 = '1953Q4';
%$ B2 = '1950Q2';
%$ B3 = '1950Q1';
%$ B4 = '1945Q3';
%$ B5 = '2009q2';
%$
%$ % Define expected results.
%$ e.time = [1945 3; 1950 1; 1950 2; 1953 4; 2009 2];
%$ f.time = [1945 3; 1950 1; 1950 2; 1953 4];
%$ e.freq = 4;
%$
%$ % Call the tested routine.
%$ d = dates(B4,B3,B2,B1);
%$ try
%$     c = d.append(B5);
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ % Check the results.
%$ if t(1)
%$     t(2) = dassert(d.time,f.time);
%$     t(3) = dassert(c.time,e.time);
%$     t(4) = dassert(c.freq,e.freq);
%$     t(5) = dassert(d.freq,e.freq);
%$ end
%$ T = all(t);
%@eof:2

%@test:3
%$ % Define some dates
%$ B1 = '1953Q4';
%$ B2 = '1950Q2';
%$ B3 = '1950Q1';
%$ B4 = '1945Q3';
%$ B5 = '2009q2';
%$
%$ % Define expected results.
%$ e.time = [1945 3; 1950 1; 1950 2; 1953 4; 2009 2];
%$ f.time = [1945 3; 1950 1; 1950 2; 1953 4];
%$ e.freq = 4;
%$
%$ % Call the tested routine.
%$ d = dates(B4,B3,B2,B1);
%$ try
%$     c = append(d, B5);
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ % Check the results.
%$ if t(1)
%$     t(2) = dassert(d.time,f.time);
%$     t(3) = dassert(c.time,e.time);
%$     t(4) = dassert(c.freq,e.freq);
%$     t(5) = dassert(d.freq,e.freq);
%$ end
%$ T = all(t);
%@eof:3
