import java.util.Scanner;

public class Pr6{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter a string: ");
        String inputString = scanner.nextLine();

        String reversedString = reverseString(inputString);
        System.out.println("Reversed string: " + reversedString);

        scanner.close();
    }

    public static String reverseString(String inputString) {
        char[] characters = inputString.toCharArray();
        int length = characters.length;
        for (int i = 0; i < length / 2; i++) {
            char temp = characters[i];
            characters[i] = characters[length - 1 - i];
            characters[length - 1 - i] = temp;
        }

        return new String(characters);
    }
}
