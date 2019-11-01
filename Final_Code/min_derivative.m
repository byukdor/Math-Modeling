function [gradient] = min_derivative(A,B,Q,R,P,time)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[ii,jj] = size(A);
gradient = sym(zeros(jj,1));

                    
    for good = 1:jj
        sum_whole = 0;
        for c = 1:jj
            sum_ex = 0;                 %Represents a Sum to calculate excess demand(supply)
            sum_der = 0;                 %Represents a Sum to calculate a derivative
            for n = (1:ii)               %For sum_excess
                sum_A = sum(A(n,:).*transpose(Q(:,time)));
                sum_B = sum(B(n,:).*transpose(Q(:,time)));
                sum_ex = sum_ex + R(n,time)*((sum_B/sum_A)*A(n,c)-B(n,c));
                sum_der = sum_der + R(n,time)*A(n,c)*(B(n,good)*sum_A-A(n,good)*sum_B)/((sum_A)^2);
            end
   
            sum_der = sum_der*2*P(good,time);
    
            sum_whole = sum_whole + sum_ex*sum_der;
        end
        gradient(good,1) = vpa(sum_whole);
    end
disp("Gradient Done")
end

