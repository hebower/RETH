%Daniel Gomez and Hayley E. Bower, Purdue University
%Summer 2017
%Using CRaTER Data accessed from University of New Hampshire

%% Year 2009
clc, clear, close all
% Code colors (Do not worry about this!!!  I will explain you later)
b_d = [0       0.4471    0.7412];   r_d = [0.8510    0.3255    0.0980];
y_d = [0.9294  0.6941    0.1255];   k_d = [0.3137    0.3137    0.3137];
c_d = [0.3020  0.7451    0.9333];   cc_d = [0    0.7490    0.7490];
gr_d = [.7 .7 .7];    yd_d = [0.8  0.5    0];

% SPE 2009
data_SPE = load('UNH2009SPE.txt'); %Bring in the 2009 CRaTER Data
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

figure(1)
% One way to plot the MEAN and the STANDARD DEVIATION
% f1 = errorbar(mat(:,1),mat(:,3),mat(:,4),...
%     'color',gr_d,'linewidth',0.5,'marker','d','LineStyle','-','MarkerSize',5,'MarkerEdgeColor',r_d,'MarkerfaceColor',r_d); grid on, hold on
% set(gca,'xtick',[175:25:375],'ytick',[0.15:.01:.21],'fontweight','normal','fontsize',11,'box','on');
f1 = plot(mat(:,1),mat(:,3),'o','color',r_d,'MarkerSize',6,'MarkerfaceColor',r_d); hold on
title('2009')

figure(2)
subplot(3,2,1)
% hh = histogram(mat(2:end-1,3),24,'Normalization','pdf','FaceColor',r_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',r_d);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .17:0.001:.2;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'r','LineWidth',1.5)
ylabel('PDF','fontweight','bold','fontsize',12)
aa = title('2009','position',[0.2050 206.0440 -1.4211e-14]);

subplot(3,2,2)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',r_d), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'r','LineWidth',1.5),  grid on
legend('Exper. data (SPE2009)','Normal distr.','location','northwest')

%==================================================
% SPE 2010
clear DOY D1_2 mat  m_d st_d
data_SPE2010 = load('UNH2010SPE.txt'); %Bring in the 2010 CRaTER Data
DOY = data_SPE2010(:,3); %Day of Year
D1_2 = data_SPE2010(:,8); %Detectors 1&2 dose rates

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

figure(2)
subplot(3,2,3)
% hh = histogram(mat(2:end-1,3),20,'Normalization','pdf','FaceColor',b_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',b_d);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .14:0.001:.23;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'c','LineWidth',1.5)
ylabel('PDF','fontweight','bold','fontsize',12)
axis([ 0.14 .23 0 30])

subplot(3,2,4)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',b_d), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'c','LineWidth',1.5),  grid on
ylabel('CDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)
legend('Exper. data (SPE2010)','Normal distr.','location','northwest')

%==================================================
% SPE2011
clear DOY D1_2 y xx mat m_d st_d

data_SPE2011 = load('UNH2011SPE.txt'); %Bring in the 2011 CRaTER Data
DOY = data_SPE2011(:,3); %Day of Year
D1_2 = data_SPE2011(:,8); %Detectors 1&2 dose rates

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

figure(1)
% f3 = errorbar(mat(:,1),mat(:,3),mat(:,4),...
%     'color',gr_d,'linewidth',0.5,'marker','s','LineStyle','-','MarkerSize',5,'MarkerEdgeColor',yd_d,'MarkerfaceColor',y_d); grid on, hold on
% set(gca,'xtick',[175:25:375],'ytick',[0.15:.01:.21],'fontweight','normal','fontsize',11,'box','on')
f3 = plot(mat(:,1),mat(:,3),'s','color',y_d,'MarkerSize',6,'MarkerfaceColor',y_d); grid on, hold on
axis([0 370 0.05 5])
title('Solar Minimum')
xlabel('Day of the year','fontweight','bold','fontsize',12)
ylabel('Dose [cSv/day]','fontweight','bold','fontsize',12)

figure(2)
subplot(3,2,5)
% hh = histogram(mat(2:end-1,3),24,'Normalization','pdf','FaceColor',y_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',y_d);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .16:0.001:.19;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',yd_d)
ylabel('PDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)

subplot(3,2,6)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',y_d), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',yd_d),  grid on
ylabel('CDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)
 aaa = legend('Exper. data (SPE2011)','Normal distr.','location','northwest');

legend([f1 f2 f3],'2009','2010','2011')


% IMPORTANT:  This is the best way to save a figure as PDF in Matlab
% set(1,'PaperSize' ,[5.8 4.5],'PaperPositionMode','auto')
% print('-f1','-painters','Radiation_01','-dpdf')


print(1,'All_SPEMin', '-dpng', '-r900')
print(2,'Proba_SPEMin', '-dpng', '-r900')
