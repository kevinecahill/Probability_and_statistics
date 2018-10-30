clear all
close all
clc
fs = 14; sf = 16; ts = 12;
load plotex30.dat
plot(plotex30(:,1),plotex30(:,2),'k.','linewidth',2)
hold on
load plotex31.dat
plot(plotex31(:,1),plotex31(:,2),'k-.','linewidth',2)
load plotex32.dat
plot(plotex32(:,1),plotex32(:,2),'k--','linewidth',2)
load plotex35.dat
plot(plotex35(:,1),plotex35(:,2),'k-','linewidth',2)
%title('Central limit theorem for \( 12 \, (x-1/2)^2 \)','Interpreter','latex','fontsize',ts)
%title(textt,'Interpreter','latex','fontsize',sf)
textx=('$y$')
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty='$P^{(N)}(y)$'
ylabel(texty,'Interpreter','latex','fontsize',sf)
print -dpdf newcentralLTex3
print -deps newcentralLTex3
print -deps /Users/kevin/papers/math/newcentralLTex3