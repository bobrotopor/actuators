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

J = 0.00073 ;
i = 262 ; %262 ;

T_e = 0.0068 ;
T_pow = 0.0004 ;
T_m = (J*R)/(km*kw);

%% _______________________контур тока_________________________ %%

% ПИ - регулятор тока
r_coeff = 1 / (2*T_pow) ;
kp_curr = r_coeff*R / (k_curr * k_pow);
ki_curr = 1/T_e ;  %124

%% _______________________контур скорости_____________________ %%

% ПИ - регулятор скорости
v_coeff = 1 / (2*T_pow) ;
kp_rate = r_coeff*R / (k_curr * k_pow);
ki_rate = 1/T_e ;


%% _______________________Подсос данных в модели_________________________%%
sim(current_contour_name) ;
sim(rate_contour_name) ;

