function varargout = size(o)

% Copyright (C) 2013 -2014 Dynare Team
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

switch nargout
  case 0
    if isempty(o)
        size([])
    else
        size(o.time)
    end
  case 1
    if isempty(o)
        varargout{1} = size([]);
    else
        varargout{1} = size(o.time);
    end
  otherwise
    error('dates::size: Wrong calling sequence! Cannot return more than one argument.')
end