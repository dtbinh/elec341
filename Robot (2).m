% This script sets all model  & controller parameters for the 
% Paint Booth Factory

% Example: Specifying a Dynamics Block
% n = [1 2 3];
% d = [4 5 6];
% Transfer Function = (s^2 + 2s + 3) / (4s^2 + 5s + 6)

% ===============
% NORMALIZE UNITS
% ===============
% Example:
% Mass      (Kg)
%M1 = M1 * 1e-3;              % Convert g -> Kg

% ========
%    Q0
% ========
% Pump
% ----
PK0 = 4136856;         % Convert PSI/V -> PA/V
PT0 = 0.0100;            % Convert ms -> s
PM0 = 1034214;         % Convert PSI -> PA

% Cylinder
% --------
ID0 = 0.250;            % Convert cm -> m
M0 = 95.78;                  % Mass Kg
B0 = 70;                      % Friction Kgm^2/s

% Feedback
% --------


% ========
%    Q1
% ========
% Amp
% ---
R1 = 1000;                % Convert Kohm -> ohm
R2 = 4000;                % Convert Kohm -> ohm
C1 = 5.0e-6;               % Convert uF -> F
C2 = 2.0e-6;               % Convert uF -> F
% Motor
% -----
MJ = 0.01600;       % Convert gcm^2 -> Kgm^2
MB = 6.5000e-05;       % Convert gcm^2/s -> Kgm^2/s

ML = 0.00120;              % Convert mH -> H
MR = 0.07500;              % Convert mohm -> ohm
MT = 5;              % Convert mNm/A -> Nm/A
ME = 0.381971863420549;         % Convert RPM/V -> Rad/s/V

% Gear
% ----
GM1 = 17;            % Convert g -> Kg
GJ1 = 0.0980000;            % Convert gm^2 -> Kgm^2
GB1 = 0.0020000;            % Convert gm^2/s -> Kgm^2/s
QL1 = -3.141592653589793;       % Convert deg -> rad
QU1 = 1.570796326794897;       % Convert deg -> rad

% Gravity
% -------
M1 = 1.295600000000000;              % Convert g -> Kg

% Feedback
% --------


% ========
%    Q2
% ========
% Amp
% ---
%Q1 and Q2 have the same amplifier values, so no need to repeat the SI
%conversions

% Motor
% -----
%Q1 and Q2 have the same motor values, so no need to repeat the SI
%conversions

% Gear
% ----
GM2 = 7;            % Convert g -> Kg
GJ2 = 0.003300;            % Convert gm^2 -> Kgm^2
GB2 = 6.50001e-04;            % Convert gm^2/s -> Kgm^2/s
QL2 = -2.513274122871835;       % Convert deg -> rad
QU2 = 2.513274122871835;       % Convert deg -> rad
% Feedback
% --------


% ==================
% TRANSFER FUNCTIONS
% ==================
% Compute transfer functions from above values and perform system analysis
% You may prefer to put this section in a separate .m file


% ========
%    Q0
% ========

% Pump Dynamics & Saturation
Pump0n = 413685600;                   % Gain * 1/time constant
Pump0d = [1,100];                       % 1/(s + 1/time constant)
Pump0sat = 1034214;

% Mechanical Dynamics
Mech0n = 3.436100;              % pump area 
Mech0d = [95.780000,70];                         % 1/(Ms + B)

% Joint Limit
JntMin0 = QL0;
JntMax0 = QU0;

% Controller Feedback Gain
FB0    = 1;


% ========
%    Q1
% ========

% Amplifier Dynamics & Saturation
Amp1n = [27.999999999999996,5000];
Amp1d = [8,1000];
AmpSat1 = 480;

% Electrical Dynamics & Torque Constant
Elec1n = 1;
Elec1d = [0.001200000000000,0.075000000000000];                        % 1/(Ls + R)
TConst1 = MT;

% Mechanical Dynamics & Back EMF
Mech1n = 1;
Mech1d = [0.1947 0.0021];      %Q1 inertia dependent on both Q1 and Q2 inertias
BackEMF1 = 0.381971863420549;

% Gearbox Reduction Ratio & Joint Limit
Gear1   = 0.020000000000000;
JntMin1 = -3.141592653589793;
JntMax1 = 1.570796326794897;

% Gravity
Grav = 12.7098;

% Controller Feedback Gain
FB1    = 1;


% ========
%    Q2
% ========

% Amplifier Dynamics & Saturation
Amp2n = [27.999999996,5000];
Amp2d = [8,1000];
AmpSat2 = 480;

% Electrical Dynamics & Torque Constant
Elec2n = 1;
Elec2d = [0.001200,0.0750000];                        % 1/(Ls + R)
TConst2 = MT;

% Mechanical Dynamics & Back EMF
Mech2n = 1;
Mech2d = [0.0193000000,7.150000e-04];            % Q2 inertia only dependent on Q2
BackEMF2 = 0.381971863420549;

% Gearbox Reduction Ratio & Joint Limit
Gear2   = 0.200000;
JntMin2 = -2.513274122871835;
JntMax2 = 2.513274122871835;

% Controller Feedback Gain
FB2    = 1;

