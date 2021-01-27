function [ShockForce] = shock_force(DragCoefficient, DragCoeffPrevStage, ChuteArea, ChuteAreaPrevStage, SpillHoleRadius, Height, Temperature, SaturationPressure, Humidity, DryMass, OpeningLoadFactor)

% this function solves for the shock force that the system will experience
% at the given stage

% Units:
% Shockforce - Newtons
% Drymass - kg
% DragCoefficient - Unitless
% ChuteArea - Meter squared
% SpillHoleRadius - Meters
% Height - Meters
% Temperature - Celsius
% Sat Pressure - Pascals
% Humidity - decimal form
% Opening Load Factor - Unitless 

% the velocity used in the shock force caluclation is the velocity of the
% system BEFORE the specific chute you are looking for is released 

% CALCS

A = chute_area (ChuteArea, SpillHoleRadius);
Density = density( Height, Temperature, SaturationPressure, Humidity);
Velocity = terminal_velocity ( DryMass, DragCoeffPrevStage, Height , Temperature ,SaturationPressure, Humidity, ChuteAreaPrevStage, SpillHoleRadius);
%  To set a velocity, comment out the above formula 

% OpeningLoadFactor = load_factor ..... 

ShockForce = DragCoefficient * A * ( (1/2) * Density * ( Velocity )^2 ) * OpeningLoadFactor ; 
    


end 


