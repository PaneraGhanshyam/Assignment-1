import java.util.Scanner;
public class Assi_5_p14{
	public static void main(String[] args) {
		
		Scanner inp=new Scanner(System.in);
		CurrentAccount cur=new CurrentAccount();
		SavingAccount sav=new SavingAccount();
		
		int bal;
		
		System.out.print("Current account deposite money: ");
		bal =inp.nextInt();
		cur.deposite(bal);
		
		System.out.print("Current account withdraw money: ");
		bal =inp.nextInt();
		cur.withdraw(bal);
		
		System.out.print("Saving account deposite money: ");
		bal =inp.nextInt();
		sav.deposite(bal);
		
		System.out.print("Saving account withdraw money: ");
		bal =inp.nextInt();
		cur.withdraw(bal);
		
		System.out.print("balance: "+BankAccount.sow_bal());
	}
}
abstract class BankAccount
{
	protected static int bal=0;
	
	abstract void deposite(int bal);
	abstract void withdraw(int bal);
	
    static int sow_bal()
	{
		return bal;
	}
}
class CurrentAccount extends BankAccount
{
	
	void deposite(int bal)
	{
		this.bal += bal;
	}
	void withdraw(int bal)
	{
		if(bal>this.bal)
		{
			System.out.print("\nNot Sufficient balance!!!!");
		}
		else
		{
			this.bal -= bal;
		}
	}
}
class SavingAccount extends BankAccount
{
	void deposite(int bal)
	{
		this.bal += bal;
	}
	void withdraw(int bal)
	{
		if(bal>this.bal)
		{
			System.out.print("\nNot Sufficient balance!!!!");
		}
		else
		{
			this.bal -= bal;
		}
	}	
}