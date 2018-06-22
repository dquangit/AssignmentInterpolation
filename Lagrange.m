function output = Lagrange(X, Y, P)
    n = length(Y) - 1 ;
    S= 0;
    for i=1:n+1
        L=1;
        for j=1:n+1
            if j~=i
               L = L*(P-X(j)) / (X(i)-X(j));
            end
        end     
        S=S+Y(i)*L;
    end
    output = S;
end





%expand(S)

%subplot(111);
%plot(X,Y,'sr');hold on;
%ezplot(S,[-2 -4]);hold off;


%value = polyfit(X,Y,3);
%X1 = linspace(-2,3,10);
%Y1 = polyval(value,X1);

%subplot(111);
%plot(X1,Y1,'g');hold on;
%plot(X,Y,'sr');hold off;



