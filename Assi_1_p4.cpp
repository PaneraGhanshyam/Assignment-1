#include<iostream.h>
void main()
{
    int num=0,count;
    cout<<"enter number:";
    cin>>num;
    for (int i = 1; i <= num; i++) 
    {
        count = 0;
        for (int j = 2; j <= i / 2; j++) 
        {
            if (i % j == 0)
            {
                count++;
                break;
            }
        }

      if (count == 0) 
          cout<<i<<" ";
  }
}