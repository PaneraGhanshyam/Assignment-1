public class Pr13 {
    public static void main(String[] args) {
        String input = "C++ is a general-purpose programming language.";
        String largestWord = findLargestWord(input);
        System.out.println("Sample input: " + input);
        System.out.println("Sample output: " + largestWord);
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
