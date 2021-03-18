declare interface "SmartKeyboard{
    'Number of Keyboards':'1',
    'Keyboard 0 - Number of Keys':'1',
    'Keyboard 0 - Lowest Key':'72',
	''
}";

import("stdfaust.lib");
freq = hslider("freq",440,50,1000,0.01);
gain = an.amp_follower_ar(0.02,0.02);
gate = button("gate") : en.adsr(0.01,0.01,0.9,0.1);
timbre(f) = os.sawtooth(f)*0.5 + os.sawtooth(f*2)*0.25 + os.sawtooth(f*3)*0.125;
process = gain*gate*timbre(freq)*0.5 <: _,_;
effect = dm.zita_light;
