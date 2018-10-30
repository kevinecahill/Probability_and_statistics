clear all
close all
clc
fs = 14; sf = 16; ts =12; gap = 0.05
erfPlot; sig1; sig2; sig3; y=0:.01:1;
xa = 2.12132034355964 ;
plot(erf(:,1),erf(:,2),'k-','linewidth',2)
hold on
plot(unsig(:,1),unsig(:,2),'k--','linewidth',1)
plot(deuxsig(:,1),deuxsig(:,2),'k-.','linewidth',1)
plot(xa*ones(size(y)),y,'k.','markersize',3)
axis([0 2.5 0 1])
%textt='$\!\!\!\!\!\!\!\!\!\!\!\!$The Error Function'
%title(textt,'Interpreter','latex','fontsize',sf)
textx=('$x$')
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty='erf$(x)$'
ylabel(texty,'Interpreter','latex','fontsize',sf)
text('Interpreter','latex','String','$1 \sigma$','Position',[0.707106781186547+gap,0.1],'FontSize',sf)
text('Interpreter','latex','String','$2 \sigma$','Position',[1.41421356237309+gap,0.1],'FontSize',sf)
text('Interpreter','latex','String','$3 \sigma$','Position',[2.12132034355964+gap,0.1],'FontSize',sf)
%title('Error function','fontsize',ts)
print -dpdf erfbw
print -deps erfbw
print -deps /Users/kevin/papers/math/erfbw