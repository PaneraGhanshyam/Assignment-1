#include<iostream>

using namespace std;

int main() 
{
  
  string str;
  int n=0;
  
  cout<<"Enter string:";
  getline(cin,str);
  
  for(int i=0;i<str[i]!=NULL;i++)
      n++;
  
  for (int i = 0; i < n - 1; i++) 
  {
    for (int j = 0; j < n - i - 1; j++) 
    {

      if (str[j] > str[j + 1]) 
      {
        char temp = str[j];
        str[j] = str[j + 1];
        str[j + 1] = temp;
      }
    }
  }
  
   cout << "sorted string: " << str;
  
  return 0;
}
