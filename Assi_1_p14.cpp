#include <iostream>

using namespace std;

int main() 
{
    int n, i, j, m1, u1;

    cout << "Enter the number of lines in odd numbers: ";
    cin >> n;

    if (n % 2 != 0) 
    {
        m1 = (n - 1) / 2;
        u1 = 3 * n / 2 - 1;

        for (i = 0; i < n; i++) 
        {
            for (j = 0; j < n; j++) 
            {
                if (i + j == m1 || i - j == m1 || j - i == m1 || i + j == u1 || i == m1 || j == m1)
                    cout << " * ";
                else
                    cout << "   ";
            }
            cout << endl;
        }
    } 
    else
    {
        cout<<"Please enter an oddnumber!"
         << endl;
    }

    return 0;
}
