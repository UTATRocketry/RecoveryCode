function [TerminalVelocity] = terminal_velocity( DryMass, DragCoefficient, Height, Temperature, SaturationPressure, Humidity, ChuteArea, SpillHoleRadius)

%This function calculates the terminal velocity for your desired rocket
%stage:

%     the force equilibrium is the drag force and the buoyancy force acting upward and the force of gravity acting downward
%     FNET= FD+FB-FG=0
%     buoyancy force upward is negligible (density and volume of air is minimal compared to other forces)
%     use the drag coefficient, “CD” for drag
%     FD=FG
%     1/2 * A * CD * v^2 = m g - REARRANGE FOR VELOCITY TO GET CALC FORMULA BELOW

%If you want to use density that does not consider humidity, enter Zero for
%the SaturationPressure and Humidity inputs
% If the parachute does not have a spill hole, enter Zero

% The Dry Mass we are looking for the dry mass of the rocket
% Sometimes needs to be modified: If for example the deployment method is in a configuration where the nose cone resides 
% between the main and drogue parachute, calculations for velocity terminal after main deployment should first consider the drogue 
% and nose cone separately, and then consider the main and the rest of the rocket, with us desiring the latter to have a higher terminal
% velocity to circumvent the nose cone falling onto the top of the main’s canopy. In this case, we would consider the nose cone mass 
% as well as the dry mass of the rocket subtracting the nose cone mass separately and respectively

% UNITS:
% DryMass =  Kilograms 
% DragCoefficient = No Units 
% Height = Meters
% Temperature = Celsius
% SaturationPressure = Pascals 
% Humidity = No units (percent decimal)
% ChuteArea = Meter Squared
% SpillHoleRadius = Meters 


%VARIABLES

g = 9.80665 ; % m/s^2, gravity


% CALCULATION

Density = density( Height, Temperature, SaturationPressure, Humidity); 
A = chute_area (ChuteArea, SpillHoleRadius); 

    
TerminalVelocity  = (  (2 * DryMass * g) / ( (Density) * A * DragCoefficient ) )^ (1/2);
    
 
end

