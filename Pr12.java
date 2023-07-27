 public class Pr12{
    public static void main(String[] args) {
        String input = "shyam";
        String output = shiftAlphabet(input);
        System.out.println("Sample input: " + input);
        System.out.println("Sample output: " + output);
    }

    public static String shiftAlphabet(String input) {
        char[] chars = input.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            if (Character.isLetter(chars[i])) {
                char base = Character.isLowerCase(chars[i]) ? 'a' : 'A';
                chars[i] = (char) ((chars[i] - base + 1) % 26 + base);
            }
        }
        return new String(chars);
    }
}
