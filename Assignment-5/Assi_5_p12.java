import java.util.Scanner;
import java.io.FileReader;
import java.io.IOException;

public class Assi_5_p12 {
    public static void main(String[] args)throws IOException {
        Scanner scanner = new Scanner(System.in);
        int w_count = 1, len = 0, res = 0;
        
       
                FileReader fr = new FileReader("temp.txt");

        int chr;
		String s="";
        while ((chr = fr.read()) != -1){
            s += (char)chr;
        }
		
        fr.close();

        for (char c : s.toCharArray()) {
            len++;
            if (c == ' ')
                w_count++;
        }

        String[] str = new String[w_count];

        int j = 0;
        for (int i = 0; i < len; i++) {
            if (s.charAt(i) != ' ') {
                if (str[j] == null) {
                    str[j] = "" + s.charAt(i);
                } else {
                    str[j] += s.charAt(i);
                }
            } else {
                j++;
            }
        }

        int k, count = 0;
        for (int i = 0; i < w_count; i++) {
            String temp = str[i];
            k = 0;
            for (char c : temp.toCharArray())
                k++;
            if (count < k) {
                count = k;
                res = i;
            }
        }

        System.out.println("Longest word is: "+str[res]);
    }
}

