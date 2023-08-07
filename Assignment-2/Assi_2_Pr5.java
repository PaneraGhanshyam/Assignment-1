import java.util.Scanner;
public class Pr5 
{
	public static void main(String[] args)
	{
	    	Scanner inp=new Scanner(System.in);	
	    	int check=0;
	    
	        System.out.print("Enter array size:");
	        int len=inp.nextInt();
	        int arr[]=new int[len];
	        
	        for(int i=0;i<len;i++)
	        {
	        	System.out.print("Enter "+(i+1)+" element: ");
	        	arr[i]=inp.nextInt();
	        }
	        
	        for (int i = 0; i < len; i++) 
		    {
		        int sum = arr[i];
		        if (sum == 0)
		             check=1;
		        for (int j = i + 1; j < len; j++) 
		        {
		            sum += arr[j];
		            if (sum == 0)
		                check=1;
		        }
		        
		    }
	
	    if (check==1)
	        System.out.println("sub array found.");
	    else
	        System.out.println("no sub array exist.");
	 
	}
}
	