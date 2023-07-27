import java.util.Scanner;

public class Pr5{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter a string: ");
        String inputString = scanner.nextLine();

        System.out.print("Enter the character to count: ");
        char characterToCount = scanner.next().charAt(0);

        int occurrenceCount = countCharacterOccurrences(inputString, characterToCount);
        System.out.println("The occurrence of the character '" + characterToCount + "' in the string is: " + occurrenceCount);

        scanner.close();
    }

    public static int countCharacterOccurrences(String inputString, char characterToCount) {
        int count = 0;
        for (int i = 0; i < inputString.length(); i++) {
            if (inputString.charAt(i) == characterToCount) {
                count++;
            }
        }
        return count;
    }
}
