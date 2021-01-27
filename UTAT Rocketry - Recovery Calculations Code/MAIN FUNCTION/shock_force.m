function [ShockForce] = shock_force(MainorDrogueChute, DragCoefficient, DragCoeffPrevStage, ChuteArea, ChuteAreaPrevStage, SpillHoleRadius, Height, Temperature, SaturationPressure, Humidity, DryMass)

% this function solves for the shock force that the system will experience
% at the given stage

% IMPORTANT! 
%    IF MAIN CHUTE CALCULATION, ENTER 1,IF DROGUE CALCULATION, ENTER 2

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
error = "ERROR: Enter 1 or 2" ;
Velocity = terminal_velocity ( DryMass, DragCoeffPrevStage, Height , Temperature ,SaturationPressure, Humidity, ChuteAreaPrevStage, SpillHoleRadius); 
%  To set a velocity, comment out the above formula 
OpeningLoadFactor = 0
if MainorDrogueChute == 1
    x1m = [0.001;0.0014;0.002;0.003;0.004;0.005;0.006;0.007;0.008;0.009;0.01];
    y1m = [1.2;1.186;1.179;1.157;1.136;1.129;1.121;1.1;1.086;1.079;1.064];

    x2m = [0.02;0.024;0.03;0.04;0.05;0.06;0.07;0.08;0.09;0.1];
    y2m = [1.007;0.979;0.943;0.9;0.857;0.8428;0.821;0.793;0.771;0.75];


    x3m = [0.2;0.245;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1];
    y3m = [0.657;0.6;0.557;0.486;0.436;0.371;0.35;0.314;0.286;0.257];


    x4m = [1.414;2;3;4;5;6];
    y4m = [0.164;0.114;0.0643;0.05;0.0358;0.0286];

    %%%

    xm = [0.001;0.0014;0.002;0.003;0.004;0.005;0.006;0.007;0.008;0.009;0.01;0.02;0.024;0.03;0.04;0.05;0.06;0.07;0.08;0.09;0.1;0.2;0.245;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;1.414;2;3;4;5;6];
    ym = [1.2;1.186;1.179;1.157;1.136;1.129;1.121;1.1;1.086;1.079;1.064;1.007;0.979;0.943;0.9;0.857;0.8428;0.821;0.793;0.771;0.75;0.657;0.6;0.557;0.486;0.436;0.371;0.35;0.314;0.286;0.257;0.164;0.114;0.0643;0.05;0.0358;0.0286];


    x = mass_ratio (DryMass, DragCoefficient, ChuteArea, Height, Temperature, SaturationPressure, Humidity); %Rm, input
    OpeningLoadFactor = interp1(log(xm),ym,log(x))
    
elseif MainorDrogueChute == 2
    
    x1d = [0.001;0.00119;0.0014;0.002;0.003;0.004;0.005;0.006;0.007;0.008;0.009;0.01];
    y1d = [1.35;1.35;1.35;1.35;1.345;1.345;1.34;1.34;1.335;1.33;1.33;1.325];

    x2d = [0.02;0.024;0.03;0.04;0.05;0.07;0.09;0.1];
    y2d = [1.293;1.271;1.257;1.214;1.186;1.157;1.121;1.107];

    x3d = [0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9];
    y3d = [1.043;0.96;0.9;0.86;0.81;0.78;0.75;0.733];

    x4d = [1;2;3;4;5;6;7;8;9;10];
    y4d = [0.71;0.57;0.475;0.41;0.36;0.3;0.275;0.25;0.22;0.2];

    %%%

    xd = [0.001;0.00119;0.0014;0.002;0.003;0.004;0.005;0.006;0.007;0.008;0.009;0.01;0.02;0.024;0.03;0.04;0.05;0.07;0.09;0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;2;3;4;5;6;7;8;9;10];
    yd = [1.35;1.35;1.35;1.35;1.345;1.345;1.34;1.34;1.335;1.33;1.33;1.325;1.293;1.271;1.257;1.214;1.186;1.157;1.121;1.107;1.043;0.96;0.9;0.86;0.81;0.78;0.75;0.733;0.71;0.57;0.475;0.41;0.36;0.3;0.275;0.25;0.22;0.2];

    Rm = mass_ratio (DryMass, DragCoefficient, ChuteArea, Height, Temperature, SaturationPressure, Humidity)
    OpeningLoadFactor = interp1(log(xd),yd,log(Rm))

else
    disp(error)


    
    ShockForce = DragCoefficient * A * ( (1/2) * Density * ( Velocity )^2 ) * OpeningLoadFactor 
    

end 


