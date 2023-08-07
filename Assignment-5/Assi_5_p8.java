import java.util.Scanner;
public class  Assi_5_p8{
	public static void main(String[] args) {
		
		Scanner inp=new Scanner(System.in);	
		System.out.print("Enter file name with extention: ");
		String nm=inp.nextLine();
		
		int len=nm.length();
	    int index=0;
	    
	    for(int i=0;i<len;i++)
	    {
	    	if(nm.charAt(i)=='.')
	    	{
	    		index=i;
	    		break;
	    	}
	    }
	    
	    String exte="";
	    for(int i=index;i<len;i++)
	    	exte +=nm.charAt(i);
	    	
	    String f_nm="";
	    for(int i=0;i<index;i++)
	    	f_nm +=nm.charAt(i);
	    
	    System.out.print("\nFile name is: "+f_nm);
	    System.out.print("\nExtention is: "+exte);
	}
}