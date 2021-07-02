% SNR calculation oscar 100 satellite
clear;
dt = 120e-3;                             % time of flight to satellite in seconds
c = 3e8;                                 % speed of light
d = c*dt;                                % distance in meter
f = 2.4e9;                               % frequency uplink
dia = 0.9;                               % assumed diameter of antenna
k = 1.38064852e-23;                      % boltzmann constant
B = 2700;                                % bandwidth
Ptx = 20;                                 % measured
P = 10*log10(Ptx);                       % dB transmitter
Lcable = 12;                             % cable length
dBcable = 0.3;                           % 0.3 db/m loss ecoflex 7mm 
GTs = -13;                               % assumed performance at satellite
lambda = c/f;                            % wavelength
fsl = 10*log10((4*pi*d/lambda)^2);       % FSL
cable = Lcable*dBcable;                  % cable loss
dish = 10*log10(((pi*dia)/lambda)^2);    % gain antenna 
efficiency = 10*log10(0.5);              % efficiency my antenna
SNR = P - cable + dish - fsl + efficiency - 10*log10(k*B) + GTs; % calculated SNR
fprintf('Signal to noise ratio calculation:\n\n');
fprintf('  dt         = %8.1f sec (single way time of flight)\n',dt);
fprintf('  f          = %8.1f GHz (frequency for uplink)\n',f/1e9);
fprintf('  fsl        = %8.1f dB  (free space loss in dB)\n',fsl);
fprintf('  TX         = %8.1f dB  (measured with HP power meter)\n',P);
fprintf('  cable      = %8.1f dB  (assuming 12m ecoflex 7 mm)\n',cable);
fprintf('  antenna    = %8.1f dB  (assuming and 90cm diameter at 2.4 GHz)\n',dish);
fprintf('  efficiency = %8.1f dB  (antenne efficiency is 50%%)\n',efficiency);
fprintf('  k*B        = %8.1f dB  (bandwidth 2700 Hz and Boltzmann)\n',-10*log10(k*B)); 
fprintf('  GTs        = %8.1f dB  (satellite system temperature)\n',GTs);
fprintf('  SNR        = %8.1f dB  (SNR received at satellite)\n\n',SNR);
fprintf('PA1EJO Ernst\n');