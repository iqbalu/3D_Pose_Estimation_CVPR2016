function feature = feature_bool_handLeftLift(mot,varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests if left wrist is located above the neck.
%
% Feature value 0: Hand not lifted.
% Feature value 1: Hand lifted.
%
% Parameters:
% neck_offset .... value of 0 corresponds to placement of test plane at neck, 
%                  value of 1 corresponds to placement of test plane at chest.

if (nargin<=1)
    neck_offset = 0;
else
    neck_offset = varargin{1};
end

chest_length = sqrt(sum((mot.jointTrajectories{trajectoryID(mot,'chest')}(:,1) - mot.jointTrajectories{trajectoryID(mot,'neck')}(:,1)).^2));

feature = feature_distPointNormalPlane(mot,'chest','neck','neck','lwrist') + neck_offset * chest_length;
feature = (feature >= 0);