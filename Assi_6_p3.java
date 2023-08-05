import java.util.Scanner;
public class Assi_6_p3
{
   public static void main(String[] args)
   {
      Scanner inp=new Scanner(System.in);
      
      System.out.print("Enter row: ");
      int row=inp.nextInt();
      
      int i, j, space, num;
      for(i=0; i<row; i++)
      {
         for(space=row; space>i; space--)
         {
            System.out.print(" ");
         }
         num=1;
         for(j=0; j<=i; j++)
         {
            System.out.print(num+ " ");
            num = num*(i-j)/(j+1);
         }
         System.out.print("\n");
      }
   }
}