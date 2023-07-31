#include <iostream>
using namespace std;

void common(int a1[], int a2[], int a3[], int n1, int n2, int n3) 
{
   int i = 0, j = 0, k = 0;
   while (i < n1 && j < n2 && k < n3) 
   {
      if (a1[i] == a2[j] && a2[j] == a3[k]) 
      {
         cout << a1[i] << " ";
         i++;
         j++;
         k++;
      } 
      else if (a1[i] < a2[j])
         i++;
      else if (a2[j] < a3[k])
         j++;
      else
         k++;
   }
}

int main() 
{
   int n1, n2, n3;
   cout << "Enter the size of the first array: ";
   cin >> n1;
   int a1[n1];
   cout << "Enter the elements of the first array: ";
   for (int i = 0; i < n1; i++) 
   {
      cin >> a1[i];
   }

   cout << "Enter the size of the second array: ";
   cin >> n2;
   int a2[n2];
   cout << "Enter the elements of the second array: ";
   for (int i = 0; i < n2; i++) 
   {
      cin >> a2[i];
   }

   cout << "Enter the size of the third array: ";
   cin >> n3;
   int a3[n3];
   cout << "Enter the elements of the third array: ";
   for (int i = 0; i < n3; i++) 
   {
      cin >> a3[i];
   }

   cout << "Common elements are: ";
   common(a1, a2, a3, n1, n2, n3);

   return 0;
}
