# 0 "fir.c"
# 1 "/media/sf_share/lab-exmem_fir/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1





int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[11];
int inputsignal[11] = {1,2,3,4,5,6,7,8,9,10,11};
int outputsignal[11];
# 2 "fir.c" 2

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {


 for (int i = 0; i < 11; i++) {
        inputbuffer[i] = 0;
        outputsignal[i] = 0;
    }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
 initfir();



    for (int i = 0; i < 11; i++) {
        inputbuffer[i] = inputsignal[i];

        for (int j = 0; j < 11; j++) {
            if ((i - j) >= 0) {

                outputsignal[i] += taps[j] * inputbuffer[i - j];
            }
        }
    }



 return outputsignal;
}
