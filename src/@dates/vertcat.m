function B = vertcat(varargin)
    
% Overloads the vertcat method for dates objects.
%
% INPUTS 
%  o A1    dates object.
%  o A2    dates object.
%  o ...
%
% OUTPUTS 
%  o B    dates object containing dates defined in A1, A2, ...
%
% EXAMPLE 1 
%  If A, B and C are dates object the following syntax:
%    
%    D = [A; B; C] ;
%
%  Defines a dates object D containing the dates appearing in A, B and C.
    
% Copyright (C) 2013 Dynare Team
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

B = horzcat(varargin{:});