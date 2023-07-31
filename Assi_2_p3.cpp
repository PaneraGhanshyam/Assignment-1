#include <iostream>
using namespace std;

int calculate(int arr[], int arrlen)
{
    for (int i = 0; i < arrlen - 1; i++)
    {
        for (int j = 0; j < arrlen - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
    int ele = 1;

    for (int i = 0; i < arrlen; i++)
    {
        if (arr[i] <= ele)
        {
            ele += arr[i];
        }
        else
        {
            break;
        }
    }
    return ele;
}

int main()
{
    int arrlen, ele;
    cout << "Enter length of array: ";
    cin >> arrlen;
    int arr[arrlen];
    for (int i = 0; i < arrlen; i++)
    {
        cout << "Enter " << (i + 1) << " element: ";
        cin >> arr[i];
    }
    ele = calculate(arr, arrlen);

    cout << "Smallest positive value is: " << ele;

    return 0;
}
