import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Pr10 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the first string: ");
        String str1 = scanner.nextLine();

        System.out.print("Enter the second string: ");
        String str2 = scanner.nextLine();

        if (areAnagrams(str1, str2)) {
            System.out.println("The strings are anagrams of each other.");
        } else {
            System.out.println("The strings are not anagrams of each other.");
        }

        scanner.close();
    }

    public static boolean areAnagrams(String str1, String str2) {
        str1 = str1.replaceAll("\\s", "").toLowerCase();
        str2 = str2.replaceAll("\\s", "").toLowerCase();

        if (str1.length() != str2.length()) {
            return false;
        }
        Map<Character, Integer> charFrequency = new HashMap<>();
        for (char ch : str1.toCharArray()) {
            charFrequency.put(ch, charFrequency.getOrDefault(ch, 0) + 1);
        }
        for (char ch : str2.toCharArray()) {
            if (!charFrequency.containsKey(ch) || charFrequency.get(ch) == 0) {
                return false;
            }
            charFrequency.put(ch, charFrequency.get(ch) - 1);
        }

        return true;
    }
}
