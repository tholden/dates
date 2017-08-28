function s = freq2string(freq) % --*-- Unitary tests --*--

% INPUTS
%  o freq     scalar integer,  equal to 1, 4, 12 or 52 (resp. annual, quaterly, monthly or weekly)
%
% OUTPUTS
%  o s        character, equal to Y, Q, M or W (resp. annual, quaterly, monthly or weekly)

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

%@test:1
%$ try
%$     strY = freq2string(1);
%$     strQ = freq2string(4);
%$     strM = freq2string(12);
%$     strW = freq2string(52);
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(strY, 'Y');
%$     t(3) = dassert(strQ, 'Q');
%$     t(4) = dassert(strM, 'M');
%$     t(5) = dassert(strW, 'W');
%$ end
%$
%$ T = all(t);
%@eof:1

%@test:2
%$ try
%$     str = freq2string(13);
%$     t(1) = false;
%$ catch
%$     t(1) = true;
%$ end
%$
%$ T = all(t);
%@eof:2
