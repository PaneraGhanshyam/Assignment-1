import java.util.Scanner;
public class Assi_5_p7
{
	public static void main(String[] args) 
	{
		Scanner inp=new Scanner(System.in);
		System.out.print("Enter number:");
		int num=inp.nextInt();
		
		long factorial=fact(num);
		System.out.print("Factorial is : "+factorial);
	}
	public static long fact(int num)
    {
        if (num >= 1)
            return num * fact(num - 1);
        else
            return 1;
    }
}