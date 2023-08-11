#include<iostream>
using namespace std;
int main()
{
	int year;
	
	cout<<"enter year:";
	cin>>year;
	
	if(year%4==0)
	{
		if(year%100==0)
		{
			if(year%400==0)
			{
				cout<<"this is leap year.";
			}
			else
			{
				cout<<"this not leap year.";
			}
		}
		else
		{
			cout<<"this is leap year.";
		}
	}
	else
	{
		cout<<"this is not leap year.";
	}
	return (0);
}
