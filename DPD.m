function dx = DPD (t,x,m1,m2,L1,L2,g)

dx = x;

dx(1) = x(3);
dx(2) = x(4);


denominator = L1 * L2 * (m2 * (cos (x(1) - x(2)))^2 - (m1+m2));
numerator1 = (L1 * sin (x(1)-x(2)) * x(3)^2 - g * sin (x(2))) * (L2 * m2 * cos (x(1) - x(2))) - (L2) * (-L2 * m2 * sin (x(1) - x(2)) * x(4)^2 - (m1+m2) * g * sin (x(1)));
numerator2 = (L1 * cos (x(1)-x(2))) * (-L2 * m2 * sin (x(1) - x(2)) * x(4)^2 - (m1+m2) * g * sin (x(1))) - (L1 * (m1+m2)) * (L1 * sin (x(1)-x(2)) * x(3)^2 - g * sin (x(2)));


dx(3) = numerator1 / denominator;
dx(4) = numerator2 / denominator;

end