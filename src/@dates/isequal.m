function C = isequal(A, B, fake)

% Overloads isequal function for dates objects.

% Copyright (C) 2013-2015 Dynare Team
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

if ~isa(A,'dates') || ~isa(B,'dates')
    error('dates::isequal: Both inputs must be dates objects!')
end

C = isequal(A.freq, B.freq) && isequal(A.ndat, B.ndat) && isequal(A.time,B.time);
