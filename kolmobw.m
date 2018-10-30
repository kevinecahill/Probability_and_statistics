clear all
close all
clc
fs = 14; sf = 16; ts = 12; heit = 0.05
kol310000;
plot(kol(:,1),kol(:,2),'k-','linewidth',2)
axis([0.  2.  0.  1.])
grid 'on'
%textt='$\!\!\!\!\!\!\!\!\!\!\!\!\!$Kolmogorov''s Distribution'
%title('Kolmogorov''s Distribution','fontsize',ts)
textx='$u$'
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty=('$K(u)$')
ylabel(texty,'Interpreter','latex','fontsize',sf)
print -dpdf kolmobw
print -deps kolmobw
print -deps /Users/kevin/papers/math/kolmobw