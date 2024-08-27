% Filename : nthLinearODE
% This is for calculating yp 
% for nth ODE By using Wroskian Methods 

syms x;syms y;syms z;syms f

f = input(' put f(x) from the Linear ODE  ');
row = [];
n = input('which order of ODE?   ');
for i = 1:n
    fprintf('\n Put Solution Basis의 %i-th element  ', i);
    y = input('What is the ith element of Solution Basis  ?         ');
    row = [row y]; 
end
W = [row];
row1 = row;
for i = 1:n-1
    row2 = diff(row1);
    W = [W; row2];
    row1 = row2;
end

Fcolumn = [ zeros(n-1,1) ; f ];

yp = 0;
for i = 1:n
    Wi = W; Wi(:,i)= Fcolumn;
    ypi = int(det(Wi)/det(W),x);
    yp = yp + row(i) * ypi;
end 


fprintf("\n Particular solution is printed as below. \n")

simplify(yp)

