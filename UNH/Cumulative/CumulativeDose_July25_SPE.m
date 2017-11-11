%% Year 2009
clc, clear, close all
b_d = [0       0.4471    0.7412];   r_d = [0.8510    0.3255    0.0980];

% GCR
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
f1 = plot(mat(:,1),mat(:,3),'o','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d); %mat(:,3) !!!!!!!!!!!!!
title('2009')

legend([f1],'SPE')
save('SPE_09', 'mat');

%% Year 10
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

figure(1)
f1 = plot(mat(:,1),mat(:,3),'o','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d); %mat(:,3) !!!!!!!!!!!!!
title('2010')

legend([f1],'SPE')
save('SPE_10', 'mat');

%% Year 11
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
        mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(1)
f1 = plot(mat(:,1),mat(:,3),'o','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d); %mat(:,3) !!!!!!!!!!!!!
title('2011')

legend([f1],'SPE')
save('SPE_11', 'mat');

%% Year 12
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
        mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(1)
f1 = plot(mat(:,1),mat(:,3),'o','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d); %mat(:,3) !!!!!!!!!!!!!
title('2012')

legend([f1],'SPE')
save('SPE_12', 'mat');

%% Year 13
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
        mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(1)
f1 = plot(mat(:,1),mat(:,3),'o','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d); %mat(:,3) !!!!!!!!!!!!!
title('2013')

legend([f1],'SPE')
save('SPE_13', 'mat');

%% Year 14
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
        mat(jj,:) = [ii length(ind) 0 0];
    end
        jj = jj +1;
end

figure(1)
f1 = plot(mat(:,1),mat(:,3),'o','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d); %mat(:,3) !!!!!!!!!!!!!
title('2014')

legend([f1],'SPE')
save('SPE_14', 'mat');

%%
clc, clear, close all
% Code colors (Do not worry about this!!!  I will explain you later)
b_d = [0       0.4471    0.7412];   r_d = [0.8510    0.3255    0.0980];
y_d = [0.9294  0.6941    0.1255];   k_d = [0.3137    0.3137    0.3137];

S_09 = load('SPE_09');
S_10 = load('SPE_10');
S_11 = load('SPE_11');
S_12 = load('SPE_12');
S_13 = load('SPE_13');
S_14 = load('SPE_14');

vec = [S_09.mat(:,3); S_10.mat(:,3); S_11.mat(:,3); S_12.mat(:,3); S_13.mat(:,3); S_14.mat(:,3)];

figure
f1 = plot(vec,'o','color',b_d,'MarkerSize',6,'MarkerfaceColor',b_d);  grid on
title('SPE')
