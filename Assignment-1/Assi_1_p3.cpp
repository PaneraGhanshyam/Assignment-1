#include<iostream.h>
void main()
{
    int num=0,count=0,temp=0,rem=0,res,number=0;
    cout<<"enter number:";
    cin>>num;
    
    temp=num;
    while(temp!=0)
    {
        temp /= 10;
        count++;
    }
    
    temp=num;
    while(num!=0)
    {
        rem=num%10;
        res=1;
        for(int i=0;i<count;i++)
            res = res * rem;
        number +=res;
        num /= 10;
    }
    if(number==temp)
    {
         cout<<"number is armstrong number.";
    }
    else
    {
        cout<<"number is not armstrong number.";
    }
    
}