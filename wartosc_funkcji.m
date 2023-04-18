function [wart] = wartosc_funkcji(b,x)
%Funkcja obliczająca wartość funkcji b w punkcie x
Nx = length(x);
N = length(b);
y2 = zeros(1,Nx);
for n=1:N
    for k=1:Nx
        y2(k) = y2(k)+b(n)*x(k).^(N-n);
    end
end
wart=y2;
end

