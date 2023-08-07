import java.util.Scanner;

public class Pr4
{
    public static void main(String[] args) 
    {
        
        Scanner inp=new Scanner(System.in);
        System.out.print("Enter array size:");
        int len=inp.nextInt();
        int arr[]=new int[len];
        
        for(int i=0;i<len;i++)
        {
        	System.out.print("Enter "+(i+1)+" element: ");
        	arr[i]=inp.nextInt();
        }
        
        int[] pos = new int[len];
        int[] neg = new int[len];
        int posId = 0;
        int negId = 0;

        for (int num : arr) 
        {
            if (num >= 0) 
            {
                pos[posId] = num;
                posId++;
            } 
            else
            {
                neg[negId] = num;
                negId++;
            }
        }

        int i = 0;
        int j = 0;

        for (int k = 0; k < len; k++)
        {
            if (k % 2 == 0 && j < negId) 
            {
                arr[k] = neg[j];
                j++;
            } 
            else if (i < posId) 
            {
                arr[k] = pos[i];
                i++;
            }
        }
        
        System.out.print("Array is :");
        
        for(int ele : arr)
        	System.out.print(ele+" ");
        
    }
}
