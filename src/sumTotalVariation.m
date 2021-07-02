% ----------------------------------------------------------------------- %
% FUNCTION "sumTotalVariation" calculates the sum total variation of a    %
% lattice signal.                                                         %
%                                                                         %
%   Input parameters:                                                     %
%       - allIrreducibleShifts: A cell array of all irreducible shifts.   %
%       - vec: The  signal.                                               %
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
function [stv] = sumTotalVariation(allIrreducibleShifts,vec)
stv = 0;
for idx = 1:size(allIrreducibleShifts,2)
    stv = stv + norm(vec - allIrreducibleShifts{idx} * vec);
end
end

