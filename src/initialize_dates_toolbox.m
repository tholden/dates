% Get the path to the dates/src folder.
dates_src_root = strrep(which('initialize_dates_toolbox'),'initialize_dates_toolbox.m','');

% Add some subfolders to the path.
addpath([dates_src_root '/utilities/is'])
addpath([dates_src_root '/utilities/op'])
addpath([dates_src_root '/utilities/convert'])

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