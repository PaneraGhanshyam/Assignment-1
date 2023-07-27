import java.util.Scanner;
public class Pr4{

 public static void main(String[] args) {

   Scanner inp=new Scanner(System.in);
   System.out.println("enter number:");
  int num =inp.nextInt(), count;

  for (int i = 1; i <= num; i++) {
   count = 0;
   for (int j = 2; j <= i / 2; j++) {
    if (i % j == 0) {
     count++;
     break;
    }
   }

   if (count == 0) {
    System.out.println(i);
   }

  }
 }
}