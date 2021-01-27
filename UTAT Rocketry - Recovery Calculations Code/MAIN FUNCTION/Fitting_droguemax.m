%Drogue Max

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


Rm = 0.05 %input
Cx = interp1(log(xd),yd,log(Rm));

figure
semilogx(xd,yd)
hold on
plot(Rm,Cx,'p')
hold off
grid

Cx %Output

