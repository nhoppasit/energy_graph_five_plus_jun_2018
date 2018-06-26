function show_graph(en_file,datetext,powermid,powerpk,enpk,onpk,fs)
%% Design By Nhoppasit Srisurat

%% สร้างแกนเวลาเป็นชั่วโมง
load(en_file)
% hhminsec(end) = hhminsec(end-1)+0.0007;
t = hhminsec*24;
power = PTKw;
energy = EATNetKwh;
TimeIn = TimeIN;
TempIn = TempIN;
RHIn = RHIN;
TimeOut = TimeOUT;
TempOut = TempOUT;
RHOut = RHOUT;
%% แสดงกราฟเวลา-กระแส และเวลา-KWh
figure;
subplot(311)
hold on
[ax,h1,h2] = plotyy(t,power,t,energy-energy(1));
grid on
set(ax(1),'xlim',[0,24],'fontsize',fs)
set(ax(2),'xlim',[0,24],'fontsize',fs)
set(ax(1),'ylim',[0,powerpk])
set(ax(2),'ylim',[0,enpk])
set(ax(1), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
set(ax(2), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
xlabel(ax(1),'Time, h')
ylabel(ax(1),'Power, Kw')
ylabel(ax(2),'Energy, KWh')
set(h1,'linewidth',1)
set(h2,'linewidth',2)

%% แสดงการเปิด
pPower = powermid<=power;
[pk,loc] = findpeaks(double(pPower));
plot(t(loc),power(loc),'ko');


%% Pulse width calculation
power(powermid<=power) = 10;
[w,initcross,finalcross] = pulsewidth(power,t);
pkcnt = length(w);
title(['Power vs Time & Energy vs Time (ON-OFF = ' num2str(pkcnt) ' times) / ' datetext])

%% Pulse width vs time
subplot(312)
bar((initcross+finalcross)/2,w*60);
set(gca,'fontsize',fs);
axis([0,24,0,onpk])
grid on
title(['Power Transmission Period vs Time / ' datetext])
xlabel('Time, h')
ylabel('Power ON Time, min')
text(1,onpk/2+3,['Comp. ON: ' num2str(round(sum(w*60))+1) ' min'],'fontsize',14,'background','white')
text(1,onpk/2,['Comp. OFF: ' num2str(round((t(end)-t(1))*60 - sum(w*60))) ' min'],'fontsize',14,'background','white')

%% Temperature & Humidity Inside
subplot(313)
[ax,h1,h2] = plotyy(TimeIn*24,TempIn,TimeIn*24,RHIn);
set(ax(1),'fontsize',fs)
set(ax(2),'fontsize',fs)
grid on
xlabel(ax(1),'Time, h')
xlabel(ax(2),'Time, h')
ylabel(ax(1),'Temperature, C')
ylabel(ax(2),'Humidity, %RH')
set(ax(1),'ycolor','r')
set(ax(2),'ycolor','b')
set(h1,'color','red','linewidth',2)
set(h2,'color','b','linewidth',2)

%% Temperature & Humidity Outside
hold(ax(1),'on')
plot(ax(1),TimeOut*24,TempOut,'r-.','linewidth',2)
hold(ax(2),'on')
plot(ax(2),TimeOut*24,RHOut,'b-.','linewidth',2)

title(['Temperature (Red) and Humidity (Blue) vs Time (Inside - solid line, Outside - dash line) / ' datetext])

set(ax(1),'xlim',[0,24])
set(ax(2),'xlim',[0,24])

set(ax(1),'ylim',[22,40])
set(ax(1), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
set(ax(2),'ylim',[40,100])
set(ax(2), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
