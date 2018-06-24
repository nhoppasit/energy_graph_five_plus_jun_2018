function energybar(mat_file)
load mat_file
hourly_energy=reshape(EANetKwh,24,60)
hourly_energy=reshape(EANetKwh,60,24)
plot(hourly_energy)
mean(hourly_energy)
std(hourly_energy)
plot(mean(hourly_energy))
plot(hourly_energy)
plot(EANetKwh)
hourly_energy=reshape(EANetKwh-EANetKwh(1),60,24)
max(EANetKwh)
max(EANetKwh-EANetKwh(1))
plot(hourly_energy)
max(hourly_energy)
hourly_energy=max(reshape(EANetKwh-EANetKwh(1),60,24))
plot(hourly_energy)
hourly_energy26 = hourly_energy;
save hourly_energy hourly_energy26
clear
load 27
hourly_energy27=max(reshape(EANetKwh-EANetKwh(1),60,24));
hold on
plot(hourly_energy27)
close
load hourly_energy
save hourly_energy hourly_energy26 hourly_energy27
clear
load hourly_energy
diff(hourly_energy26)
plot(diff(hourly_energy26))
hold on
plot(diff(hourly_energy27))
close
clear
load 28
hourly_energy28=max(reshape(EANetKwh-EANetKwh(1),60,24));
plot(hourly_energy28)
% ----------------------------------------------------
load hourly_energy
% plot(diff(hourly_energy26))
% hold on
% plot(diff(hourly_energy27))
% plot(diff(hourly_energy28))

% bar(diff(hourly_energy26))
dEnergy26 = diff(hourly_energy26);
dEnergy27 = diff(hourly_energy27);
dEnergy28 = diff(hourly_energy28);

save hourly_energy
% bar(dEnergy26,dEnergy27,dEnergy28)
bar(mean([dEnergy26;dEnergy27;dEnergy28]))
dEnergyAvg = mean([dEnergy26;dEnergy27;dEnergy28]);
dEnergyStd = std([dEnergy26;dEnergy27;dEnergy28]);
% help std
save hourly_energy
% plot(dEnergyAvg)
% bar(dEnergy)
bar(dEnergyAvg)
% errorbar(dEnergyStd)
errorbar(dEnergyAvg,dEnergyStd)
bar(dEnergyAvg)
hold
hold on
errorbar(dEnergyAvg,dEnergyStd,'o')
dEnergyAvg2 = mean([dEnergy30;dEnergy31;dEnergy01]);
dEnergyStd2 = std([dEnergy30;dEnergy31;dEnergy01]);
save hourly_energy
bar(dEnergyAvg2)
errorbar(dEnergyAvg2,dEnergyStd2,'or')
bar(dEnergyAvg)
errorbar(dEnergyAvg,dEnergyStd,'ob')
bar(dEnergyAvg)
hold on
errorbar(dEnergyAvg,dEnergyStd,'ob')
errorbar(dEnergyAvg,dEnergyStd./dEnergyAvg*100,'ob')
errorbar(dEnergyAvg,dEnergyStd./dEnergyAvg,'ob')
dEnergyStd
dEnergyStd./dEnergyAvg
dEnergyAvg
clc
save hourly_energy
open dEnergyAvg.fig
bar(dEnergyAvg), hold on, errorbar(dEnergyAvg,dEnergyStd,'o')
bar(dEnergyAvg2), hold on, errorbar(dEnergyAvg2,dEnergyStd2,'o')
bar(dEnergyAvg), hold on, errorbar(dEnergyAvg,dEnergyStd/10,'o')
bar(dEnergyAvg), hold on, errorbar(dEnergyAvg,dEnergyStd/2,'o')
bar(dEnergyAvg), hold on, errorbar(dEnergyAvg,dEnergyStd/5,'o')
bar(dEnergyAvg), hold on, errorbar(dEnergyAvg,dEnergyStd/2,'o')
bar(dEnergyAvg2), hold on, errorbar(dEnergyAvg2,dEnergyStd2/2,'o')
clear
load hourly_energy
dEnergy26 = diff(hourly_energy26);
dEnergy27 = diff(hourly_energy27);
dEnergy28 = diff(hourly_energy28);
dEnergy30 = diff(hourly_energy30);
dEnergy31 = diff(hourly_energy31);
dEnergy01 = diff(hourly_energy01);
save hourly_energy
dEnergyAvg = mean([dEnergy26;dEnergy27;dEnergy28]);
dEnergyStd = std([dEnergy26;dEnergy27;dEnergy28]);
dEnergyAvg2 = mean([dEnergy30;dEnergy31;dEnergy01]);
dEnergyStd2 = std([dEnergy30;dEnergy31;dEnergy01]);
save hourly_energy
bar(dEnergyAvg), hold on, errorbar(dEnergyAvg,dEnergyStd/2,'o')
bar(dEnergyAvg2), hold on, errorbar(dEnergyAvg2,dEnergyStd2/2,'o')