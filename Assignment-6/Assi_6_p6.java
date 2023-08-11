import java.util.Scanner;

public class Assi_6_p6{
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter the number: ");
        int n= input.nextInt();

        int sum = 0;
        for (int i = 0; i < n; i++) {
            int fn = fibo(i);
            if (i % 2 == 0) {
                sum += fn;
            }
            System.out.print(fn + "  ");
        }
    }

    public static int fibo(int n) {
        if (n <= 1) {
            return n;
        }
        return fibo(n - 1) + fibo(n - 2);
    }
}

