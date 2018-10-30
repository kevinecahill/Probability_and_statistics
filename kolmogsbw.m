clear all
close all
clc
fs = 14; sf = 16; ts = 12;
kolout410000; kolexga42; kolexst22; kolexst32;
plot(out(:,1),out(:,2),'k-','linewidth',2)
hold on
plot(four(:,1),four(:,2),'k-','linewidth',1)
plot(two(:,1),two(:,2),'k-','linewidth',1)
plot(three(:,1),three(:,2),'k-','linewidth',1)
axis([0  4  0  1])
grid 'on'
textt='$\!\!\!\!\!\!\!\!\!\!$Kolmogorov''s Test'
%title('Kolmogorov''s test','fontsize',ts)
textx='$u$'
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty=('Pr$(u)$')
ylabel(texty,'Interpreter','latex','fontsize',sf)
text('Interpreter','latex','String','$\mbox{Pr}_{e,S,G}^{(2)}$','Position',[1.5,.6],'FontSize',sf)
text('Interpreter','latex','String','$\mbox{Pr}_{e,S,G}^{(3)}$','Position',[2.45,.22],'FontSize',sf)
text('Interpreter','latex','String','$\mbox{Pr}_{e,G,G}^{(4)}$','Position',[0.6,.91],'FontSize',sf)
print -dpdf kolmogsbw
print -deps kolmogsbw
print -deps /Users/kevin/papers/math/kolmogsbw