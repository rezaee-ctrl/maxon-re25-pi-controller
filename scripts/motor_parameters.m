%% =========================================================================
% Title: Maxon RE 25 (Part No. 339152) DC Motor PI Controller Design
% Description: Parameter initialization, 2nd-order transfer function modeling,
%              load disturbance transfer function, and Pole-Placement PI tuning.
% =========================================================================

clear; clc; close all;

fprintf('========================================================\n');
fprintf('  MAXON RE 25 (339152) - PI CONTROL PARAMETERS & MODELING\n');
fprintf('========================================================\n\n');

%% 1. Motor Physical Parameters & SI Unit Conversions
% Raw Catalog Data:
% Nominal Voltage: 24 V
% Nominal Speed: 9690 rpm -> converted to rad/s
% Nominal Torque: 27.1 mNm -> converted to N.m
% Resistance (Ra): 1.53 Ohm
% Inductance (La): 0.186 mH -> converted to H
% Rotor Inertia (J): 1.47 g.cm^2 -> converted to kg.m^2
% Torque Constant (Kt): 20.8 mNm/A -> converted to N.m/A
% Back-EMF Constant (Ke): 2.08 V/1000 rpm -> converted to V.s/rad

Ra = 1.53;                     % Armature resistance [Ohm]
La = 0.186e-3;                 % Armature inductance [H]
J  = 1.47e-6;                  % Rotor moment of inertia [kg.m^2]
Kt = 0.0208;                   % Torque constant [N.m/A]
Ke = 0.0208;                   % Back-EMF constant [V.s/rad]

% Operating References
omega_ref_rpm = 9690;
omega_ref = omega_ref_rpm * (2 * pi / 60); % Reference speed [rad/s] (~1014.5 rad/s)
T_nominal = 0.0271;                        % Nominal load torque [N.m] (27.1 mNm)

fprintf('-> Parameters successfully loaded in SI units.\n');
fprintf('   Reference Speed: %.2f rad/s (~%d rpm)\n', omega_ref, omega_ref_rpm);
fprintf('   Nominal Torque:  %.4f N.m\n\n', T_nominal);

%% 2. Transfer Function Denominator & Numerator Coefficients
% Characteristic equation coefficients for 2nd-order electrical-mechanical model:
% Den(s) = La*J*s^2 + Ra*J*s + Ke*Kt

b0 = Kt / (La * J);
a1 = Ra / La;
a0 = (Ke * Kt) / (La * J);

Den_coefficients = [La*J, Ra*J, Ke*Kt];

fprintf('-> Plant Transfer Function Coefficients:\n');
fprintf('   b0 = %.4e\n', b0);
fprintf('   a1 = %.4f\n', a1);
fprintf('   a0 = %.4e\n\n', a0);

%% 3. Pole-Placement PI Controller Design
% Desired specifications:
% Natural frequency (omega_n) = 500 rad/s
% Damping ratio (zeta)      = 0.707

omega_n = 500;
zeta    = 0.707;

% Step 1: Third pole location (p)
p = a1 - (2 * zeta * omega_n);

% Step 2: Proportional gain (Kp)
Kp = (omega_n^2 + (2 * zeta * omega_n * p) - a0) / b0;

% Step 3: Integral gain (Ki)
Ki = (p * omega_n^2) / b0;

fprintf('--------------------------------------------------------\n');
fprintf('  PI CONTROLLER GAINS (Pole Placement Method)\n');
fprintf('--------------------------------------------------------\n');
fprintf('  Proportional Gain (Kp) = %.4f\n', Kp);
fprintf('  Integral Gain     (Ki) = %.4f\n', Ki);
fprintf('--------------------------------------------------------\n\n');

%% 4. Transfer Function Definitions (for Simulink & Analysis)
s = tf('s');

% Voltage-to-Speed Transfer Function: Gv(s) = Kt / (La*J*s^2 + Ra*J*s + Ke*Kt)
Gv = Kt / (La*J*s^2 + Ra*J*s + Ke*Kt);

% Load Disturbance-to-Speed Transfer Function: GL(s) = -(La*s + Ra) / (La*J*s^2 + Ra*J*s + Ke*Kt)
GL = -(La*s + Ra) / (La*J*s^2 + Ra*J*s + Ke*Kt);

fprintf('-> Transfer functions Gv(s) and GL(s) initialized in workspace.\n');
fprintf('   You can now run your Simulink model: dc_motor_pi_sim.slx\n');