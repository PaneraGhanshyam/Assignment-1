#include<iostream.h>
void main()
{
    string s;
    int len=0,j=0,k=0,flag=0;
    cout<<"enter string:";
    getline(cin,s);
    
    for(int i=0;s[i];i++)
        len++;
        
    len--;
    for(int i=0;i<=len;i++)
    {
        if(s[i]!=s[len-i])
        {
            flag=1;
            break;
        }
    }
    if(flag==1)
    {
        cout<<"string is not palindrom.";
    }
    else
    {
        cout<<"string is palindrom.";
    }
}