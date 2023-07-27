import java.util.Arrays;

public class Pr15 {
    public static void main(String[] args) {
        String input = "python";
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
