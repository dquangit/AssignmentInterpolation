function [l, L] = lagrange(x, y) 
%Dua vao : x = [x0 x1 ... xn], y = [y0 y1 ... yn] 
%ket qua: l = He so cua da thuc Lagrange bac n 
% L = Da thuc Lagrange  
n = length(x) - 1; %bac cua da thucl 
l = 0; 
for m = 1:n + 1 
    p = 1; 
    for k = 1:n + 1 
        if k ~= m 
            p = conv(p, [1 -x(k)])/(x(m) - x(k));  
        end 
    end 
    L(m, :) = p; %da thuc Lagrange  
    l = l + y(m)*p;  
end  
l