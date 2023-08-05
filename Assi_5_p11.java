import java.util.Scanner;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Assi_5_p11 {
    public static void main(String[] args) throws IOException {

        Scanner inp = new Scanner(System.in);
        System.out.print("Enter text: ");
        String msg = inp.nextLine();
 		//  String msg="panera\nghanshyam\n216270307072\ngpp";

        FileWriter fw = new FileWriter("temp.txt");
        fw.write(msg);
        fw.close();

        FileReader fr = new FileReader("temp.txt");

        int chr;
        int line = 0;
        while ((chr = fr.read()) != -1 && line < 3) {
            System.out.print((char) chr);
             
            if((char)chr=='\n')  
        	    line++;
        }

        fr.close();
    }
}
