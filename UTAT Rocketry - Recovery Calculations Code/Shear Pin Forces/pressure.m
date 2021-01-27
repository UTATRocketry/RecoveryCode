function [Pressure] = pressure(Height)
    
% this function gives the pressure(Pa) based on a specific altitude and other
% constants

%VARIBALES
L= 0.0065 ; % K/m, temperature lapse rate
M = 0.02896 ; %kg/mol, molar mass of dry air
g = 9.81 ;  % m/s^2, gravity
Ru = 8.314; %J/mol・K, ideal gas constant 
Po = 101325 ; %Pa, standard pressure at sea level
To = 293.15 ;  %kelvin, Standard temp at sea level

%CALCULATION

error = "ERROR: Enter Positive Height Value" ;
                                                                    
if Height == 0
    Pressure = Po;
elseif Height < 0
  
   disp (error)   %SHOULD NOT HAVE ANY NEGATIVE HEIGHTS
    
else 
    Pressure = Po * (( 1 - ((L* Height) / To))^ ((g*M) / (Ru*L)) ) ; 
    
    
end 