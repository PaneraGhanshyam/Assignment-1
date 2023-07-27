//ex:1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
import java.util.Scanner;

public class P3 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int number = scanner.nextInt();
        scanner.close();

        if (isArmstrongNumber(number)) {
            System.out.println(number + " is an Armstrong number.");
        } else {
            System.out.println(number + " is not an Armstrong number.");
        }
    }

    private static boolean isArmstrongNumber(int number) {
        int numDigits = countDigits(number);
        int sum = 0;
        int tempNumber = number;

        while (tempNumber > 0) {
            int digit = tempNumber % 10;
            sum += Math.pow(digit, numDigits);
            tempNumber /= 10;
        }

        return sum == number;
    }

    private static int countDigits(int number) {
        int count = 0;
        while (number > 0) {
            number /= 10;
            count++;
        }
        return count;
    }
}
