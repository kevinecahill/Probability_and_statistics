clear all
close all
clc
fs = 14; sf = 16; ts =12
data1252;
data2502;
data5002;
data10002;
plot(cent(:,1),cent(:,2),'k-','linewidth',2)
hold on
plot(deuxcent(:,1),deuxcent(:,2),'k--','linewidth',2)
plot(cinqcent(:,1),cinqcent(:,2),'k-.','linewidth',2)
plot(k(:,1),k(:,2),'k:','linewidth',2)
%plot(k(:,1),k(:,2),'k.','markersize',9)
axis([0 250 0 0.09])
%textt='Four binomial distributions'
%title(textt,'Interpreter','latex','fontsize',sf)
textx=('$n$')
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty='$P_b(n,p,N)$'
ylabel(texty,'Interpreter','latex','fontsize',sf)
%title('Four binomial distributions','fontsize',ts)
print -dpdf binomial
print -deps binomial
print -deps /Users/kevin/papers/math/binomial