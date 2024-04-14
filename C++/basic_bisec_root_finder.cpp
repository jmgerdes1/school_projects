#include <iostream>
#include <cmath>
using namespace std;

double const pi = 2*acos(0);
double const ep = 10e-10;

double f1(double x){
    return(x+cos(x)+exp(x));
}

double f2(double x){
    return(pow(x,2)-sin(x));
}

double bisec(double a, double b, double(f)(double)){
    double c = 0;
    for(int n=1; a-b >= ep; n++){
        //cout << "Loop: " << n << endl;
        c = (a+b)/2;
        if(f(a)*f(c) < 0){
            //cout << "If 1\n";
            b = c;
        }
        if(f(b)*f(c) < 0){
            a = c;
            //cout << "If 2\n";
        }
    }
    return(c);
}

int main(){
  cout << "Root of function 1 on given interval: " << bisec(1,-1,f1) << endl;
  cout << "Root of function 2 on given interval: " << bisec(0,pi,f2) << endl;
}
