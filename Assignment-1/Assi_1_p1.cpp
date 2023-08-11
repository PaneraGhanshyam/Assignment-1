#include<iostream.h>
void main()
{
	    int num=0;
	    cout<<"enter number:";
	    cin>>num;
	    if (num % 2 != 0)
        {
            cout<<"weired.";
        } 
        else
        {
            if (num >= 2 && num <= 5) 
            {
                cout<<"Not Weird.";
            } 
            else if (num >= 6 && num <= 20) 
            {
                cout<<"Weird.";
            } 
            else if(num % 2 ==0 && num > 20)
             {
                cout<<"Not Weird.";
             }
        }
}