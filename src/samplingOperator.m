% ----------------------------------------------------------------------- %
% FUNCTION "samplingOperator" calculates the sampling operator for given  %
% support.                                                                %
%                                                                         %
%   Input parameters:                                                     %
%       - support: The support of the signal.                             %
%       - latticeSize: The size of the lattice.                           %
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
function [sampOp] = samplingOperator(support, latticeSize)
sampOp = sparse(length(support), latticeSize);
sampOp(sub2ind(size(sampOp), 1:length(support), support)) = 1;
end

