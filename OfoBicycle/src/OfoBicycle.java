//���� 20163623
//��1605-1
import java.math.BigInteger;
import java.util.Scanner; 
public class OfoBicycle {
	private String ofono;
	private int model;
	private String status;
	private int price;
	private int password;
	public OfoBicycle()
	{
		password=4444;
	}
	public OfoBicycle(String ofono,int model,String status,int price,int password){
		this.ofono=ofono;
		this.model=model;
		this.status=status;
		this.price=price;
		this.password=password;
	}
	public int ScanCode() {
		password=(int)Math.random()*4+1;
		System.out.println("密码是"+password);
		return password;
	}
	public String unlock() {
		int input_password;
		System.out.println("请输入密码");
		Scanner scanner=new Scanner(System.in);
		input_password=scanner.nextInt();
		if(input_password==password) {
			System.out.println("解锁");
			return status="解锁";
		}
		else
		{
			System.out.println("密码不对");
			return status;
			
		}
		
	}
	public double computingTime() {
		double time;
		long endMili=0;
		long startMili=System.currentTimeMillis();
		if(unlock()=="密码不正确")
		    System.out.println("解锁");
		System.out.println("");
		Scanner scanner=new Scanner(System.in);
		int input=scanner.nextInt();
		if(input==1) {
			endMili=System.currentTimeMillis();
			System.out.println("开始骑行");
		}
		time=(endMili-startMili)/3600000;
		System.out.println("你已骑行"+time+"小时");
		return time;	
		
	}
	
    public int calculatedPrice() {
    	int time=(int)computingTime();
    	price=time*1;
    	System.out.println("你要支付"+price);
    	return price;
    	
    }
    public static void main(String[] args) {
    	OfoBicycle o=new OfoBicycle();
    	o.ScanCode();
    	
       	o.calculatedPrice();
    }
}
