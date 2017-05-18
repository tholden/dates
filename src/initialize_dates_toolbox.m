% Copyright (C) 2014-2017 Dynare Team
%
% This code is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare dseries submodule is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

% Get the path to the dates/src folder.
dates_src_root = strrep(which('initialize_dates_toolbox'),'initialize_dates_toolbox.m','');

% Add some subfolders to the path.
addpath([dates_src_root '/utilities/is'])
addpath([dates_src_root '/utilities/op'])
addpath([dates_src_root '/utilities/convert'])

% Add empty dates object in the base workspace
dates('initialize');

% Add missing routines if dynare is not in the path
if ~exist('isint','file')
    addpath([dates_src_root '/utilities/missing/isint'])
end

if ~exist('isoctave','file')
    addpath([dates_src_root '/utilities/missing/isoctave'])
end

if ~isoctave && (~exist('rows','file') || ~exist('columns','file'))
    addpath([dates_src_root '/utilities/missing/dims'])
end

if ~exist('shiftS','file')
    addpath([dates_src_root '/utilities/missing/shiftS'])
end

if ~exist('matlab_ver_less_than','file')
    addpath([dates_src_root '/utilities/missing/matlab_ver_less_than'])
end