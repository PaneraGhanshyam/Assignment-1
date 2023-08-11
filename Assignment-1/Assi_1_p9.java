import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class Pr9 {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        
        System.out.print("Enter day: ");
        int day = inp.nextInt();

        System.out.print("Enter month: ");
        int month = inp.nextInt();

        System.out.print("Enter year: ");
        int year = inp.nextInt();

        LocalDate date_num = LocalDate.of(year, month, day);
        System.out.println("LocalDate from numbers: " + date_num);
         
        inp.nextLine();
        System.out.print("\nEnter the date in yyyy-MM-dd format: ");
        String str = inp.nextLine();
        try 
        {
            LocalDate date_str = LocalDate.parse(str);
            System.out.println("LocalDate from string: " + date_str);
        } 
        catch (DateTimeParseException e) 
        {
            System.out.println("Enter valid formate (yyyy-MM-dd format).");
        }
    }
}
