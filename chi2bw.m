clear all
close all
clc
fs = 14; sf = 16; ts = 12; heit = 0.02
Pr21000000; Pr41000000; Pr61000000; Pr81000000; Pr101000000; 
plot(two(:,1),two(:,2),'k-','linewidth',2)
hold on
plot(four(:,1),four(:,2),'k-','linewidth',2)
plot(six(:,1),six(:,2),'k-','linewidth',2)
plot(eight(:,1),eight(:,2),'k-','linewidth',2)
plot(ten(:,1),ten(:,2),'k-','linewidth',2)
axis([0.  30.  0.  0.2])
grid 'on'
%textt='$\!\!\!\!\!\!\!\!\!\!$The Chi-Squared Test'
%title('Chi-squared test','fontsize',ts)
texty=('Pr$_{N-M}(\chi^2 >\chi_0^2)$')
textx='$\chi_0^2$'
xlabel(textx,'Interpreter','latex','fontsize',sf)
ylabel(texty,'Interpreter','latex','fontsize',sf)
text('Interpreter','latex','String','\(N-M ={} 2\)','Position',[2.0,heit],'FontSize',fs)
text('Interpreter','latex','String','4','Position',[10.3,heit],'FontSize',fs)
text('Interpreter','latex','String','6','Position',[13.6,heit],'FontSize',fs)
text('Interpreter','latex','String','8','Position',[16.8,heit],'FontSize',fs)
text('Interpreter','latex','String','10','Position',[19.3,heit],'FontSize',fs)
print -dpdf chi2bw
print -deps chi2bw
print -deps /Users/kevin/papers/math/chi2bw