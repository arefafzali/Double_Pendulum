function x = ConjugateGradientMethod(A,b,tol)
% This function is a solution for Ax=b using Conjugate Gradient Method.
% tol is for tolerance (epsilon).
    x = b; % Initial guess
    r = b - A*x;
    if norm(r) < tol
        return;
    end
    s = -r;
    alpha = (r'*s)/(s'*A*s);
    x = x + alpha*s;
    
    for k = 1:numel(b);
       r = r - alpha*A*s;
       if( norm(r) < tol )
            return;
       end
       Beta = (r'*A*s)/(s'*A*s);
       s = -r + Beta*s;
       alpha = (r'*s)/(s'*A*s);
       x = x + alpha*s;
    end
end