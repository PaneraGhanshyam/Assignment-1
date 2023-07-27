import java.util.Arrays;
import java.util.Scanner;

public class Pr15 {
    public static void main(String[] args) {
        Scanner inp=new Scanner(System.in);        System.out.println("enter string:");
        String input = inp.nextLine();
        String sortedString = sortCharacters(input);
        System.out.println("Sample input: " + input);
        System.out.println("Sample output: " + sortedString);
    }

    public static String sortCharacters(String input) {
        String cleanedString = input.replaceAll("[^a-zA-Z]", "");

        char[] chars = cleanedString.toCharArray();

        Arrays.sort(chars); 

        String sortedString = new String(chars);

        return sortedString;
    }
}
