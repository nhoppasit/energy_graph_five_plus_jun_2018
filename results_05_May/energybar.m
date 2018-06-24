function [dEnergy] = energybar(mat_file,datetext)

load(mat_file)
hourly_energy = max(reshape(EATNetKwh-EATNetKwh(1),60,24));
dEnergy = diff(hourly_energy);
bar(dEnergy)
set(gca,'xlim',[0.5,23.5],'fontsize',14)
xlabel('Number of hours')
ylabel('Hourly electrical energy, Kwh')
title(['Hourly Electrical Energy / ' datetext])
set(gca,'ygrid','on','xgrid','off')