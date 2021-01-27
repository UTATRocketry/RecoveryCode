function [AreaofChute] = area_of_chute (Height, Temperature, SaturationPressure, Humidity, Mass, DragCoefficient, TerminalVelocity)  

%this function calculates the area of a chute based on an input terminal
%velocity 

% %UNITS
% Height - meters
% Temperature - Celsius 
% Saturation Pressure - Pascals
% Humidity - Decimal Percentage
% Mass - kilograms
% DragCoefficent - Unitless
% Terminal Velocity = meters/second 


%VARIABLES 

g = 9.81 ; % m/s^2  , gravity

%EQUATIONS 



Density = density( Height, Temperature, SaturationPressure, Humidity)

Temperature = Temperature + 273.15 ;


AreaofChute = ( 2 * Mass * g ) / (DragCoefficient * Density * (TerminalVelocity) ^ 2 ) 

end

