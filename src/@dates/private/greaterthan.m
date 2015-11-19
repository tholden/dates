function c = greaterthan(a,b) % --*-- Unitary tests --*--

% Copyright (C) 2013-2014 Dynare Team
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

if a(1)>b(1)
    c = true;
else
    if a(1)<b(1)
        c = false;
    else
        if a(2)>b(2)
            c = true;
        else
            c = false;
        end
    end
end

%@test:1
%$ OPATH = pwd();
%$ [DATES_PATH, junk1, junk2] = fileparts(which('dates'));
%$ cd([DATES_PATH '/private']);
%$
%$ a = [2, 4];
%$ b = [1, 2];
%$
%$ try
%$     boolean = greaterthan(a, b);
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
%$ cd(OPATH);
%@eof:1

%@test:2
%$ OPATH = pwd();
%$ [DATES_PATH, junk1, junk2] = fileparts(which('dates'));
%$ cd([DATES_PATH '/private']);
%$
%$ a = [1, 4];
%$ b = [2, 2];
%$
%$ try
%$     boolean = greaterthan(a, b);
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, false);
%$ end
%$
%$ T = all(t);
%$ cd(OPATH);
%@eof:2

%@test:3
%$ OPATH = pwd();
%$ [DATES_PATH, junk1, junk2] = fileparts(which('dates'));
%$ cd([DATES_PATH '/private']);
%$
%$ a = [1, 4];
%$ b = [1, 2];
%$
%$ try
%$     boolean = greaterthan(a, b);
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
%$ cd(OPATH);
%@eof:3

%@test:4
%$ OPATH = pwd();
%$ [DATES_PATH, junk1, junk2] = fileparts(which('dates'));
%$ cd([DATES_PATH '/private']);
%$
%$ a = [1, 2];
%$ b = [1, 4];
%$
%$ try
%$     boolean = greaterthan(a, b);
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, false);
%$ end
%$
%$ T = all(t);
%$ cd(OPATH);
%@eof:4

%@test:5
%$ OPATH = pwd();
%$ [DATES_PATH, junk1, junk2] = fileparts(which('dates'));
%$ cd([DATES_PATH '/private']);
%$
%$ a = [1, 2];
%$ b = [1, 2];
%$
%$ try
%$     boolean = greaterthan(a, b);
%$     t(1) = true;
%$ catch
%$     t(1) = false;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(boolean, false);
%$ end
%$
%$ T = all(t);
%$ cd(OPATH);
%@eof:5
