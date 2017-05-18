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