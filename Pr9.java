import java.time.LocalDate;
import java.time.format
DateTimeParseException;
import java.util.Scanner;

public class Pr9 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter day: ");
        int day = scanner.nextInt();

        System.out.print("Enter month: ");
        int month = scanner.nextInt();

        System.out.print("Enter year: ");
        int year = scanner.nextInt();

        LocalDate localDate1 = LocalDate.of(year, month, day);
        System.out.println("LocalDate from numbers: " + localDate1);

        scanner.nextLine();

        System.out.print("Enter date in yyyy-MM-dd format: ");
        String dateString = scanner.nextLine();

        try {
            LocalDate localDate2 = LocalDate.parse(dateString);
            System.out.println("LocalDate from string: " + localDate2);
        } catch (DateTimeParseException e) {
            System.out.println("Invalid date format. Please use yyyy-MM-dd format.");
        }

        scanner.close();
    }
}
