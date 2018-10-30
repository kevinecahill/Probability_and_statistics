clear all
close all
clc
fs = 14; sf = 16; ts = 12;
gauss; gosset;
plot(ga(:,1),ga(:,2),'k-','linewidth',2)
hold on
plot(go(:,1),go(:,2),'k-','linewidth',2)
axis([-5  5  0.  .7])
grid 'on'
%textt='$\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!$Comparison of $P_G(x,0,1)$ with $P_S(x,3,1)$'
%title('Comparison of the student and gaussian distributions','fontsize',ts)
textx='$x$'
xlabel(textx,'Interpreter','latex','fontsize',sf)
texty=('$P(x)$')
ylabel(texty,'Interpreter','latex','fontsize',sf)
text('Interpreter','latex','String','Gauss''s','Position',[1.8,.12],'FontSize',sf)
text('Interpreter','latex','String','student''s','Position',[.4,.6],'FontSize',sf)
print -dpdf gauGosbw
print -deps gauGosbw
print -deps /Users/kevin/papers/math/gauGosbw