function B = isempty(A) % --*-- Unitary tests --*--

%@info:
%! @deftypefn {Function File} {@var{B} =} isempty (@var{A})
%! @anchor{@dates/isempty}
%! @sp 1
%! Overloads the isempty function for the @ref{dates} class.
%! @sp 2
%! @strong{Inputs}
%! @sp 1
%! @table @ @var
%! @item A
%! @ref{dates} object.
%! @end table
%! @sp 1
%! @strong{Outputs}
%! @sp 1
%! @table @ @var
%! @item b
%! Integer scalar (equal to zero if @var{A} is not empty).
%! @end table
%! @end deftypefn
%@eod:

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
    
B = isequal(A.ndat,0);

%@test:1
%$ % Instantiate an empty dates object
%$ d = dates();
%$ % Test if this object is empty
%$ t(1) = isempty(d);
%$ T = all(t);
%@eof:1