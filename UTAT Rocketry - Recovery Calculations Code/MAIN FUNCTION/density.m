function [Density] = density( Height, Temperature, SaturationPressure, Humidity)

%this function calculates the density of the air at a given height (m),
%including humidity (no unit) as a decimal 
% https://www.engineeringtoolbox.com/international-standard-atmosphere-d_985.html

% SET SATURATIONPRESSURE AND HUMIDITY TO 0 TO CALC SIMPLE DENSITY, does not
% consider humididty, and is therefore less precise
    
%it looks at the partial pressures of water and dry air to make a more
%precise calculation 

%the units for density are kg/m^3

%temperature pressure to be entered in Celsius, will be converted 

% pressure in Pa

%VARIABLES

DensityNearGround = 1.216 ; 
Pwater_vapour = Humidity * SaturationPressure ;  %pressure of water vapour
Rspecific_Water_Vapour = 461.495; %J/kg, specific ideal gas constant of water vapour
Rspecific_Dry_Air = 287.058; %J/Kg*K , specific idea gas constant of dry air
Pdry_air = pressure(Height) ; %pressure of dry air
Temperature = Temperature + 273.15; %converts to kelvin
Rspec = 287.058 ;  %J/kgK, specific ideal gas constant 

%EQUATION

densityvapour = ( Pwater_vapour ) / ( Rspecific_Water_Vapour * Temperature) ; 
densitydry = ( Pdry_air ) / ( Rspecific_Dry_Air * Temperature ) ; 

if SaturationPressure > 0 && Humidity > 0 
    
    Density =  densityvapour + densitydry ; 
    
else 
    Density  = Pdry_air / (Rspec* Temperature) ;
    
end 


