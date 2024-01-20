class Circle{
    float freq, amp, phase, re, im;

    Circle(float amp_val, float freq_val, float phase_val, float real, float imag){
        amp = amp_val;
        freq = freq_val;
        phase = phase_val;
        re = real;
        im = imag;
    }
    Circle(float amp_val, float freq_val, float phase_val){
        amp = amp_val;
        freq = freq_val;
        phase = phase_val;
    }

    float getRe(){
        return re;
    }
    float getIm(){
        return im;
    }

    float getAmp(){
        return amp;
    }

    float getFreq(){
        return freq;
    }

    float getPhase(){
        return phase;
    }

    void printParam(){
        println("amp: ",amp," frequency: ",freq," phase: ",phase, " Real: ", re, " Imag: ",im);
    }
}