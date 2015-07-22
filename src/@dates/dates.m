classdef dates<handle

% Copyright (C) 2014-2015 Dynare Team
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

    properties
        freq = []; % Frequency (integer scalar)
        time = []; % Array (one row for every date. first column is the year, second is the period)
    end

    methods
        function o = dates(varargin)
            if ~nargin || ( nargin == 1 && strcmp( varargin{1}, 'initialize' ) )
                % Returns empty dates object.
                o.freq = NaN(0);
                o.time = NaN(0,2);
                return
            end
            if all(cellfun(@isdates, varargin))
                % Concatenates dates objects in a dates object.
                o = horzcat(varargin{:});
                return
            end
            if all(cellfun(@isstringdate,varargin))
                % Concatenates dates in a dates object.
                tmp = cellfun(@string2date,varargin);
                if all([tmp.freq]-tmp(1).freq==0)
                    o.freq = tmp(1).freq;
                else
                    error('dates:ArgCheck', 'All dates passed as inputs must have the same frequency!')
                end
                o.time = transpose(reshape([tmp.time], 2, length(tmp)));
                return
            end
            if isequal(nargin,1) && isfreq(varargin{1})
                % Instantiate an empty dates object (only set frequency)
                o = dates();
                if ischar(varargin{1})
                    o.freq = string2freq(varargin{1});
                else
                    o.freq = varargin{1};
                end
                return
            end
            if isequal(nargin,3) && isfreq(varargin{1})
                o = dates();
                if ischar(varargin{1})
                    o.freq = string2freq(varargin{1});
                else
                    o.freq = varargin{1};
                 end
                if (isnumeric(varargin{2}) && isvector(varargin{2}) && all(isint(varargin{2})))
                    if isnumeric(varargin{3}) && isvector(varargin{3}) && all(isint(varargin{3}))
                        if all(varargin{3}>=1) && all(varargin{3}<=o.freq)
                            o.time = [varargin{2}(:), varargin{3}(:)];
                        else
                            error('dates:ArgCheck','Third input must contain integers between 1 and %i.', o.freq)
                        end
                    else
                        error('dates:ArgCheck','Third input must be a vector of integers.')
                    end
                else
                    error('dates:ArgCheck','Second input must be a vector of integers.')
                end
                return
            end
            if isequal(nargin,2) && isfreq(varargin{1})
                o = dates();
                if ischar(varargin{1})
                    o.freq = string2freq(varargin{1});
                else
                    o.freq = varargin{1};
                end
                if isequal(o.freq, 1)
                    if (isnumeric(varargin{2}) && isvector(varargin{2}) && all(isint(varargin{2})))
                        o.time = [varargin{2}, ones(length(varargin{2}),1)];
                        return
                    else
                        error('dates:ArgCheck','Second input must be a vector of integers.')
                    end
                else
                    if isequal(size(varargin{2},2), 2)
                        if all(isint(varargin{2}(:,1))) && all(isint(varargin{2}(:,1)))
                            if all(varargin{2}(:,2)>=1) && all(varargin{2}(:,2)<=o.freq)
                                o.time = [varargin{2}(:,1), varargin{2}(:,2)];
                            else
                                error('dates:ArgCheck','Second column of the last input must contain integers between 1 and %i.',o.freq)
                            end
                        else
                            error('dates:ArgCheck','Second input argument must be an array of integers.')
                        end
                    else
                        error('dates:ArgCheck','Wrong calling sequence!')
                    end
                end
                return
            end
            error('dates:ArgCheck','You should first read the manual!')
        end % dates constructor.
    end % methods 
end % classdef


%@test:1
%$ % Define some dates
%$ B1 = '1945Q3';
%$ B2 = '1950Q2';
%$ B3 = '1950q1';
%$ B4 = '1953Q4';
%$
%$ % Define expected results.
%$ e.time = [1945 3; 1950 2; 1950 1; 1953 4];
%$ e.freq = 4;
%$
%$ % Call the tested routine.
%$ d = dates(B1,B2,B3,B4);
%$
%$ % Check the results.
%$ t(1) = dassert(d.time,e.time);
%$ t(2) = dassert(d.freq,e.freq);
%$ t(3) = dassert(d.ndat(),e.ndat());
%$ T = all(t);
%@eof:1

%@test:2
%$ % Define some dates
%$ B1 = '1945M3';
%$ B2 = '1950M2';
%$ B3 = '1950M10';
%$ B4 = '1953M12';
%$
%$ % Define expected results.
%$ e.time = [1945 3; 1950 2; 1950 10; 1953 12];
%$ e.freq = 12;
%$
%$ % Call the tested routine.
%$ d = dates(B1,B2,B3,B4);
%$
%$ % Check the results.
%$ t(1) = dassert(d.time,e.time);
%$ t(2) = dassert(d.freq,e.freq);
%$ t(3) = dassert(d.ndat(),e.ndat());
%$ T = all(t);
%@eof:2

%@test:3
%$ % Define some dates
%$ B1 = '1945y';
%$ B2 = '1950Y';
%$ B3 = '1950a';
%$ B4 = '1953A';
%$
%$ % Define expected results.
%$ e.time = [1945 1; 1950 1; 1950 1; 1953 1];
%$ e.freq = 1;
%$
%$ % Call the tested routine.
%$ d = dates(B1,B2,B3,B4);
%$
%$ % Check the results.
%$ t(1) = dassert(d.time,e.time);
%$ t(2) = dassert(d.freq,e.freq);
%$ t(3) = dassert(d.ndat(),e.ndat());
%$ T = all(t);
%@eof:3

%@test:4
%$ % Define a dates object
%$ B = dates('1950Q1'):dates('1960Q3');
%$
%$
%$ % Call the tested routine.
%$ d = B(2);
%$ if isa(d,'dates')
%$     t(1) = 1;
%$ else
%$     t(1) = 0;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(d.freq,B.freq);
%$     t(3) = dassert(d.time,[1950 2]);
%$ end
%$ T = all(t);
%@eof:4

%@test:5
%$ % Define a dates object
%$ B = dates(4,1950,1):dates(4,1960,3);
%$
%$ % Call the tested routine.
%$ d = B(2);
%$ if isa(d,'dates')
%$     t(1) = 1;
%$ else
%$     t(1) = 0;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(d.freq,B.freq);
%$     t(3) = dassert(d.time,[1950 2]);
%$ end
%$ T = all(t);
%@eof:5

%@test:6
%$ % Define a dates object
%$ B = dates(4,[1950 1]):dates(4,[1960 3]);
%$
%$ % Call the tested routine.
%$ d = B(2);
%$ if isa(d,'dates')
%$     t(1) = 1;
%$ else
%$     t(1) = 0;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(d.freq,B.freq);
%$     t(3) = dassert(d.time,[1950 2]);
%$ end
%$ T = all(t);
%@eof:6

%@test:7
%$ try
%$   B = dates(4,[1950; 1950], [1; 2]);
%$   t = 1;
%$ catch
%$   t = 0;
%$ end
%$
%$ T = all(t);
%@eof:7

%@test:8
%$ try
%$   B = dates(4,[1950, 1950], [1, 2]);
%$   t = 1;
%$ catch
%$   t = 0;
%$ end
%$
%$ T = all(t);
%@eof:8
