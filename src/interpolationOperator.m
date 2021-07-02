% ----------------------------------------------------------------------- %
% FUNCTION "interpolationOperator" calculates the interpolation operator  %
% for given support.                                                      %
%                                                                         %
%   Input parameters:                                                     %
%       - zeta: The zeta matrix of the lattice.                           %
%       - support: The support of the signal.                             %
% ----------------------------------------------------------------------- %
%   Versions:                                                             %
%       - v1.0.:    (27/11/2020)                                          %
% ----------------------------------------------------------------------- %
%       - Author:   Bastian Seifert                                       %
%       - Date:     27/11/2020                                            %
%       - Version:  1.0                                                   %
%       - E-mail:   bastian.seifert (at) inf.ethz.ch                      %
%                                                                         %
%       Advanced Computing Laboratory                                     %  
%       Department of Computer Science, ETH Zurich, Switzerland           %
% ----------------------------------------------------------------------- %
function [interpOp] = interpolationOperator(zeta, support)
interpOp = zeta(:,support) / zeta( support,support);
end

