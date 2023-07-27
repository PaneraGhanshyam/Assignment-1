import java.util.Scanner;
public class Pr13 {
    public static void main(String[] args) {
        Scanner inp=new Scanner(System.in);
        System.out.println("enter string:");
        String input = inp.nextLine();
        String largestWord = findLargestWord(input);
        System.out.println("input: " + input);
        System.out.println("output: " + largestWord);
    }

    public static String findLargestWord(String input) {
        String[] words = input.split("\\s+");  
        String largestWord = "";
        
        for (String word : words) {
           
            String cleanWord = word.replaceAll("[^a-zA-Z]", "");

            if (cleanWord.length() > largestWord.length()) {
                largestWord = cleanWord;
            }
        }
        return largestWord;
    }
}
