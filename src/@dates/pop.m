function o = pop(o, p) % --*-- Unitary tests --*--

% pop method for dates class (removes a date).
%
% INPUTS 
% - o [dates]
% - p [dates] object with one element, string which can be interpreted as a date or integer scalar.
%
% OUTPUTS 
% - o [dates]
%
% REMARKS 
% 1. If a is a date appearing more than once in A, then only the last occurence is removed. If one wants to
%    remove all the occurences of a in A, the setdiff function should be used instead.

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

if nargin<2
    % Remove last date
    o.ndat = o.ndat-1;
    o.time = o.time(1:end-1,:);
    return
end

if ~( isdates(p) || isdate(p) || (isscalar(p) && isint(p)) )
    error('dates:pop','Input argument %s has to be a dates object with a single element, a string (which can be interpreted as a date) or an integer!',inputname(2))
end

if ischar(p)
    p = dates(p);
end

if isnumeric(p)
    idx = find(transpose(1:o.ndat)~=p);
    o.time = o.time(idx,:);
    o.ndat = o.ndat-1;
else
    if ~isequal(o.freq,p.freq)
        error('dates:pop','Inputs must have common frequency!')
    end
    if p.length()>1
        error('dates:pop','dates to be removed must have one element!')
    end
    if isempty(p)
        return
    end
    idx = find(o==p);
    jdx = find(transpose(1:o.ndat)~=idx(end));
    o.time = o.time(jdx,:);
    o.ndat = o.ndat-1;
end

%@test:1
%$ % Define some dates
%$ B1 = '1953Q4';
%$ B2 = '1950Q2';
%$ B3 = '1950Q1';
%$ B4 = '1945Q3';
%$ B5 = '2009Q2';
%$
%$ % Define expected results
%$ e.time = [1945 3; 1950 1; 1950 2; 1953 4; 2009 2];
%$ e.freq = 4;
%$ e.ndat = 5;
%$
%$ % Call the tested routine
%$ d = dates(B4,B3,B2,B1);
%$ d.append(dates(B5));
%$ d.pop();
%$ t(1) = dassert(d.time,e.time(1:end-1,:));
%$ t(2) = dassert(d.freq,e.freq);
%$ t(3) = dassert(d.ndat,e.ndat-1);
%$ f = copy(d);
%$ d.pop(B1);
%$ t(4) = dassert(d.time,[1945 3; 1950 1; 1950 2]);
%$ t(5) = dassert(d.freq,e.freq);
%$ t(6) = dassert(d.ndat,e.ndat-2);
%$ f.pop(dates(B1));
%$ t(7) = dassert(f.time,[1945 3; 1950 1; 1950 2]);
%$ t(8) = dassert(f.freq,e.freq);
%$ t(9) = dassert(f.ndat,e.ndat-2);
%$
%$ % Check the results.
%$ T = all(t);
%@eof:1

%@test:2
%$ % Define some dates
%$ B1 = '1950Q1';
%$ B2 = '1950Q2';
%$ B3 = '1950Q1';
%$ B4 = '1945Q3';
%$ B5 = '2009Q2';
%$
%$ % Call the tested routine
%$ d = dates(B1,B2,B3,B4);
%$ d.append(dates(B5));
%$ d.pop();
%$ t(1) = dassert(d,dates(B1,B2,B3,B4));
%$ d.pop(B1);
%$ t(2) = dassert(d,dates(B1,B2,B4));
%$ d.pop(1);
%$ t(3) = dassert(d,dates(B2,B4));
%$ T = all(t);
%@eof:2