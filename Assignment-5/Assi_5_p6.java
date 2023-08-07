import java.util.Scanner;

public class Assi_5_p6 {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        System.out.print("Enter array size: ");
        int len = inp.nextInt();
        int arr[] = new int[len];
        int temp[]=new int[len];

        for (int i = 0; i < len; i++) {
            System.out.print("Enter element " + (i + 1) + ": ");
            arr[i] = inp.nextInt();
        }

        int count_0 = 0;
        for (int num : arr) {
            if (num == 0)
                count_0++;
        }
		int j=0;
        for(int i=0;i<len;i++)
        {
        	if(arr[i]!=0)
        	{
        		temp[j]=arr[i];
        		j++;
        	}
        }

        for (int i = j; i < len; i++)
        {
            temp[i] = 0;
        }

        System.out.println("Modified array: ");
        for (int num : temp) {
            System.out.print(num + " ");
        }
    }
}
