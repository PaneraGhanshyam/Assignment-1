import java.util.HashSet;
import java.util.Set;
import java.util.Scanner;

public class Pr11{
    public static void main(String[] args) {
        Scanner inp=new Scanner(System.in);
        System.out.println("enter first string:");
        String string1 =inp.nextLine();
           System.out.println("enter second string:");
        String string2 =inp.nextLine();

        String concatenatedString = string1 + string2;

        
        int uniqueCharacterCount = countUniqueCharacters(concatenatedString);

        System.out.println("Total number of unique characters of the said two strings: " + uniqueCharacterCount);
    }

    private static int countUniqueCharacters(String input) {
        Set<Character> uniqueCharacters = new HashSet<>();

        for (char ch : input.toCharArray()) {
            if (Character.isLetter(ch)) {
                uniqueCharacters.add(ch);
            }
        }

        return uniqueCharacters.size();
    }
}
