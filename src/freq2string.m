function s = freq2string(freq)

% INPUTS 
%  o freq     scalar integer,  equal to 1, 4, 12 or 52 (resp. annual, quaterly, monthly or weekly)
%
% OUTPUTS 
%  o s        character, equal to Y, Q, M or W (resp. annual, quaterly, monthly or weekly)
    
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

switch freq
  case 1
    s = 'Y';
  case 4
    s = 'Q';
  case 12
    s = 'M';
  case 52
    s = 'W';
  otherwise
    error('dates::freq2string: Unknown frequency!')
end