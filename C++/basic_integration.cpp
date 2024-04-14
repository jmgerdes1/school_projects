#include <iostream>
#include <cmath>
#include <vector>
using namespace std;

double const pi = 2*acos(0);

double f_x(double x){
    return(1-sin(x*pi/180)*exp(-2*pow(x,2)));
}

double simp(double a, double b, double n, double(*f)(double)){
    double simp = f(a) + f(b);
    double h = (b-a)/n;
    double sum4 = 0;
    double sum2 = 0;
    double x;
    for(int i=1; i<n-1; i+=2){
        x = a + i*h;
        sum4 += f(x);
    }
    for(int i = 2; i<n-2; i+=2){
        x = a + i*h;
        sum2 += f(x);
    }
    simp = (h/3)*(simp + 4*sum4 + 2*sum2);
    return(simp);
}

double trap(double a, double b, double n, double(*f)(double)){
    double sum = 0.5*(f(a)+f(b));
    double h = (b-a)/n;
    double x;
    for(int i=1; i<n-1; i++){
        x = a + i*h;
        sum += f(x);
    }
    return(h*sum);
}

int main(){
    double a = -1;
    double b = 1;
    double n = 100;
    cout << "Simpson: " << simp(a,b,n,f_x) << endl;
    cout << "Trapezoid: " <<trap(a,b,n,f_x) << endl;
}
