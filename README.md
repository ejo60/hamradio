# hamradio
Tools that you can use for hamradio

oscar100link : computes the signal to noise ratio (SNR) in decibel (dB) of an oscar100 ground station setup, this is the uplink calculation. The easiest way to do this is to run the excel file, and modify the yellow fields which specify the station (antenna diameter, cable length, db/m attenuation in the cable, and the dish diameter). The SNR that you get is the expected value by the satellite receiver, so it can't be better than this value on the ground after it is sent back via the 10.5 GHz narrow band transponder. The calculation has some basic assumptions which are specified in then green fields

readsnr : the idea is that you provice a signal history file that is produced by Simon Brown's SDR console with for instance a 1 minute read of the end beacon with an SSB window, and another minute with a 1 minute recording of a nearby noise window using the same SSB windows (nominally 2.7 kHz wide). It draws a graph in MATLAB and estimates the SNR of the beacon signal as you receive it. This provides a performance number for the downlink calculation, that is, how good is your receiving system compared to perhaps other set-ups or users of QO100

baken_<date> : these are example files that you can provide to the readsnr program, they are obtained from the SDRconsole program, so you take a one minute recording of the beacon, and a 1 minute recording next to the beacon, finally you export the file and this is what MATLAB can read.
  
If you don't have MATLAB then try octavia which is public domain, in principle it should also work and we don't use special toolboxes of any sort.
