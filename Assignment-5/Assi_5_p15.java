import java.util.Scanner;
public class Assi_5_p15 {
	public static void main(String[] args) {
		Scanner inp=new Scanner(System.in);
		Circle c=new Circle();	
		
		System.out.print("Enter radius: ");
		float r=inp.nextFloat();
		c.setter(r);
		System.out.print("Radius: "+c.getter());
		
		c.calculateArea();
		c.calculatePerimeter();
	}
}
class Circle
{
	private float radius;
	
	public float getter()
	{
		return radius;
	}
	public void setter(float r)
	{
		radius = r;
	}
	void calculateArea()
	{
		System.out.print("\nArea: "+3.14*radius*radius);
	}
	void calculatePerimeter()
	{
		System.out.printf("\nPerimeter: "+2*3.14*radius);
	}
	
}