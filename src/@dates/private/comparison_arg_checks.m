function [o, p] = comparison_arg_checks(varargin)

% Returns two dates objects or an error if objects to be compared are not compatible.
%
% INPUTS 
% - varargin
%
% OUTPUTS 
% - o [dates] dates object with n or 1 elements.
% - p [dates] dates object with n or 1 elements.

% Copyright (C) 2014 Dynare Team
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

if ~isequal(nargin,2)
    error('dates:ge:ArgCheck','I need exactly two input arguments!')
end

if ~isa(varargin{1},'dates') || ~isa(varargin{2},'dates')
    error('dates:ge:ArgCheck','Input arguments have to be dates objects!')
end

if ~isequal(varargin{1}.freq,varargin{2}.freq)
    error('dates:ge:ArgCheck','Input arguments must have common frequency!')
end

if ~isequal(varargin{1}.ndat, varargin{2}.ndat) && ~(isequal(varargin{1}.ndat,1) || isequal(varargin{2}.ndat,1))
    error('dates:ge:ArgCheck','Dimensions are not consistent!')
end

o = varargin{1};
p = varargin{2};