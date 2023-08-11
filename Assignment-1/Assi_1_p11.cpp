#include <iostream>
using namespace std;

int count(string str1,string str2)
{
    int count = 0;
    bool seen[256] = {false};

    for (char c : str1 + str2) 
	{
        if (!seen[static_cast<unsigned char>(c)]) 
		{
            seen[static_cast<unsigned char>(c)] = true;
            count++;
        }
    }

    return count;
}

int main() 
{
    string str1,str2;
    
    cout<<"enter first string:";
    cin>>str1;
    
    cout<<"enter second string:";
    cin>>str2;

    int result=count(str1,str2);

    cout << "Total number of unique characters: " <<result;

    return 0;
}

