import java.util.Scanner;
import java.io.File;
import java.util.Date;
public class Assi_5_p9 
{
   public static void main(String args[]) 
   {
      Scanner inp=new Scanner(System.in);
      
      System.out.print("Enter file name: ");
      String path= inp.nextLine();
    
      File file = new File(path);
    
      long mod_date = file.lastModified();
      Date date = new Date(mod_date);
      System.out.println("Last modifide date was: "+date);
   }
}