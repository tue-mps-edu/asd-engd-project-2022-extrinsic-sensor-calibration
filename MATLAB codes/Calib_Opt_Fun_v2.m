function [xs, fval] = Calib_Opt_Fun_v2(Lc, Lr, x0)

fun = @(x) calib_opt_err_v2(Lc, Lr, x);  % cost function 

A = [];  %constraints
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
nonlcon = [];

options = optimoptions('fmincon','Algorithm','sqp','display','none'); 

[xs, fval] = fmincon(fun,x0, A,b,Aeq,beq,lb,ub,nonlcon,options);  %optimised values (roll, pitch, yaw, x, y, z) and final cost

end