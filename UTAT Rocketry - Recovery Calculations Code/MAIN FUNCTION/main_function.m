function [ TerminalVelocity, ShockForce, NumberofShearPins ] = main_function ( DryMass, DragCoefficient, DragCoeffPrevStage, Height, Temperature, SaturationPressure, Humidity, ChuteArea, ChuteAreaPrevStage, SpillHoleRadius, MainorDrogueChute, Diameter, BlackPowderMass, VolumeRecoveryBay, NoseConeMass, MaxShearPinForce, MinShearPinForce )

% This function calculates the terminal velocity, shock force, and number
% of shear pins required for a rocket at a parachute deployment stage 

% UNITS:
% DryMass =  Kilograms 
% DragCoefficient = No Units 
% Height = Meters
% Temperature = Celsius
% SaturationPressure = Pascals 
% Humidity = No units (percent decimal)
% ChuteArea = Meter Squared
% SpillHoleRadius = Meters 
% Opening Load Factor - Unitless 
% Diameter - Inches
% BlackPowderMass - grams 
% VolumeRecoveryBay - Cubic Inches
% NoseConeMass - Pounds
% MaxShearPinForce - lbs
% MinShearPinForce - lbs

TerminalVelocity = terminal_velocity ( DryMass, DragCoefficient, Height, Temperature, SaturationPressure, Humidity, ChuteArea, SpillHoleRadius ) 

ShockForce = shock_force ( DragCoefficient,DragCoeffPrevStage, ChuteArea, ChuteAreaPrevStage, SpillHoleRadius, Height, Temperature, SaturationPressure, Humidity, DryMass, OpeningLoadFactor)

NumberofShearPins = shear_pin_forces ( Height, SaturationPressure, Humidity, Diameter, BlackPowderMass, VolumeRecoveryBay, NoseConeMass, MaxShearPinForce, MinShearPinForce );

end

