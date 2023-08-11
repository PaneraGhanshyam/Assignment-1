#include <iostream>
#include <ctime>

using namespace std;

int main() {
    int by,bm,bd;

    cout<<"Enter your birth year: ";
    cin>>by;

    cout<<"Enter your birth month: ";
    cin>>bm;

    cout<<"Enter your birth day: ";
    cin>>bd;

    tm rem_t;
    
     time_t now = time(0);
    tm* localTime = localtime(&now);

    rem_t.tm_sec = 0;
    rem_t.tm_min = 0;
    rem_t.tm_hour = 0;
    rem_t.tm_mday = bd;
    rem_t.tm_mon = bm - 1;
    rem_t.tm_year = localTime->tm_year;
    rem_t.tm_wday = 0;
    rem_t.tm_yday = 0;
    rem_t.tm_isdst = 0;

    if (rem_t.tm_mon < localTime->tm_mon || (rem_t.tm_mon == localTime->tm_mon && rem_t.tm_mday < localTime->tm_mday)) {
        rem_t.tm_year += 1;
    }

    time_t birthTime = mktime(&rem_t);
    time_t currentTime = time(0);
    double sec_rem = difftime(birthTime, currentTime);

    int years, months, days, hours, minutes, seconds;
    years = sec_rem / (365.25 * 24 * 60 * 60);
    sec_rem -= years * 365.25 * 24 * 60 * 60;
    months = sec_rem / (30.44 * 24 * 60 * 60);
    sec_rem -= months * 30.44 * 24 * 60 * 60;
    days = sec_rem / (24 * 60 * 60);
    sec_rem -= days * 24 * 60 * 60;
    hours = sec_rem / (60 * 60);
    sec_rem -= hours * 60 * 60;
    minutes = sec_rem / 60;
    seconds = sec_rem - minutes * 60;

    cout<<"Remaining time \n";
    cout<<"Years: "<<years<<endl;
    cout<<"Months: "<<months<<endl;
    cout<<"Days: "<<days<<endl;
    cout<<"Hours: "<<hours<<endl;
    cout<<"Minutes: "<<minutes<<endl;
    cout<<"Seconds: "<<seconds<<endl;
 
    return 0;
}

