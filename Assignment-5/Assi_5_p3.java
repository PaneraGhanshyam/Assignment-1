public class Assi_5_p3
{
	public static void main(String[] args) 
	{
		int n=1;
		print(n);
	}
	public static void print(int num)
	{
		if(num<=100)
		{
			System.out.println(num);
			num++;
			print(num);
		}
	}
}