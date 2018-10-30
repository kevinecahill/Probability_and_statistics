clear all
close all
clc
fs = 14; sf = 16; ts=12;
load plotex10.dat
plot(plotex10(:,1),plotex10(:,2),'k.','linewidth',2)
hold on
load plotex11.dat
plot(plotex11(:,1),plotex11(:,2),'k-.','linewidth',2)
load plotex12.dat
plot(plotex12(:,1),plotex12(:,2),'k--','linewidth',2)
load plotex13.dat
plot(plotex13(:,1),plotex13(:,2),'k-','linewidth',2)
%textt=('Illustration of the central limit theorem')
%title('Central limit of a uniform distribution','fontsize',ts)
textx=('$y$')
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty='$P^{(N)}(y)$'
ylabel(texty,'Interpreter','latex','fontsize',sf)
print -dpdf newcentralLTex1
print -deps newcentralLTex1
print -deps /Users/kevin/papers/math/newcentralLTex1