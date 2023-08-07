import java.util.Scanner;
import java.util.Arrays;
public class Main {
	
	 public static int calculate(int arr[])
	 {
	   Arrays.sort(arr);
	   int ele=1;
	   
	   for (int num : arr) 
	   {
            if (num <= ele)           
            {
                ele += num;
            }
            else 
            {
                break;
            }
        }
	  return ele;
	 }
	
	
	public static void main(String[] args) {
		int arrlen,ele;
		Scanner inp=new Scanner(System.in);        System.out.print("enter length of array:");
		arrlen=inp.nextInt();
		 int arr[]=new int[arrlen];
        for(int i=0;i<arrlen;i++)
        {
           System.out.print("enter "+(i+1)+" element:");
           arr[i]=inp.nextInt();
        }
       ele=calculate(arr);
       
       System.out.print("smallest positive value is:"+ele);
       
       
	}
}