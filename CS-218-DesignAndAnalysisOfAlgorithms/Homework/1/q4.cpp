#include<iostream>
#include<String>
#include<vector>

using namespace std;

int main()
{
    int n;
    cin>>n;
    vector<string> a(n);
    vector<string> b(n);
    //vector<string> product(n);
    for (int i = 0; i< n; i++)
    {
        cin>>a[i];
        cin>>b[i];
    }
    int lena, lenb;
    for (int i = 0; i<n; i++)
    {
        lena = a[i].length();
        lenb = b[i].length();
        vector<int> p(lena+lenb);// vector to store the product
    }
    cout<<"Hello World";
    return 0;
}
