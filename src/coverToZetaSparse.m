% ----------------------------------------------------------------------- %
% FUNCTION "coverToZetaSparse" calculates the zeta matrix from a cover    %
% graph adjacency matrix.                                                 %
%                                                                         %
%   Input parameters:                                                     %
%       - adj: The adjacency matrix of the cover graph.                   %
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
function [zeta] = coverToZetaSparse(adj)
zeta = adj;
for idx1 = size(adj,1):-1:1
    tmp = sparse(size(adj,1),1);
    for idx2 = find(zeta(:,idx1))'
        tmp = tmp | zeta(:,idx2);
    end
    zeta(:,idx1) = zeta(:,idx1) | tmp;
end
zeta = zeta + speye(size(zeta));
end

