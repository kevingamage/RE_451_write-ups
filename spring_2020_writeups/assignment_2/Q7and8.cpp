//P7
short Z1fPi(int array[]){
    short number = 0;

    for(int i = 0; array[i] != 0; i++]){
        number += array[i];
    }

    return number;
}

int main() {
    int array[] = {123434, 9000,2243244,34250234,234234,0};
    return (int)Z1fPi(array);
}

//P8
#include <stdlib.h>

#define NINETHOUSAND 9000

void Z1fPi(int &a, int &b){
    int x = NINETHOUSAND;
    a = b * NINETHOUSAND;
    b = 9000 - a;
}

int main(int argc, char* argv[]) {
    int a = atoi(argv[1]);
    int b = atoi(argv[2]);

    Z1fPi(a, b);

    return a + b;
}

