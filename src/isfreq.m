function B = isfreq(A)

% Tests if A can be interpreted as a frequency.
%
% INPUTS 
%  o A     scalar integer or character.
%
% OUTPUTS 
%  o B     scalar integer equal to one if A can be interpreted as a frequency, zero otherwise.

% Copyright (C) 2013 Dynare Team
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

B = 0;

if ischar(A)
    if isequal(length(A),1) && ismember(upper(A),{'Y','A','Q','M','W'})
        B = 1;
        return
    end
end

if isnumeric(A) && isequal(length(A),1) && ismember(A,[1 4 12 52])
    B = 1;
end