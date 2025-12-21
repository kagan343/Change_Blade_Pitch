function [updatedZ_point, updatedY_point] = translate(Z_point, Y_point, deltaZ, deltaY)
% Translate z and y point of inlet/ outlet since start and end points
% of the profile tips change location due to pitch change
% delta.[Z_lead, Y_lead, Z_trail, Y_trail]    
        
    updatedZ_point = Z_point - deltaZ;
    updatedY_point = Y_point - deltaY;

end