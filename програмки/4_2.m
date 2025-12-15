edit integral.m
function [I] = integral(a, b, n)
    f = @(x) x.^2 - 4*x;
    h = (b - a) / n;
    x = a:h:b;
    y = f(x);
    I = sum(y(2:end)) * h;
end