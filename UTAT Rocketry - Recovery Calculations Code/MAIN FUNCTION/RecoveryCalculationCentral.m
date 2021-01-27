% Welcome to Recovery Calculation Central!

% Edit the Excel File "RecoveryInputData.xls" with your inputs to calculate the terminal velocity, 
% shock force, and number
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

DryMass = 0;
DragCoefficient = 0;
DragCoeffPrevStage = 0;
Height = 0;
Temperature = 0;
SaturationPressure = 0;
Humidity = 0;
ChuteArea = 0;
ChuteAreaPrevStage = 0;
SpillHoleRadius = 0;
OpeningLoadFactor = 0;
Diameter = 0;
BlackPowderMass = 0;
VolumeRecoveryBay = 0;
NoseConeMass = 0;
MaxShearPinForce = 0;
MinShearPinForce = 0;

InputData =  xlsread('RecoveryInputData.xls')

DryMass = InputData(1);
DragCoefficient = InputData(2);
DragCoeffPrevStage = InputData(3);
Height = InputData(4);
Temperature = InputData(5);
SaturationPressure = InputData(6);
Humidity = InputData(7);
ChuteArea = InputData(8);
ChuteAreaPrevStage = InputData(9);
SpillHoleRadius = InputData(10);
OpeningLoadFactor = InputData(11);
Diameter = InputData(12);
BlackPowderMass = InputData(13);
VolumeRecoveryBay = InputData(14);
NoseConeMass = InputData(15);
MaxShearPinForce = InputData(16);
MinShearPinForce = InputData(17);

RecoveryCalculations = main_function ( DryMass, DragCoefficient, DragCoeffPrevStage, Height, Temperature, SaturationPressure, Humidity, ChuteArea, ChuteAreaPrevStage, SpillHoleRadius, OpeningLoadFactor, Diameter, BlackPowderMass, VolumeRecoveryBay, NoseConeMass, MaxShearPinForce, MinShearPinForce );


