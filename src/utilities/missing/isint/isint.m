function [l,c,d] = isint(a)

%  This function tests if the input argument is an integer.
%
%  INPUT
%  - a    [double]   m*n matrix.
%
%  OUTPUT
%  - l    [logical]  m*n matrix of true and false (1 and 0). l(i,j)=true if a(i,j) is an integer.
%  - c    [integer]  p*1 vector of indices pointing to the integer elements of a.
%  - d    [integer]  q*1 vector of indices pointing to the non integer elements of a.
%
%  REMARKS
%  p+q is equal to the product of m by n.

% Copyright (C) 2009-2017 Dynare Team
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

if ~isnumeric(a)
    b = false;
    if nargout>1
        c = [];
        d = [];
    end
    return
end

l = abs(fix(a)-a)<1e-15;

if nargout>1
    c = find(b==1);
    d = find(b==0);
end