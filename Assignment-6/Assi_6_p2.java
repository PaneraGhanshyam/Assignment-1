import java.util.Scanner;

public class Assi_6_p2
{
	public static void main(String[] args) {
		Scanner inp = new Scanner(System.in);
		
		System.out.print("Enter hollow square side = ");
		int side = inp.nextInt();
		
		for (int i = 0; i < side; i++ ) 
		{
			for (int j = 0 ; j < side; j++ ) 
			{
				if (i == 0 || i == side - 1 || j == 0 || j == side - 1) 
				{
					System.out.print("*");
				}
				else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}
	}
}