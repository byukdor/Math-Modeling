function [price_result] = price_update(gradient,P,Ex,time,A,B,Q,R)
%   UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%   Initial Value ODE problem solving with Euler's method
[ii,jj] = size(A);

N=7;
epsilon = 1*10^(-5);
tau = .001;
sprintf("Parameters are N = %d, epsilon = %f, tau = %f",N,epsilon,tau)
value = randn(jj,N);                                %Matrix with Random points on unit sphere
price_result = zeros(jj,1);                               %variable to store result
price = zeros(jj,N);                                %variable to store price


    for matrix = 1:N
        previous = 1;
        count = 0;
        new = 0;
        new_gradient = matlabFunction(gradient,'Vars', {P(:,time)});
        while norm(previous-new) > epsilon & count < 5000
            if count == 0
                value_for = value(:,matrix);                                    %random points on a unit sphere
                value_for = value_for/sqrt(sum(value_for.^2));                  %Normalize
                %new = subs(gradient(:,time),P(:,time),value_for);
                new = new_gradient(value_for);               %initial value assign
                count = count + 1;
            end
            if count > 0 
                previous = new;
                part = new_gradient(previous);
               %part = subs(gradient(:,time),P(:,time),previous);
                new = (previous - tau*part)/norm(previous - tau*part);
                count = count + 1;
                if rem(count,3000) == 0
                    sprintf("%dth loop with %f difference time spent %d", count, norm(previous - new),round(toc))
                end
            end
        end
        price(:,matrix) = new;
        %sprintf('%d%% done for calculating price equilibrium for period %d',(round((matrix/N)*100)),time)
    end
    
    price_uniq = unique(abs(round(price,4)).','rows').';
    len_price = size(price_uniq,2);
    if len_price == 1
        price_result = vpa(price_uniq(:,1))                                                                                                                                                                                                                                              
    else    
    %Walras Law
        sum_final = zeros(len_price,1);
        for index = 1:len_price
            sum_ = 0;
            for good = 1:jj
                sum_ = sum_ + (price_uniq(good,index)^2)*subs(Ex(good,time),P(:,time),price_uniq(:,index));
            end
            sum_final(index) = sum_;
        end
        
        %If all candidates meets Walras Law, then check by substituting into
        %Phi function
        if sum(sum_final) < epsilon                             %if sum of all Walras is below tolerance
            phi = sym(zeros(len_price,1));
            for cand = 1:len_price
                for c = 1:jj
                    sum_ex = 0;                 %Represents a Sum to calculate excess demand(supply)
                    for n = (1:ii)               %For sum_excess
                        sum_A = 0;
                        sum_B = 0;
                        for k = (1:jj)
                            sum_B = sum_B + B(n,k)*Q(k,time);
                            sum_A = sum_A + A(n,k)*Q(k,time);
                        end
                        sum_ex = sum_ex + R(n,time)*((sum_B/sum_A)*A(n,c)-B(n,c));
                    end
                    if subs(sum_ex,P(:,time),price_uniq(:,cand)) > 0
                        phi(cand) = phi(cand) + subs(sum_ex,P(:,time),price_uniq(:,cand))^2;
                    end
                end
                phi(cand) = vpa(1/2*phi(cand),6);
            end
            result_ = find(phi == min(phi));
            price_result = vpa(price_uniq(:,result_(1)))
        else
            result_ = find(sum_final == min(sum_final));
            price_result = vpa(price_uniq(:,result_(1)))
        end
    end
end

