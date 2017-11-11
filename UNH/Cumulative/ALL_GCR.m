%Daniel Gomez and Hayley E. Bower, Purdue University
%Summer 2017
%Using CRaTER Data accessed from University of New Hampshire

%% Year 2009
clc, clear, close all
% Code colors (Do not worry about this!!!  I will explain you later)
y   = [1       1         0     ];   m   = [1         0         1     ];
c   = [0       1         1     ];   r   = [1         0         0     ];
g   = [0       1         0     ];   b   = [0         0         1     ];
b_d = [0       0.4471    0.7412];   r_d = [0.8510    0.3255    0.0980];
y_d = [0.9294  0.6941    0.1255];   k_d = [0.3137    0.3137    0.3137];
c_d = [0.3020  0.7451    0.9333];   cc_d = [0    0.7490    0.7490];
gr_d = [.7 .7 .7];    yd_d = [0.8  0.5    0];
% GCR 2009
data_GCR = load('UNH2009GCR.txt'); %Bring in the 2009 CRaTER Data
DOY = data_GCR(:,3); %Day of Year
D1_2 = data_GCR(:,8); %Detectors 1&2 dose rates

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
f1 = plot(mat(:,1),mat(:,3),'h','color',r,'MarkerSize',6,'MarkerfaceColor',r); hold on
title('2009')

figure(2)
subplot(6,2,1)
% hh = histogram(mat(2:end-1,3),24,'Normalization','pdf','FaceColor',r_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',r);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .17:0.001:.2;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'r','LineWidth',1.5)
ylabel('PDF','fontweight','bold','fontsize',12)
aa = title('2009','position',[0.2050 206.0440 -1.4211e-14]);

subplot(6,2,2)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',r), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'r','LineWidth',1.5),  grid on
legend('Exper. data (GCR2009)','Normal distr.','location','northwest')

%==================================================
% GCR 2010
clear DOY D1_2 mat  m_d st_d
data_GCR2010 = load('UNH2010GCR.txt'); %Bring in the 2010 CRaTER Data
DOY = data_GCR2010(:,3); %Day of Year
D1_2 = data_GCR2010(:,8); %Detectors 1&2 dose rates

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
f2 = plot(mat(:,1),mat(:,3),'d','color',b,'MarkerSize',6,'MarkerfaceColor',b); grid on, hold on

figure(2)
subplot(6,2,3)
% hh = histogram(mat(2:end-1,3),20,'Normalization','pdf','FaceColor',b_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',b);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .14:0.001:.23;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'b','LineWidth',1.5)
ylabel('PDF','fontweight','bold','fontsize',12)
axis([ 0.14 .23 0 30])

subplot(6,2,4)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',b), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'b','LineWidth',1.5),  grid on
ylabel('CDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)
legend('Exper. data (GCR2010)','Normal distr.','location','northwest')

%==================================================
% GCR2011
clear DOY D1_2 y xx mat m_d st_d

data_GCR2011 = load('UNH2011GCR.txt'); %Bring in the 2011 CRaTER Data
DOY = data_GCR2011(:,3); %Day of Year
D1_2 = data_GCR2011(:,8); %Detectors 1&2 dose rates

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
f3 = plot(mat(:,1),mat(:,3),'s','color',g,'MarkerSize',6,'MarkerfaceColor',g); grid on, hold on
axis([0 370 0.05 0.22])
title('Solar Minimum')
xlabel('Day of the year','fontweight','bold','fontsize',12)
ylabel('Dose [cSv/day]','fontweight','bold','fontsize',12)

figure(2)
subplot(6,2,5)
% hh = histogram(mat(2:end-1,3),24,'Normalization','pdf','FaceColor',y_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',g);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .16:0.001:.19;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',g)
ylabel('PDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)

subplot(6,2,6)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',g), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',g),  grid on
ylabel('CDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)
 aaa = legend('Exper. data (GCR2011)','Normal distr.','location','northwest');

%==================================================
% GCR 2012
clear DOY D1_2 y xx mat m_d st_d

data_GCR = load('UNH2012GCR.txt'); %Bring in the 2012 CRaTER Data
DOY = data_GCR(:,3); %Day of Year
D1_2 = data_GCR(:,8); %Detectors 1&2 dose rates

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
% f4 = errorbar(mat(:,1),mat(:,3),mat(:,4),...
%     'color',gr_d,'linewidth',0.5,'marker','d','LineStyle','-','MarkerSize',5,'MarkerEdgeColor',r_d,'MarkerfaceColor',r_d); grid on, hold on
% set(gca,'xtick',[175:25:375],'ytick',[0.15:.01:.21],'fontweight','normal','fontsize',11,'box','on');
f4 = plot(mat(:,1),mat(:,3),'*','color',y_d,'MarkerSize',6,'MarkerfaceColor',y_d); hold on
title('2012')

figure(2)
subplot(6,2,7)
% hh = histogram(mat(2:end-1,3),24,'Normalization','pdf','FaceColor',r_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',y_d);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .17:0.001:.2;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',y_d),  grid on
ylabel('PDF','fontweight','bold','fontsize',12)
aa = title('2012','position',[0.2050 206.0440 -1.4211e-14]);

subplot(6,2,8)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',y_d), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',y_d),  grid on
legend('Exper. data (GCR2012)','Normal distr.','location','northwest')

%==================================================
% GCR 2013
clear DOY D1_2 mat  m_d st_d
data_GCR2013 = load('UNH2013GCR.txt'); %Bring in the 2013 CRaTER Data
DOY = data_GCR2013(:,3); %Day of Year
D1_2 = data_GCR2013(:,8); %Detectors 1&2 dose rates

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
% f5 = errorbar(mat(:,1),mat(:,3),mat(:,4),...
%     'color',gr_d,'linewidth',0.5,'marker','o','LineStyle','-','MarkerSize',5,'MarkerEdgeColor',b_d,'MarkerfaceColor',b_d); grid on, hold on
% set(gca,'xtick',[175:25:375],'ytick',[0.15:.01:.21],'fontweight','normal','fontsize',11,'box','on')
f5 = plot(mat(:,1),mat(:,3),'^','color',m,'MarkerSize',6,'MarkerfaceColor',m); grid on, hold on

figure(2)
subplot(6,2,9)
% hh = histogram(mat(2:end-1,3),20,'Normalization','pdf','FaceColor',b_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',m);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .14:0.001:.23;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'m','LineWidth',1.5)
ylabel('PDF','fontweight','bold','fontsize',12)
axis([ 0.14 .23 0 30])

subplot(6,2,10)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',m), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'m','LineWidth',1.5),  grid on
ylabel('CDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)
legend('Exper. data (GCR2013)','Normal distr.','location','northwest')

%==================================================
% GCR2014
clear DOY D1_2 y xx mat m_d st_d

data_GCR2014 = load('UNH2014GCR.txt'); %Bring in the 2014 CRaTER Data
DOY = data_GCR2014(:,3); %Day of Year
D1_2 = data_GCR2014(:,8); %Detectors 1&2 dose rates

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
% f6 = errorbar(mat(:,1),mat(:,3),mat(:,4),...
%     'color',gr_d,'linewidth',0.5,'marker','o','LineStyle','-','MarkerSize',5,'MarkerEdgeColor',b_d,'MarkerfaceColor',b_d); grid on, hold on
% set(gca,'xtick',[175:25:375],'ytick',[0.15:.01:.21],'fontweight','normal','fontsize',11,'box','on')
f6 = plot(mat(:,1),mat(:,3),'o','color',cc_d,'MarkerSize',6,'MarkerfaceColor',cc_d); grid on, hold on
axis([0 370 0.05 0.22])
title('GCR')
xlabel('Day of the year','fontweight','bold','fontsize',12)
ylabel('Dose [cSv/day]','fontweight','bold','fontsize',12)

figure(2)
subplot(6,2,11)
% hh = histogram(mat(2:end-1,3),24,'Normalization','pdf','FaceColor',y_d); hold on, grid on
n=length(mat(2:end-1,3));
[counts,centers] = hist(mat(2:end-1,3),24);
prob = counts/ (n * (centers(2)-centers(1)));
H = bar(centers,prob,'hist'); hold on, grid on
set(H,'facecolor',cc_d);

mu = mean(mat(2:end-1,3));
sigma = std(mat(2:end-1,3),1);
xx = .16:0.001:.19;
% y = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
y = pdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',cc_d)
ylabel('PDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)

subplot(6,2,12)
count_sum = cumsum(prob);
plot(centers(1:end),count_sum/(count_sum(end)),'color',cc_d), grid on, hold on
y = cdf('normal',xx,mu,sigma);
plot(xx,y,'LineWidth',1.5,'color',cc_d),  grid on
ylabel('CDF','fontweight','bold','fontsize',12)
xlabel('Average Dose/day','fontweight','bold','fontsize',12)
 aaa = legend('Exper. data (GCR2014)','Normal distr.','location','northwest');

legend([f1 f2 f3 f4 f5 f6],'2009','2010','2011','2012','2013','2014')


% IMPORTANT:  This is the best way to save a figure as PDF in Matlab
% set(1,'PaperSize' ,[5.8 4.5],'PaperPositionMode','auto')
% print('-f1','-painters','Radiation_01','-dpdf')


print(1,'All_GCR', '-dpng', '-r900')
print(2,'Proba_GCR', '-dpng', '-r900')
