#include<iostream.h>

void rev(string s, int len)
{
    string temp;
    for (int i = len - 1; i >= 0; i--)
    {
        temp += s[i];
    }
    cout << "reverse is:"<<temp;
}

void main()
{
    string s;
    int len = 0;

    cout << "Enter string: ";
    getline(cin, s);

    for (int i = 0; s[i]; i++)
        len++;

    rev(s, len);
}
