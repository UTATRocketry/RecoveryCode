function [MassRatio] = mass_ratio( DryMass, DragCoefficient, Area, Height, Temperature, SaturationPressure, Humidity)

% high force load caused by a sudden acceleration change = Shock force 
% two components to calculating shock force experienced on the rocket due to the sudden deceleration
% first determine a term called the “Mass Ratio” (this formula)
% “(CDA)3/2” represents the volume of air in the parachute canopy, and when multiplied by density by air and divided by mass gives the ratio between the mass of air in the parachute to the dry mass of the rocket
% Mass Ratio can be compared empirically to opening load factor, “Cx”, which expresses the magnitude of which the change in acceleration is amplified to a force at an instantaneous time
% (Use Graph) https://docs.google.com/document/d/1soyv4g3cOEbVdVVY9-n0VwkUO1V7JEsYHK1VoRDtlZw/edit?usp=sharing

% Units
% Drymass - kg
% DragCoefficient - Unitless
% Area - Meter squared
% Height - Meters
% Temperature - Celsius
% Sat Pressure - Pascals
% Humidity - decimal form

% CALCS

Density = density( Height, Temperature, SaturationPressure, Humidity)

MassRatio =  (Density *  ((DragCoefficient * Area )^ (3/2) ))  / DryMass 
    

end 