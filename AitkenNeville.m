function output = AitkenNeville(X, Y, p)
   input_size = length(X);
   polynomial = zeros(input_size,input_size);
   polynomial(:,1) = Y(:);
   for i = 1 : input_size - 1
      for j = 1 : input_size - i
         polynomial(j,i+1) = ((p-X(j))*polynomial(j+1,i) + (X(j+i)-p)*polynomial(j,i))/(X(j+i)-X(j));
      end
   end
   disp(polynomial);
   output = polynomial(1 , input_size);
end
