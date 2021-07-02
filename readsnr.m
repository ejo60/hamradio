% reading the SNR file from SDR console
%
clear; 
fname = 'C:\Users\admin\Desktop\qo100picas\performance\baken_02072021';
%fname = 'C:\Users\admin\Desktop\qo100picas\performance\baken_01072021';
%fname = 'C:\Users\admin\Desktop\qo100picas\performance\baken_30062021';
%fname = 'C:\Users\admin\Desktop\qo100picas\performance\baken_29062021';
%fname = 'C:\Users\admin\Desktop\qo100picas\performance\baken_27062021';
fp = fopen(fname);
C = textscan(fp,'%s %s %s %s %s %s','CommentStyle','#','Delimiter',{',','"'},'HeaderLines',15,'MultipleDelimsAsOne',1);
fclose(fp);
date = string(C{1});
signal = str2double(C{2});
noise = str2double(C{3});
freq = str2double(C{4});
bandwidth = str2double(C{5});
nsignal = size(signal,1);
maximum = max(signal);
minimum = min(signal);
trigger = (minimum+maximum)/2;
jdx = find(signal < trigger); 
noisefloor = median(signal(jdx));
add = -noisefloor;
figure(1); plot(signal(1:nsignal)+add,'.'); grid;
SNR = max(signal(1:nsignal)+add);
title(sprintf('Estimated SNR = %.2f dB\n',SNR))