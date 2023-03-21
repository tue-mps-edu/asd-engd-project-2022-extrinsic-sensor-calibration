function F = calib_opt_err(yc, yr, x)

% foc = int_cam(1);
% dx = int_cam(2);
% dy = int_cam(3);
% u0 = int_cam(5);
% v0 = int_cam(4);

% foc = 2.95e-3;
% u0 = 600;
% v0 = 800;
dx = 4.5e-6;
dy = 4.5e-6;

ci = [x(7) 0 0 0; 0 x(7) 0 0; 0 0 1 0];
f = 0;
t = trvec2tform([x(4) x(5) x(6)]);
r = rotm2tform(eul2rotm([x(1) x(2) x(3)]));
ip = [1/dx 0 x(8); 0 1/dy x(9); 0 0 1];


A = t*r*yr;
A = A./(A(3,:));
A = ip*ci*A;

for i = 1:1:size(yc, 2)
%     A = ci*t*r*yr(:,i);
%     A = A./(-A(3,1));
%     A = ip*A;
    f = f + norm(yc(:,i) - A(:,i));
end

F = f;

end