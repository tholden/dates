% Copyright (C) 2014-2017 Dynare Team
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


% Get the path to the dates/src folder.
dates_src_root = strrep(which('initialize_dates_toolbox'),'initialize_dates_toolbox.m','');

% Set the subfolders to be added in the path.
p = {'/utilities/is'; ...
     '/utilities/op'; ...
     '/utilities/convert'};

% Add missing routines if dynare is not in the path
if ~exist('isint','file')
    p{end+1} = '/utilities/missing/isint';
end

if ~exist('isoctave','file')
    p{end+1} = '/utilities/missing/isoctave';
end

if ~exist('shiftS','file')
    p{end+1} = '/utilities/missing/shiftS';
end

if ~exist('matlab_ver_less_than','file')
    p{end+1} = '/utilities/missing/matlab_ver_less_than';
end

% Set path
P = cellfun(@(c)[dates_src_root(1:end-1) c], p, 'uni', false);
addpath(P{:});

if ~isoctave && (~exist('rows','file') || ~exist('columns','file'))
    addpath([dates_src_root(1:end-1) '/utilities/missing/dims']);
end