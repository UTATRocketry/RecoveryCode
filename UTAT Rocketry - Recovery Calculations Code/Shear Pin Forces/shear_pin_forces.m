function [NumberofShearPinsMin, NumberofShearPinsMax] = shear_pin_forces ( Height, SaturationPressure, Humidity, Diameter, BlackPowderMass, VolumeRecoveryBay, NoseConeMass, MaxShearPinForce, MinShearPinForce)

%this function calculates the min and max number of shear pins neccesary to
%withstand the pressure force at apogee but break when the actuation system
%is launched 

%UNITS

% Height - meters
% Saturation Pressure - Pascals
% Humidity - Decimal Percentage
% Diameter - Inches
% BlackPowderMass - Pounds
% VolumeRecoveryBay - Cubic Inches
% NoseConeMass - Pounds
% MaxShearPinForce - lbs
% MinShearPinForce - lbs

%VARIABLES

L= 0.0065 ; % K/m, temperature lapse rate
M = 0.02896 ; %kg/mol, molar mass of dry air
g = 9.80665 ;  % m/s^2, gravity
Ru = 8.314 ; %J/mol・K, ideal gas constant 
Po = 101325 ; %Pa, standard pressure at sea level
To = 288.15 ;  %kelvin, Standard temp at sea level
Area = (pi / 4 ) * (Diameter )^ 2 ;

%CALCS

TotalPressure1 = (pressure (Height) + (SaturationPressure * Humidity)) ;

TotalPressure = TotalPressure1 * 0.000145038 ; 


PressureHeight = TotalPressure *  0.000145038 * ( 1 - ( (L* Height) / To) ^( (g*M) / (Ru*L))) ; 

ForceNoseCone = Area * (TotalPressure - PressureHeight); 

PressurizationPressure = ( ( BlackPowderMass / 454 ) * 265.92 * (3307 / VolumeRecoveryBay)) ; 

MaxForce = PressurizationPressure * Area + NoseConeMass ; 

NumberofShearPinsMin = ForceNoseCone / MinShearPinForce 

NumberofShearPinsMax = MaxForce / MaxShearPinForce 

end 