opath = path();

% Check that the m-unit-tests module is available.

install_unit_test_toolbox = false;

try
    initialize_unit_tests_toolbox;
catch
    urlwrite('https://github.com/DynareTeam/m-unit-tests/archive/master.zip','master.zip');
    warning('off','MATLAB:MKDIR:DirectoryExists')
    mkdir('../externals')
    warning('on','MATLAB:MKDIR:DirectoryExists')
    unzip('master.zip','../externals')
    delete('master.zip')
    addpath([pwd() '/../externals/m-unit-tests-master/src'])
    initialize_unit_tests_toolbox;
    install_unit_test_toolbox = true;
end

% Initialize the dseries module
try
    initialize_dates_toolbox;
catch
    unit_tests_root = strrep(which('runalltests'),'runalltests.m','');
    addpath([unit_tests_root '../src']);
    initialize_dates_toolbox;
end

if isoctave
    more off
end

tmp = dates_src_root;
tmp = tmp(1:end-1); % Remove trailing slash.
run_unitary_tests_in_directory(tmp);

delete('*.log');

if install_unit_test_toolbox
    rmdir('../externals/m-unit-tests-master','s');
end
path(opath);