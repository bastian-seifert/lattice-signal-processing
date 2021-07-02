% ----------------------------------------------------------------------- %
% FUNCTION "wienerFilterCoefficients" calculates the Wiener filter        %
% coefficients for a signal and its shifted noisy versions.               %
%                                                                         %
%   Input parameters:                                                     %
%       - signal: The clean signal.                                       %
%       - noisyShiftedSignals: Matrix with all shifted versions of the    %
%                              noisy signal.                              %
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
function [wienerCoeffs] = wienerFilterCoefficients(signal, noisyShiftedSignals)
autoCorr = noisyShiftedSignals' * noisyShiftedSignals;
crossCorr = noisyShiftedSignals' * signal;
wienerCoeffs = autoCorr\crossCorr;
end

