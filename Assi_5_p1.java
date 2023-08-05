import java.util.Scanner;

public class Assi_5_p1 {
    public static void main(String[] args) {
        char ch = 'g';
        
        if (ch >= 'a' && ch <= 'z')
        {
            ch = (char) (ch - 32);
        }
        
        for (char r = 'A'; r <= ch; r++) 
        {
            for (int sp = (ch - r); sp >= 1; sp--)
            {
                System.out.print(" ");
            }
            for (char c = 'A'; c <= r; c++) 
            {
                System.out.print(c);
            }
            for (char c = (char) (r - 1); c >= 'A'; c--)		  {
                System.out.print(c);
            }
            System.out.println();
        }


        for (char r = (char) (ch - 1); r >= 'A'; r--) 		{ 
            for (int sp = (ch - r); sp >= 1; sp--) 
            {
                System.out.print(" ");
            }
            for (char c = 'A'; c <= r; c++) 
            {
                System.out.print(c);
            }
            for (char c = (char) (r - 1); c >= 'A'; c--) 	 	{
                System.out.print(c);
            }
            System.out.println();
        }
    }
}
