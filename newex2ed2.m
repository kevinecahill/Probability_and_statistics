clear all
close all
clc
fs = 14; sf = 16; ts = 12;
load plotex20.dat
plot(plotex20(:,1),plotex20(:,2),'k.','linewidth',2)
hold on
load plotex21.dat
plot(plotex21(:,1),plotex21(:,2),'k-.','linewidth',2)
load plotex22.dat
plot(plotex22(:,1),plotex22(:,2),'k--','linewidth',2)
load plotex23.dat
plot(plotex23(:,1),plotex23(:,2),'k-','linewidth',2)
%title('Central limit of a quadratic distribution','fontsize',ts)
%title(textt,'Interpreter','latex','fontsize',sf)
textx=('$y$')
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty='$P^{(N)}(y)$'
ylabel(texty,'Interpreter','latex','fontsize',sf)
print -dpdf newcentralLTex2
print -deps newcentralLTex2
print -deps /Users/kevin/papers/math/newcentralLTex2