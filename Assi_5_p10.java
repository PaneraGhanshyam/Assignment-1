import java.util.Scanner;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Assi_5_p10{
    public static void main(String[] args) throws IOException {

        Scanner inp = new Scanner(System.in);
        System.out.print("Enter text: ");
        String msg = inp.nextLine();

        FileWriter fw = new FileWriter("temp.txt");
        fw.write(msg);
        fw.close();

        FileReader fr = new FileReader("temp.txt");

        int chr;
        while ((chr = fr.read()) != -1)
            System.out.print((char) chr);

        fr.close();
    }
}
