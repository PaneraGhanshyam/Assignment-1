#include <iostream>
using namespace std;

int main() 
{
    string str;
    cout<<"Enter the string: ";
    cin>>str;

     for(char& c:str) 
	 {
        if((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
		{
            if (c == 'z') 
			{
                c = 'a';
            } else if (c == 'Z') 
			{
                c = 'A';
            } else 
			{
                c++;
            }
        }
    }
    
    cout<<"result:"<<str;

    return 0;
}

