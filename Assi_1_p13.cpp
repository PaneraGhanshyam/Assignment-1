#include <iostream>

using namespace std;

int main() {
    string s;
    int w_count = 1, len = 0, res = 0;

    cout << "Enter string: ";
    getline(cin, s);

    for (char c : s) {
        len++;
        if (c == ' ')
            w_count++;
        else
            continue;
    }

    string str[w_count];

    int j = 0;
    for (int i = 0; i < len; i++) {
        if (s[i] != ' ')
            str[j] = str[j] + s[i];
        else
            j++;
    }

    int k,count=0;
    for (int i = 0; i < w_count; i++) {
        string temp = str[i];
        for(k=0;temp[k]!=NULL;k++);
        if(count<k)
        {
            count=k;
            res=i;
        }
            
    }

   cout << "largest word: " << str[res] << endl;

    return 0;
}
