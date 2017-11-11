%Daniel Gomez and Hayley E. Bower, Purdue University
%Summer 2017
%Using CRaTER Data accessed from University of New Hampshire

%==================================================
% SPE
clear DOY D1_2 mat  m_d st_d
data_SPE = load('UNH2012SPE.txt'); %Bring in the 2012 CRaTER Data
DOY = data_SPE(:,3); %Day of Year
D1_2 = data_SPE(:,8); %Detectors 1&2 dose rates

jj=1;
for ii = DOY(1):DOY(end)
    [ind] = find(ii==DOY);
    if isempty(ind)~=1
    m_d = mean(D1_2(ind));
    st_d = std(D1_2(ind),1);
    mat(jj,:) = [ii length(ind) m_d st_d];
    else
        mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(1);
% f2 = errorbar(mat(:,1),mat(:,3),mat(:,4),...
%     'color',gr_d,'linewidth',0.5,'marker','o','LineStyle','-','MarkerSize',5,'MarkerEdgeColor',b_d,'MarkerfaceColor',b_d); grid on, hold on
% set(gca,'xtick',[175:25:375],'ytick',[0.15:.01:.21],'fontweight','normal','fontsize',11,'box','on')
f2 = plot(mat(:,1),mat(:,3),'d','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d); grid on, hold on
axis([182 244.5 -0.05 4.05])
title('SPE July-August 2012')
xlabel('Day of the year','fontweight','bold','fontsize',12)
ylabel('Dose [cSv/day]','fontweight','bold','fontsize',12)


% IMPORTANT:  This is the best way to save a figure as PDF in Matlab
% set(1,'PaperSize' ,[5.8 4.5],'PaperPositionMode','auto')
% print('-f1','-painters','Radiation_01','-dpdf')


print(1,'SPE2012JA', '-dpng', '-r900')

