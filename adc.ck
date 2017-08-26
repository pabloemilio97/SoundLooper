//signal path and setup 
adc => LiSa loopme => /* Echo dly => Chorus chor =>*/Gain volume => dac; 

1.0=>volume.gain;
//alloc memory
10::second => loopme.duration;
10::ms => loopme.recRamp;

//need to specify where the recording willend if
//we want the recRamping to work when turning
//off recording
1::second => loopme.loopEndRec;

//start recording input
1 => loopme.record;

//stop recording 1 second later, start playing what was just recorded
600::ms => now;
400::ms => loopme.recRamp;

400::ms => now;
0 => loopme.record;

//now we need to tell it where to end the looping for playback
//since the buffer size is longer than our actual desired
//loop length
1::second => loopme.loopEnd;

//now go ahead and play....
1 => loopme.loop;
1 => loopme.rate;
/*.1::second=>dly.delay;
10::second => dly.max;
100 => chor.modFreq;*/
1 => loopme.play;

while(true) {500::ms => now;}
