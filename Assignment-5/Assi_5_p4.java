import java.util.Scanner;
public class Assi_5_p4
{
	public static void main(String[] args) 
	{
		Scanner inp=new Scanner(System.in);	
		System.out.print("Enter first num: ");
		int a=inp.nextInt();
		
		System.out.print("Enter second num: ");
		int b=inp.nextInt();
		
		a=a+b;
		b=a-b;
		a=a-b;
		
		System.out.print("after swap value of a: "+a+" value of b: "+b);
	}
}