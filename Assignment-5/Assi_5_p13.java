import java.util.Scanner;
class Person {
    private String firstName;
    private String lastName;

    public Person(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
}

class Employee extends Person {
    private int employeeId;
    private String jobTitle;

    public Employee(String firstName, String lastName, int employeeId, String jobTitle) {
        super(firstName, lastName);
        this.employeeId = employeeId;
        this.jobTitle = jobTitle;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public String getLastName() {
        return super.getLastName() +"\n"+jobTitle ;
    }
}

public class Assi_5_p13{
    public static void main(String[] args) {
        
        Scanner inp=new Scanner(System.in);
        String p_f_nm,p_l_nm;
        System.out.print("Enter person first name: ");
        p_f_nm=inp.nextLine();
        
        System.out.print("Enter person last name: ");
        p_l_nm=inp.nextLine();
        
        Person person = new Person(p_f_nm, p_l_nm);
        
        String e_f_nm,e_l_nm,job_title;
        int e_id;
        
        System.out.print("Enter employee first name: ");
        e_f_nm=inp.nextLine();
        
        System.out.print("Enter employee last name: ");
        e_l_nm=inp.nextLine();
        
        System.out.print("Enter job title: ");
        job_title=inp.nextLine();
        
        System.out.print("Enter employee id: ");
        e_id=inp.nextInt();
        
        Employee employee = new Employee(e_f_nm, e_l_nm, e_id,job_title);      
        
        System.out.println("Person: " + person.getFirstName()+" "+person.getLastName());
        
        System.out.println("Employee: " + employee.getFirstName() + " " + employee.getLastName() + " \nID: " + employee.getEmployeeId() );
    }
}
