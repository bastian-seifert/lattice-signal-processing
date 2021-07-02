% ----------------------------------------------------------------------- %
% FUNCTION "plotLatticeData" plots a lattice signal on the nodes of the   %
% lattice.                                                                %
%                                                                         %
%   Input parameters:                                                     %
%       - Adj: The adjacency matrix of the cover graph.                   %
%       - nodeData:  The signal values at each node.                      %
%       - varargin:     (Optional) Parameters to change Layout.           %
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
function [] = plotLatticeData(Adj,nodeData,varargin)
p = inputParser;
addParameter(p,'OuterMarkerSize',5);
addParameter(p,'InnerMarkerSize',4);
addParameter(p,'ColorRange',[min(nodeData),max(nodeData)]);
addParameter(p,'Layout','layered');
addParameter(p,'NodeLabel',[]);
addParameter(p,'FilterData',false); %filter the data, i.e. make nodes with small values transparent
parse(p,varargin{:});
figure;
D = digraph(Adj);
if p.Results.FilterData
    if strcmp(p.Results.Layout, 'layered')
        lineHandle = plot(D,...
        'MarkerSize',0.5*p.Results.OuterMarkerSize,'ArrowPosition', 0.99, 'EdgeColor',[0.5,0.5,0.5],...
        'NodeColor',[0.5,0.5,0.5], 'NodeLabel',p.Results.NodeLabel, ...
        'Layout', p.Results.Layout, 'AssignLayers', 'alap');
        hold on;
        nodeHandle = plot(D,...
        'MarkerSize',0.5*p.Results.InnerMarkerSize,'EdgeAlpha',0,'NodeLabel',[], ...
        'Layout',p.Results.Layout,'NodeColor', 'white', 'AssignLayers', 'alap');
    else
        lineHandle = plot(D,...
        'MarkerSize',0.5*p.Results.OuterMarkerSize,'ArrowPosition', 0.99, 'EdgeColor',[0.5,0.5,0.5],...
        'NodeColor',[0.5,0.5,0.5], 'NodeLabel',p.Results.NodeLabel, ...
        'Layout', p.Results.Layout);
        hold on;
        nodeHandle = plot(D,...
        'MarkerSize',0.5*p.Results.InnerMarkerSize,'EdgeAlpha',0,'NodeLabel',[], ...
        'Layout',p.Results.Layout,'NodeColor', 'white');
    end
    %nodeHandle.NodeCData = nodeData;
    linewidths = (0.25*Adj)';
    lineHandle.LineWidth = linewidths(find(linewidths));
    arrowsizes = (4*Adj)';
    lineHandle.ArrowSize = arrowsizes(find(arrowsizes));
    nonZeroNodes = find(abs(nodeData) >= 0.1);
    scatter(nodeHandle.XData(nonZeroNodes), nodeHandle.YData(nonZeroNodes),5*p.Results.InnerMarkerSize,abs(nodeData(nonZeroNodes)),'filled','MarkerEdgeColor','black')
    caxis(gca,p.Results.ColorRange);
    %colormap(flipud(hot))    
    for it = nonZeroNodes        
        idx = findedge(D,it,successors(D, it));
        highlight(lineHandle,'Edges',idx(idx~=0),'EdgeColor','black', 'LineWidth',0.6);
    end    
    ax = gca;
    ax.XColor = 'white';
    ax.YColor = 'white';
else
    if strcmp(p.Results.Layout, 'layered')
    lineHandle = plot(D,...
        'MarkerSize',p.Results.OuterMarkerSize,'ArrowPosition', 0.99, 'EdgeColor','black',...
        'NodeColor','black','EdgeAlpha',0.4, 'NodeLabel',p.Results.NodeLabel, ...
        'Layout', p.Results.Layout, 'AssignLayers', 'alap');
    hold on;
	nodeHandle = plot(D,...
        'MarkerSize',p.Results.InnerMarkerSize,'EdgeAlpha',0,'NodeLabel',[], ...
        'Layout',p.Results.Layout, 'AssignLayers', 'alap');
    else
    lineHandle = plot(D,...
        'MarkerSize',p.Results.OuterMarkerSize,'ArrowPosition', 0.99, 'EdgeColor','black',...
        'NodeColor','black','EdgeAlpha',0.4, 'NodeLabel',p.Results.NodeLabel, ...
        'Layout', p.Results.Layout);
    hold on;
	nodeHandle = plot(D,...
        'MarkerSize',p.Results.InnerMarkerSize,'EdgeAlpha',0,'NodeLabel',[], ...
        'Layout',p.Results.Layout);
    end
    caxis(gca,p.Results.ColorRange);
    nodeHandle.NodeCData = nodeData;
    linewidths = (0.25*Adj)';
    lineHandle.LineWidth = linewidths(find(linewidths));
    arrowsizes = (6*Adj)';
    lineHandle.ArrowSize = arrowsizes(find(arrowsizes));
    colormap(jet)  
    ax = gca;
    ax.XColor = 'white';
    ax.YColor = 'white';
end
%set(gca.ColorBar, 'YTickLabel', cellstr(num2str(reshape(get(gca.ColorBar, 'YTick'),[],1),'%0.0f')) )
end

