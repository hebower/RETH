%Daniel Gomez and Hayley E. Bower, Purdue University
%Summer 2017
%Using CRaTER Data accessed from University of New Hampshire

%% Year 2009
clc, clear, close all
r_d = [0.8510    0.3255    0.0980]; % Code colors

% SPE
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
f1 = plot(mat(:,1),mat(:,3),'o','color',r_d,'MarkerSize',6,'MarkerfaceColor',r_d); %mat(:,3) !!!!!!!!!!!!!
title('2009')

SPE2009 = sum(mat(:,3))/189; %there were zero days with no information, but only half of a year

legend([f1],'SPE')

%% Year 2010
r_d = [0.8510    0.3255    0.0980]; % Code colors

% SPE
data_SPE = load('UNH2010SPE.txt'); %Bring in the 2009 CRaTER Data
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

figure(2)
f1 = plot(mat(:,1),mat(:,3),'o','color',r_d,'MarkerSize',6,'MarkerfaceColor',r_d); %mat(:,3) !!!!!!!!!!!!!
title('2010')

SPE2010 = sum(mat(:,3))/353; %there were 12 days with no information

legend([f1],'SPE')

%% Year 2011
r_d = [0.8510    0.3255    0.0980]; % Code colors

% SPE
data_SPE = load('UNH2011SPE.txt'); %Bring in the 2009 CRaTER Data
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
        %mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(3)
f1 = plot(mat(:,1),mat(:,3),'o','color',r_d,'MarkerSize',6,'MarkerfaceColor',r_d); %mat(:,3) !!!!!!!!!!!!!
title('2011')

SPE2011 = sum(mat(:,3))/362; %there were 3 days with no information

legend([f1],'SPE')

%% Year 2012
r_d = [0.8510    0.3255    0.0980]; % Code colors

% SPE
data_SPE = load('UNH2012SPE.txt'); %Bring in the 2009 CRaTER Data
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
        %mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(4)
f1 = plot(mat(:,1),mat(:,3),'o','color',r_d,'MarkerSize',6,'MarkerfaceColor',r_d); %mat(:,3) !!!!!!!!!!!!!
title('2012')

SPE2012 = sum(mat(:,3))/365; %there were zero days with no information

legend([f1],'SPE')

%% Year 2013
r_d = [0.8510    0.3255    0.0980]; % Code colors

% SPE
data_SPE = load('UNH2013SPE.txt'); %Bring in the 2009 CRaTER Data
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
        %mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(5)
f1 = plot(mat(:,1),mat(:,3),'o','color',r_d,'MarkerSize',6,'MarkerfaceColor',r_d); %mat(:,3) !!!!!!!!!!!!!
title('2013')

SPE2013 = sum(mat(:,3))/365; %there were zero days with no information

legend([f1],'SPE')

%% Year 2014
r_d = [0.8510    0.3255    0.0980]; % Code colors

% SPE
data_SPE = load('UNH2014SPE.txt'); %Bring in the 2009 CRaTER Data
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
        %mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(6)
f1 = plot(mat(:,1),mat(:,3),'o','color',r_d,'MarkerSize',6,'MarkerfaceColor',r_d); %mat(:,3) !!!!!!!!!!!!!
title('2014')

SPE2014 = sum(mat(:,3))/365; %there were zero days with no information

legend([f1],'SPE')

%% Comparison of Solar Max and Solar Min
close all %comment this line out if you want to see the plots

SPE_Daily_SolarMin = (SPE2009 + SPE2010 + SPE2011)/3; %Average value per day in cSv
SPE_Daily_SolarMax = (SPE2012 + SPE2013 + SPE2014)/3; %Average value per day in cSv

SPE_Yearly_SolarMin = SPE_Daily_SolarMin*365; %Cumulative yearly dose in cSv
SPE_Yearly_SolarMax = SPE_Daily_SolarMax*365; %Cumulative yearly dose in cSv

%print(1,'All_rad_2009', '-dpng', '-r900')
%print(2,'All_rad_2010', '-dpng', '-r900')
%print(3,'All_rad_2011', '-dpng', '-r900')
%print(4,'All_rad_2012', '-dpng', '-r900')
%print(5,'All_rad_2013', '-dpng', '-r900')
%print(6,'All_rad_2014', '-dpng', '-r900')
