#include <iostream>

using namespace std;

bool angram(string str1,string str2)
{
    if (str1.length() != str2.length()) 
	{
        return false;
    }
    
    int count[26] = {0};

    for (char c : str1)
    {
        count[c - 'a']++;
    }

    for (char c : str2) 
	{
        count[c - 'a']--;
    }

    for (int i = 0; i < 26; i++) 
	{
        if (count[i] != 0) 
		{
            return false;
        }
    }

    return true;
}

int main() {
    string str1,str2;
	
    cout<<"Enter string 1: ";
    cin>>str1;
    
    cout<<"Enter string 2: ";
    cin>>str2;

    if(angram(str1,str2)) 
	{
        cout<<"The strings are anagrams.";
    } 
	else
    {
        cout<<"The strings are not anagrams.";
    }

    return 0;
}

