function [c,c1] = projekt(aa,b,n,r)
XX = linspace(aa,b,1000); 
YY = f(XX);
X=linspace(aa,b,n); %Określenie argumentów w których będą granice "paseczków"
Y = f(X); %Obliczanie wartości dla tych argumentów
plot(X,Y,'o','MarkerIndices',1:1:length(Y)) 
%Wykreślanie tych punktów (wartości) na wykresie w formie węzłów
hold on;
plot(XX,YY,'-','linewidth',4) %Wykreślanie naszej funkcji idealnej
title('Kwadratura numeryczna do oblicznia całki')
xlabel('Przedział całkowania')
ylabel('Wartości funkcji')
hold on;
grid on;

y = 0;
c = 0;
c1 = 0;
for k=1:n-1  
         x = linspace(X(k),X(k+1),r+1); %dzielenie każdego paska na 100 punktów
         y = f(x);  %funkcja zdefiniowana osobno w innym pliku
         for q =1:1:length(x) %interpolacja funkcji metodą Lagrange'a za pomocą miacierzy
                A(q,:) = x(q).^[r:-1:0];
         end
         a = inv(A)*y(:);
         a = a';
         c = c + polyval(polyint(a),X(k+1)) - polyval(polyint(a),X(k));  %funkcje wbudowane
         c1 = c1 + wartosc_funkcji(calka(a),X(k+1)) - wartosc_funkcji(calka(a),X(k)); %funkcje własne
         xx = linspace(X(k),X(k+1),100); %generujemy dziedzinę do wykresu
         yy = polyval(a,xx); %dla każdego argumentu dziedziny xx obliczamy wartość wielomianu a
         area(xx,yy)
end
xm = (aa+b)/2;
ym = (f(aa)+f(b))/2;
wartosc = 'Wartość całki: '+string(c);
text(xm-0.5,ym-0.5,wartosc,'FontSize',12);
end

