function freq = string2freq(s) % --*-- Unitary tests --*--

% INPUTS
%  o s        character, equal to Y, Q, M or W (resp. annual, quaterly, monthly or weekly)
%
% OUTPUTS
%  o freq     scalar integer,  equal to 1, 4, 12 or 52 (resp. annual, quaterly, monthly or weekly)

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

switch upper(s)
  case {'Y','A'}
    freq = 1;
  case 'Q'
    freq = 4;
  case 'M'
    freq = 12;
  case 'W'
    freq = 52;
  otherwise
    error('dates::freq2string: Unknown frequency!')
end

%@test:1
%$ try
%$     nY = string2freq('Y');
%$     nQ = string2freq('Q');
%$     nM = string2freq('M');
%$     nW = string2freq('W');
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(nY, 1);
%$     t(3) = dassert(nQ, 4);
%$     t(4) = dassert(nM, 12);
%$     t(5) = dassert(nW, 52);
%$ end
%$
%$ T = all(t);
%@eof:1

%@test:2
%$ try
%$     n = string2freq('Z');
%$     t(1) = false;
%$ catch
%$     t(1) = true;
%$ end
%$
%$ T = all(t);
%@eof:2
