% ----------------------------------------------------------------------- %
% FUNCTION "createAllShifts" calculates all shift matrices for a lattice  %
% based on the zeta and Moebius matrix.                                   %
%                                                                         %
%   Input parameters:                                                     %
%       - zeta: The zeta matrix.                                          %
%       - mu: The Moebius matrix.                                         %
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
function [allShifts] = createAllShifts(zeta,mu)
allShifts = {};
nElements = size(zeta,1);

for idx1 = 1:nElements
    currShift = zeta * spdiags(zeta(idx1,:)',0,nElements,nElements) * mu;
    allShifts{end+1} = currShift;
end
end


