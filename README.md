# hamradio
Tools that you can use for hamradio

oscar100link : computes the signal to noise ratio (SNR) in decibel (dB) of an oscar100 ground station setup, this is the uplink calculation. The easiest way to do this is to run the excel file, and modify the yellow fields which specify the station (antenna diameter, cable length, db/m attenuation in the cable, and the dish diameter). The SNR that you get is the expected value by the satellite receiver, so it can't be better than this value on the ground after it is sent back via the 10.5 GHz narrow band transponder. The calculation has some basic assumptions which are specified in then green fields

readsnr : the idea is that you provice a signal history file that is produced by Simon Brown's SDR console with for instance a 1 minute read of the end beacon with an SSB window, and another minute with a 1 minute recording of a nearby noise window using the same SSB windows (nominally 2.7 kHz wide). It draws a graph in MATLAB and estimates the SNR of the beacon signal as you receive it. This provides a performance number for the downlink calculation, that is, how good is your receiving system compared to perhaps other set-ups or users of QO100

baken_<date> : these are example files that you can provide to the readsnr program, they are obtained from the SDRconsole program, so you take a one minute recording of the beacon, and a 1 minute recording next to the beacon, finally you export the file and this is what MATLAB can read.
  
If you don't have MATLAB then try octavia which is public domain, in principle it should also work and we don't use special toolboxes of any sort.
  
EJO21may2021.icf : this is a file with frequencies for the oscar 100 setup I'm using on a IC 705, use the CS705 program from ICOM to store it in memory. Then go via group to the OSCAR 100 listing and use the multi button to step through the 5 kHz steps, use tune to change your receive frequency and XFC tune to change the transmit frequency. This all assumes that you have a 70 cm receive and a 2 meter transmit configuration. If the frequencies differ because of your downconverter/upconverter configuration then use the CS705 program from ICOM to change it. I do recommend that you protect the receive antenna port (in my case 70cm), either with a coax relay or an isolator, I use the latter option. See my blog for more details.
