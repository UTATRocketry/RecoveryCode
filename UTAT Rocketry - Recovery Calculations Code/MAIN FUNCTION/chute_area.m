function [PreciseChuteArea] = chute_area(ChuteArea, SpillHoleRadius)

%This function solves for the area of the chute, if there is no spill hole
%then the area given by the chute manufacturer will be sufficient
% Enter 0 for SpillHoleRadius if no spill hole
% Area input and output in (m^2)

% CALCULATION 

if SpillHoleRadius <= 0;
    
    PreciseChuteArea = ChuteArea ;
else
    PreciseChuteArea = ChuteArea - ( pi * (SpillHoleRadius)^2 ) ;
    
end 


