function q = min(varargin) % --*-- Unitary tests --*--

% Overloads the min function for dates objects.
%
% INPUTS 
% - varargin [dates]
%
% OUTPUTS 
% - q [dates]

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

if ~all(cellfun(@isdates,varargin))
    error('dates:min:ArgCheck','All input arguments must be dates objects.')
end

switch nargin
  case 1
    sorted_time_member = sortrows(varargin{1}.time);
    q = dates();
    q.freq = varargin{1}.freq;
    q.ndat = 1;
    q.time = sorted_time_member(1,:);
  otherwise
    q = min(horzcat(varargin{:}));
end

%@test:1
%$ % Define some dates
%$ d3 = dates('1950q2');
%$ d4 = dates('1950Q3');
%$ d5 = dates('1950m1');
%$ d6 = dates('1948M6');
%$ m2 = min(d3,d4);
%$ i2 = (m2==d3);
%$ m3 = min(d5,d6);
%$ i3 = (m3==d6);
%$
%$ % Check the results.
%$ t(1) = dassert(i2,true);
%$ t(2) = dassert(i3,true);
%$ T = all(t);
%@eof:1

%@test:2
%$ % Define some dates
%$ d = dates('1950Q2','1951Q3','1949Q1','1950Q4');
%$ m = min(d);
%$ i = (m==dates('1949Q1'));
%$
%$ % Check the results.
%$ t(1) = dassert(i,true);
%$ T = all(t);
%@eof:2

%@test:3
%$ % Define some dates
%$ m = min(dates('1950Q2','1951Q3'),dates('1949Q1'),dates('1950Q4'));
%$ i = (m==dates('1949Q1'));
%$
%$ % Check the results.
%$ t(1) = dassert(i,true);
%$ T = all(t);
%@eof:3

%@test:4
%$ % Define some dates
%$ m = min(dates('1950Q2'),dates('1951Q3'),dates('1949Q1'),dates('1950Q4'));
%$ i = (m==dates('1949Q1'));
%$
%$ % Check the results.
%$ t(1) = dassert(i,true);
%$ T = all(t);
%@eof:4