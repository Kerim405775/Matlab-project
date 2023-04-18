function [int] = calka(a)
%  Funkcja zwracająca współczynniki wielomianu otrzymanego 
%  po scałkowaniu wielomianu a
%a = [1 -4 -1 10]
n = length(a)-1;
int = [1./(n+1:-1:1).*a(1:end),0];

end

