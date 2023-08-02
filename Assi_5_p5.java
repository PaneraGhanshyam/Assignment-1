import java.util.Scanner;

public class Assi_5_p5
{
    public static void main(String[] args) 
    {
        Scanner inp = new Scanner(System.in);
        System.out.print("Enter array size: ");
        int len = inp.nextInt();
        int arr[] = new int[len];

        for (int i = 0; i < len; i++) 
        {
            System.out.print("Enter element " + (i + 1) + ": ");
            arr[i] = inp.nextInt();
        }

        System.out.print("Enter element to remove: ");
        int ele = inp.nextInt();

        int size = 0;
        int found=0;
        for (int i = 0; i < len; i++)
        {
            if (arr[i] != ele)
            {
                arr[size++] = arr[i];
            }
            else
            	found=1;
        }

		if(found==1)
		{
	        System.out.println("Modified array: ");
	        for (int i = 0; i < size; i++) 
	        {
	            System.out.print(arr[i] + " ");
	        }
		}
		else
			System.out.print("no element found.");
    }
}
