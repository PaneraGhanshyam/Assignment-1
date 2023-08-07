import java.util.Scanner;
import java.util.ArrayList;
public class Pr1{
    public static void findCommonElements(int[] arr1, int[] arr2, int[] arr3) {
        ArrayList<Integer> commonElements = new ArrayList<>();
        int i = 0, j = 0, k = 0;

        while (i < arr1.length && j < arr2.length && k < arr3.length) {
            if (arr1[i] == arr2[j] && arr2[j] == arr3[k]) {
                commonElements.add(arr1[i]);
                i++;
                j++;
                k++;
            } else if (arr1[i] < arr2[j]) {
                i++;
            } else if (arr2[j] < arr3[k]) {
                j++;
            } else {
                k++;
            }
        }
        System.out.print("Common elements in three array are:"+commonElements);
    }

    public static void main(String[] args) {
        Scanner inp=new Scanner(System.in);        int arr1len,arr2len,arr3len;
        
        System.out.print("enter length of first array:");
        arr1len=inp.nextInt();
        int[] arr1=new int[arr1len];
        for(int i=0;i<arr1len;i++)
        {
           System.out.print("enter "+(i+1)+" element:");
           arr1[i]=inp.nextInt();
        }

        System.out.print("enter length of second array:");
        arr2len=inp.nextInt();
        int[] arr2=new int[arr2len];
        for(int i=0;i<arr2len;i++)
        {
           System.out.print("enter "+(i+1)+" element:");
           arr2[i]=inp.nextInt();
        }
        
        System.out.print("enter length of third array:");
        arr3len=inp.nextInt();
        int[] arr3=new int[arr3len];
        for(int i=0;i<arr3len;i++)
        {
           System.out.print("enter "+(i+1)+" element:");
           arr3[i]=inp.nextInt();
        }
        
        findCommonElements(arr1, arr2, arr3);
    }
}
