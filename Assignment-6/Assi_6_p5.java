import java.util.Scanner;

public class Assi_6_p5 {
	public static void main(String[] args) {
		Scanner inp=new Scanner(System.in);
		int num=0,temp;
		
		System.out.print("Enter number: ");
		num=inp.nextInt();
		
		temp=num;;
		
		num=num*num;
		
		int sum_dig=0,rem;
		
		while(num!=0)
		{
			rem=num%10;
			sum_dig += rem;
			num /= 10;
		}
		
		if(sum_dig==temp)
		{
			System.out.print("Number is neon number.");
		}
		else
		{
			System.out.print("Number is not neon number.");
		}
	}
}