function retval = bloc_nesimetric (A, V, W, m)
  [Q, R] = qr(W' * V);
  
  V1(1) = V * inv (R);
  W1(1) = W * Q;
  V2(2) = A * V1(1);
  W2(2) = A' * W1(1);
  
  for j = 1:m
    alfa(j) = W1(j)' * V2(j+1);
    V2(j+1) = V2(j+1) - V1(j)*alfa(j);
    W2(j+1) = W2(j+1) - W1(j)*alfa(j)';
    
    beta = V2(j+1)/V1(j+1);
    delta' = W2(j+1)/W1(j+1);
    
    [U S Z'] = W1(j+1)' * V1(j+1);
    delta(j+1) = delta(j+1) * U(j) * sqrt(S(j));
    delta(j+1) = sqrt(S(j)) * Z(j)' * beta(j+1);
    V1(j+1) = V1(j+1) * Z(j) * (1/sqrt(S(j)));
    V2(j+2) = A * V1(j+1) - V1(j) * delta(j+1);
    W2(j+2) = A' * W1(j+1) - W1(j)*beta(j+1)';
  endfor
  
endfunction
