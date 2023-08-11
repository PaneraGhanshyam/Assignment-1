#include<iostream.h>

void main()
{
    string s;
    char c;
    int len=0,count=0;
    
    cout<<"enter string:";
    getline(cin,s);
    cout<<"enter character:";
    cin>>c;
    
    for(int i=0;s[i];i++)
        len++;
        
    for(int i=0;i<len;i++)
    {
        if(s[i]==c)
            count++;
    }
    
    cout<<"character occcure "<<count<<" times in string.";
}