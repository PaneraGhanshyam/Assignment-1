import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class DateConversionExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Enter day (1-31): ");
        int day = scanner.nextInt();

        System.out.print("Enter month (1-12): ");
        int month = scanner.nextInt();

        System.out.print("Enter year: ");
        int year = scanner.nextInt();

        LocalDate localDateFromNumbers = LocalDate.of(year, month, day);
        System.out.println("LocalDate from numbers: " + localDateFromNumbers);
        
        scanner.nextLine(); 
        System.out.print("Enter the date in yyyy-MM-dd format: ");
        String dateString = scanner.nextLine();
        try {
            LocalDate localDateFromString = LocalDate.parse(dateString);
            System.out.println("LocalDate from string: " + localDateFromString);
        } catch (DateTimeParseException e) {
            System.out.println("Error parsing the date string. Please use the correct format (yyyy-MM-dd).");
        }

        scanner.close();
    }
}
