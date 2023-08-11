import java.util.Scanner;

class Pr2
{
    public static int first_rep_ele(int arr[],int arrlen)
    {
      int element=0;
      
      for(int i=0;i<arrlen;i++)
      {
        for(int j=i+1;j<arrlen;j++)
        {
            if(arr[i]==arr[j])
            {
                element=arr[i];
                return element;
            }
        }
      }
          return element;
    }
    
    public static void main(String args[])
    {
        Scanner inp=new Scanner(System.in);    
        System.out.print("enter length of array:");
        int arrlen=inp.nextInt();
        int ele;
        int arr[]=new int[arrlen];
        
        for(int i=0;i<arrlen;i++)
        {
           System.out.print("enter "+(i+1)+" element:");
           arr[i]=inp.nextInt();
        }
        ele=first_rep_ele(arr,arrlen);
        System.out.print(ele+" is the first element that repeats.");
    }
}
