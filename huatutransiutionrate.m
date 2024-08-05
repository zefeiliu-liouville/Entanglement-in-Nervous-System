% clear
% load('gamma_anharmonic_2_03.mat')
figure1 = figure();
plot(0.0:0.001:3.0,Gamma_10*1e-4)
hold on
plot(0.0:0.001:3.0,Gamma_21*1e-4)
% hold on
plot([0.0,3.0],[Gamma0_21*1e-4,Gamma0_21*1e-4],'k--')
% hold on
plot([0.0,3.0],[Gamma0_10*1e-4,Gamma0_10*1e-4],'k--')
legend('\fontname{Times New Roman}\fontsize{18}\it{\Gamma_{10}}','\fontname{Times New Roman}\fontsize{18}\it{\Gamma_{21}}')
xlabel('\it{d_{my}}    /\mum','FontSize',18,'FontName','Times New Roman')
ylabel('\it{Transition Rate}    \times10^{4}/s^{-1}','FontSize',18,'FontName','Times New Roman')
% 创建 textbox
annotation(figure1,'textbox',...
    [0.6838125 0.741549295774644 0.03884375 0.0528169014084487],...
    'String',{'\fontname{Times New Roman}\fontsize{18}\it{\Gamma^{(0)}_{10}}'},...
    'LineStyle','none',...
    'FitBoxToText','off');
% 创建 textbox
annotation(figure1,'textbox',...
    [0.82834375 0.251408450704212 0.03884375 0.0528169014084482],...
    'String','\fontname{Times New Roman}\fontsize{18}\it{\Gamma^{(0)}_{21}}',...
    'LineStyle','none',...
    'FitBoxToText','off');
% 创建 arrow
annotation(figure1,'arrow',[0.683203125 0.5],...
    [0.765197183098591 0.764084507042253]);
% 创建 arrow
annotation(figure1,'arrow',[0.6984375 0.7015625],...
    [0.739140845070422 0.188028169014084]);

axes('Position',[0.18 0.50 0.3 0.4])%
plot(0.0:0.001:3.0,Gamma_10)
hold on
plot(0.0:0.001:3.0,Gamma_21)
% hold on
% hold on
plot([0.0,3.0],[Gamma0_10,Gamma0_10],'k--')
ylim([0 Gamma0_10*1.1])
legend('\fontname{Times New Roman}\fontsize{12}\it{\Gamma_{10}}','\fontname{Times New Roman}\fontsize{12}\it{\Gamma_{21}}')
xlabel('\it{d_{my}}    /\mum','FontSize',14,'FontName','Times New Roman')
ylabel('\it{Transition Rate}    /s^{-1}','FontSize',14,'FontName','Times New Roman')