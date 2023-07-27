import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class Pr7 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        System.out.print("Enter your birthdate (yyyy-MM-dd): ");
        String birthdateStr = scanner.next();

        try {
            Date birthdate = sdf.parse(birthdateStr);
            Date today = new Date();

            long timeRemainingInMillis = getTimeRemainingInMillis(birthdate, today);

            if (timeRemainingInMillis < 0) {
                System.out.println("Your birthday for this year has already passed!");
            } else {
                long secondsRemaining = timeRemainingInMillis / 1000;
                long minutesRemaining = secondsRemaining / 60;
                long hoursRemaining = minutesRemaining / 60;
                long daysRemaining = hoursRemaining / 24;
                long monthsRemaining = daysRemaining / 30; 
                long yearsRemaining = monthsRemaining / 12;

                System.out.println("Time remaining until your next birthday:");
                System.out.println("Years: " + yearsRemaining);
                System.out.println("Months: " + (monthsRemaining % 12));
                System.out.println("Days: " + (daysRemaining % 30));
                System.out.println("Hours: " + (hoursRemaining % 24));
                System.out.println("Minutes: " + (minutesRemaining % 60));
                System.out.println("Seconds: " + (secondsRemaining % 60));
            }

        } catch (ParseException e) {
            System.out.println("Invalid date format. Please enter the date in yyyy-MM-dd format.");
        }

        scanner.close();
    }

    public static long getTimeRemainingInMillis(Date birthdate, Date today) {
        Calendar birthCalendar = Calendar.getInstance();
        birthCalendar.setTime(birthdate);

        Calendar todayCalendar = Calendar.getInstance();
        todayCalendar.setTime(today);

        birthCalendar.set(Calendar.YEAR, todayCalendar.get(Calendar.YEAR));

        if (birthCalendar.getTimeInMillis() < todayCalendar.getTimeInMillis()) {
            birthCalendar.add(Calendar.YEAR, 1);
        }

        return birthCalendar.getTimeInMillis() - todayCalendar.getTimeInMillis();
    }
}
