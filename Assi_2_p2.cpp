#include <iostream>

using namespace std;

int first_rep_ele(int arr[], int arrlen) 
{
    int element = 0;

    for (int i = 0; i < arrlen; i++) 
    {
        for (int j = i + 1; j < arrlen; j++) 
        {
            if (arr[i] == arr[j]) 
            {
                element = arr[i];
                return element;
            }
        }
    }
    return element;
}

int main() 
{
    int arrlen, ele;
    cout << "enter length of array:";
    cin >> arrlen;
    int arr[arrlen];

    for (int i = 0; i < arrlen; i++) 
    {
        cout << "enter " << (i + 1) << " element:";
        cin >> arr[i];
    }
    ele = first_rep_ele(arr, arrlen);
    std::cout << ele << " is the first element that repeats.";

    return 0;
}
