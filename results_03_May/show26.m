function show26
%% Design By Nhoppasit Srisurat

%% สร้างแกนเวลาเป็นชั่วโมง
load('26.mat')
hhminsec(end) = hhminsec(end-1)+0.0007;
t = hhminsec*24;
current = I2A;
energy = EANetKwh;
TimeIn = TimeIN;
TempIn = TempIN;
RHIn = RHIN;
TimeOut = TimeOut;
TempOut = TempOut;
RHOut = RHOut;
%% แสดงกราฟเวลา-กระแส และเวลา-KWh
figure;
subplot(311)
hold on
[ax,h1,h2] = plotyy(t,current,t,energy-energy(1));
grid on
set(ax(1),'xlim',[0,24])
set(ax(2),'xlim',[0,24])
set(ax(1),'ylim',[0,20])
set(ax(2),'ylim',[0,50])
set(ax(1), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
set(ax(2), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
xlabel(ax(1),'Time, h')
ylabel(ax(1),'Current, Amp')
ylabel(ax(2),'Energy, KWh')
set(h2,'linewidth',2)

%% แสดงการเปิด
pCurrent = current>0;
[pk,loc] = findpeaks(double(pCurrent));
plot(t(loc),current(loc),'ko');


%% Pulse width calculation
current(current>7) = 10;
[w,initcross,finalcross] = pulsewidth(current,t);
pkcnt = length(w);
title(['Current vs Time & Energy vs Time (ON-OFF = ' num2str(pkcnt) ' times) / 26-May-2018'])

%% Pulse width vs time
subplot(312)
bar((initcross+finalcross)/2,w*60);
axis([0,24,0,10])
grid on
title('Current Transmission Width vs Time / 26-May-2018')
xlabel('Time, h')
ylabel('Current ON Time, min')

%% Temperature & Humidity Inside
subplot(313)
[ax,h1,h2] = plotyy(TimeIn*24,TempIn,TimeIn*24,RHIn);
grid on
xlabel(ax(1),'Time, h')
xlabel(ax(2),'Time, h')
ylabel(ax(1),'Temperature, C')
ylabel(ax(2),'Humidity, %RH')
set(ax(1),'ycolor','r')
set(h1,'color','red','linewidth',2)
set(h2,'color','b','linewidth',2)

%% Temperature & Humidity Outside
hold(ax(1),'on')
plot(ax(1),TimeOut*24,TempOut,'r-.','linewidth',1)
hold(ax(2),'on')
plot(ax(2),TimeOut*24,RHOut,'g-.','linewidth',1)

title('Temperature and Humidity vs Time (Inside - solid line, Outside - dash line) / 26-May-2018')

set(ax(1),'xlim',[0,24])
set(ax(2),'xlim',[0,24])

set(ax(1),'ylim',[22,40])
set(ax(1), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
set(ax(2),'ylim',[40,100])
set(ax(2), 'YTickMode', 'auto', 'YTickLabelMode', 'auto')
