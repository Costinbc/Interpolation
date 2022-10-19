function [V, W] = bloc_rational (A, B, C, sigma)
      
       [n, n] = size(A);
       S0 = inv((A - sigma(1)*eye(n))) * B;
       R0 = inv((A - sigma(1)*eye(n))') * C'; 
       
       [n, p] = size(C);
       H(1, 0) = 1;
       V1 = S0/H(1, 0);
       W1 = (eye(p) / V1)';
       G(1, 0) = R0 / W1;
       V(1) = V1;
       W(1) = W1;
       
       m = length(sigma);
       
       for k=1:m-1
         
       endfor
       
endfunction
