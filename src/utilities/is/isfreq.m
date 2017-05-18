function B = isfreq(A) % --*-- Unitary tests --*--

% Tests if A can be interpreted as a frequency.
%
% INPUTS
%  o A     scalar integer or character.
%
% OUTPUTS
%  o B     scalar integer equal to one if A can be interpreted as a frequency, zero otherwise.

% Copyright (C) 2013-2017 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

B = false;

if ischar(A)
    if isequal(length(A),1) && ismember(upper(A),{'Y','A','Q','M','W'})
        B = true;
        return
    end
end

if isnumeric(A) && isequal(length(A),1) && ismember(A,[1 4 12 52])
    B = true;
end

%@test:1
%$ try
%$     boolean = isfreq('w');
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, true);
%$ end
%$
%$ T = all(t);
%@eof:1

%@test:2
%$ try
%$     boolean = isfreq('W');
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, true);
%$ end
%$
%$ T = all(t);
%@eof:2

%@test:3
%$ try
%$     boolean = isfreq('M');
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, true);
%$ end
%$
%$ T = all(t);
%@eof:3

%@test:4
%$ try
%$     boolean = isfreq('Q');
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, true);
%$ end
%$
%$ T = all(t);
%@eof:4

%@test:5
%$ try
%$     boolean = isfreq('Y');
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, true);
%$ end
%$
%$ T = all(t);
%@eof:5
