#include <iostream>
#include <vector>
using namespace std;

typedef vector<double> Vec;
typedef vector<Vec> Mat;

Mat operator*(const Mat &M1, const Mat &M2){
    int n,m,o;
    m = M1.size();
    n = M1[0].size();
    o = M2.size();
    Mat prod;
    for(int k = 0; k<o; k++){
        Vec vtemp;
        for(int i = 0; i<n; i++){
            double dtemp = 0;
            for(int j = 0; j<m; j++){
                dtemp += M1[j][i]*M2[k][j];
            }
            vtemp.push_back(dtemp);
        }
        prod.push_back(vtemp);
    }
    return prod;
}

Mat fillM(){
    int n,m;
    Vec V1;
    Mat M1;
    double var;
    cout << "Number of rows: ";
    cin >> n;
    cout << "Number of columns: ";
    cin >> m;
    for(int i = 0; i<m; i++){
        cout << "Input column " << i+1 << " (hit enter after each element):\n" ;
        for(int j = 0; j<n; j++){
            cin >> var;
            V1.push_back(var);
        }
        M1.push_back(V1);
        V1.clear();
    }
    return(M1);
}

void printM(Mat M1){
    int m, n;
    m = M1.size();
    n = M1[0].size();
    for(int i = 0; i<n; i++){
        cout << "| ";
        for(int j = 0; j<m; j++){
            cout << M1[j][i] << " ";
        }
        cout << "|" << endl;
    }
}

int main(){
    Mat M1;
    Mat M2;
    cout << "Matrix 1:" << endl;
    M1 = fillM();
    cout << "Input matrix: " << endl;
    printM(M1);
    cout << "Matrix 2:" << endl;
    M2 = fillM();
    cout << "Input vector: " << endl;
    printM(M2);
    cout << "Product of Matrix and Vector: " << endl;
    printM(M1*M2);
}
