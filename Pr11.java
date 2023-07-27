import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class Pr11{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the first string: ");
        String str1 = scanner.nextLine();

        System.out.print("Enter the second string: ");
        String str2 = scanner.nextLine();

        int uniqueCharacterCount = countUniqueCharacters(str1, str2);
        System.out.println("Total number of unique characters of the said two strings: " + uniqueCharacterCount);

        scanner.close();
    }

    public static int countUniqueCharacters(String str1, String str2) {
        String combinedString = str1 + str2;
        Set<Character> uniqueCharacters = new HashSet<>();
        for (char ch : combinedString.toCharArray()) {
            uniqueCharacters.add(ch);
        }

        return uniqueCharacters.size();
    }
}
rs.size();
    }
}
