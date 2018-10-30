close all
clc
sf = 16; ts = 12;
n0 = 1;
en=0:.0001:2;
y = 1 - exp(-en);
p1 = plot(en,y,'k-','LineWidth',2)
hold on
%plot(en,en.^2/2,'r-','LineWidth',2)
axis([0 2 0 0.3]);
hold on
n0=2;
y = 1 - ( 1 + en).* exp(-en);
p2 = plot(en,y,'k-.','LineWidth',2)
%plot(en,en.^3/6,'r-.','LineWidth',2)
n0=3;
y = 1 - ( 1 + en + en.^2/2 ).* exp(-en);
p3 = plot(en,y,'k--','LineWidth',2)
%plot(en,en,'r--','LineWidth',2)
n0=4;
y = 1 - ( 1 + en + en.^2/2 + en.^3/factorial(3)).* exp(-en);
p4 = plot(en,y,'k:','LineWidth',2)
lh = legend([p1 p2 p3 p4],'\(N=1\)','\(N=2\)','\(N=3\)','\(N=4\)')
set(lh,'Interpreter','latex','Location','southeast')
%plot(en,en.^4/factorial(4),'r:','LineWidth',2)
%textt='Cancer rate';
%title(textt,'Interpreter','latex','fontsize',sf)
textx='Dose \(\langle n \rangle \) of radiation';
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty='\( P(\langle n \rangle)_N \)';
ylabel(texty,'Interpreter','latex','fontsize',sf)
%title('Rates of cancer','fontsize',ts)
%txt1 = '\( N = 1 \)'
%text(3.5e-3,1.3e-3,txt1,'Interpreter','latex','fontsize',sf)
%txt2 = '\( N = 2 \)'
%text(3.5e-3,1.6e-6,txt2,'Interpreter','latex','fontsize',sf)
%txt3 = '\( N = 3 \)'
%text(3.5e-3,1.3e-9,txt3,'Interpreter','latex','fontsize',sf)
%txt4 = '\( N = 4 \)'
%text(3.5e-3,1.3e-12,txt4,'Interpreter','latex','fontsize',sf)
print -deps /Users/kevin/papers/math/cancernew
%n0=5; y = 1 - ( 1 + en + en.^2/2 + en.^3/factorial(3) + en.^4/factorial(4) ) ...
 %   .* exp(-en); plot(en,y,'LineWidth',1)