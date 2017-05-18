function [C, IA] = setdiff(A,B) % --*-- Unitary tests --*--

%@info:
%! @deftypefn {Function File} {@var{C} =} setdiff (@var{A},@var{B})
%! @anchor{@dates/intersect}
%! @sp 1
%! C of B and A.
%! if A and B are not disjoints.
%! @sp 2
%! @strong{Inputs}
%! @sp 1
%! @table @ @var
%! @item A
%! @ref{dates} object.
%! @item B
%! @ref{dates} object.
%! @end table
%! @sp 2
%! @strong{Outputs}
%! @sp 1
%! @table @ @var
%! @item C
%! @ref{dates} object.
%! @item IA
%! Vector of integers such that C=A(IA).
%! @end table
%! @end deftypefn
%@eod:

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

if ~isa(A,'dates') || ~isa(B,'dates')
    error(['dates::plus: Input arguments ''' inputname(1) ''' and ''' inputname(2) ''' must be dates objects!']);
end

if ~isequal(A.freq,B.freq)
    error('dates::setdiff','All input arguments must have common frequency!');
end

if isequal(A,B)
    C = dates(A.freq);
    if nargout>1, IA = []; end
    return
end

if isoctave || matlab_ver_less_than('8.1.0')
    if nargout<2
        time = setdiff(A.time,B.time,'rows');
    else
        [time, IA] = setdiff(A.time,B.time,'rows');
    end
else
    if nargout<2
        time = setdiff(A.time,B.time,'rows','legacy');
    else
        [time, IA] = setdiff(A.time,B.time,'rows','legacy');
    end
end

C = dates(A.freq);

if isempty(time)
    IA = [];
    return
end

C.time = time;
C.ndat = rows(time);

%@test:1
%$ % Define some dates objects
%$ d1 = dates('1950Q1'):dates('1969Q4') ;
%$ d2 = dates('1960Q1'):dates('1969Q4') ;
%$ d3 = dates('1970Q1'):dates('1979Q4') ;
%$
%$ % Call the tested routine.
%$ c1 = intersect(d1,d2);
%$ c2 = intersect(d1,d3);
%$
%$ % Check the results.
%$ t(1) = dassert(c1,d2);
%$ t(2) = dassert(isempty(c2),logical(1));
%$ T = all(t);
%@eof:1