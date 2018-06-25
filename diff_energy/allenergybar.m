function allenergybar()

%% Before
load('en_0503')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0503 = diff(hourly_energy);
load('en_0504')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0504 = diff(hourly_energy);
load('en_0505')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0505 = diff(hourly_energy);
load('en_0506')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0506 = diff(hourly_energy);

datapack1 = [dEnergy0503;dEnergy0504;dEnergy0505;dEnergy0506];

dEnergyAvg1 = mean(datapack1);
dEnergyStd1 = std(datapack1);


%% After-1
load('en_0526')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0526 = diff(hourly_energy);
load('en_0527')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0527 = diff(hourly_energy);
load('en_0528')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0528 = diff(hourly_energy);
load('en_0529')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0529 = diff(hourly_energy);

datapack2 = [dEnergy0526;dEnergy0527;dEnergy0528;dEnergy0529];

dEnergyAvg2 = mean(datapack2);
dEnergyStd2 = std(datapack2);


%% After-2
load('en_0612')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0612 = diff(hourly_energy);
load('en_0613')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy0613 = diff(hourly_energy);
load('en_061114')
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy061114 = diff(hourly_energy);

datapack3 = [dEnergy0612;dEnergy0613;dEnergy061114];

dEnergyAvg3 = mean(datapack3);
dEnergyStd3 = std(datapack3);


%% Plot-1
bar(dEnergyAvg1,'r'), hold on, errorbar(dEnergyAvg1,dEnergyStd1/2,'ok')
bar(dEnergyAvg2,'g'), errorbar(dEnergyAvg2,dEnergyStd2/2,'ok')

set(gca,'xlim',[0.5,23.5],'fontsize',14)
xlabel('Number of hours')
ylabel('Averaged Hourly electrical energy, Kwh')
title('Averaged Hourly Electrical Energy, 3-6 May/18 (Before/Red) vs 26-29 May/18 (After-1/Green)')
set(gca,'ygrid','on','xgrid','off')

%% Plot-1
figure
bar(dEnergyAvg1,'r'), hold on, errorbar(dEnergyAvg1,dEnergyStd1/2,'ok')
bar(dEnergyAvg3,'g'), errorbar(dEnergyAvg3,dEnergyStd3/2,'ok')

set(gca,'xlim',[0.5,23.5],'fontsize',14)
xlabel('Number of hours')
ylabel('Averaged Hourly electrical energy, Kwh')
title('Averaged Hourly Electrical Energy, 3-6 May/18 (Before/Red) vs 11-14 Jun/18 (After-1/Green)')
set(gca,'ygrid','on','xgrid','off')

