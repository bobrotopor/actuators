%% Предварительные приготовления

clear;
clc;

current_contour_name = "current_contour"; % имя модели симулинк контура тока
rate_contour_name = "rate_contour"; % имя модели симулинк контура скорости
pose_contour_name = "pose_contour"; % имя модели симулинк контура положения


%% Основыне параметры привода
R = 0.99 ;

kw = 0.98 ;
km = 0.98 ;
k_pow = 10 ; %10
k_curr = 1 ;
k_spd = 1 ;

J = 3.29e-3 ;
i = 262 ; %262 ;

T_e = 0.0068 ;
T_pow = 0.0004 ;
T_m = (J*R)/(km*kw);

w_max = 0.8;
a_max = 1 ;
t_accel = 0.8 ;
t_braking = 0.8 ;
t_const_rate = 1 ;

%расчет трапеции скорсти 


%% _______________________контур тока_________________________ %%

% ПИ - регулятор тока
r_coeff = 1 / (2*T_pow) ;
ki_curr = (r_coeff * R) / (k_curr * k_pow); % !!!!!!!!!!!!!!!!!!!
kp_curr = ki_curr * T_e ;  % тк T_рт = kp_curr/ki_curr = T_e

%% _______________________контур скорости_____________________ %%

% ПИ - регулятор скорости
% r = k_curr * ki_curr * k_pow * T_m / R; % !!!!!!!!!!!!!!!!!!!
% tau_rate = 4 * T_m / (1 + r);
% %v_coeff = (1 + r)^3 / (8*T_m*T_m) ;
% v_coeff = (1 + r)^2 / (2*T_m) ;
% ki_rate = v_coeff*kw / (k_spd * ki_curr *k_pow);
% kp_rate = ki_rate * tau_rate ;


%% _______________________Подсос данных в модели_________________________%%
sim(current_contour_name) ;
sim(rate_contour_name) ;

