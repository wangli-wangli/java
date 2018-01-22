import java.util.Random;
import java.util.Scanner;

public class opation {
     
	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		System.out.println("请输入你要打印题目的数量");
		int count=scanner.nextInt();
		int character=0;
		int num1=0;
		int num2=0;
		int correct=0;
		int error=0;
		
		String operat=null;
		double result[]=new double[count];
		Random random = new Random();
		for(int i=0;i<count;i++) {
			
			character=random.nextInt(4)%4+1; 
		        num1 = random.nextInt(60)%60+1;
		    if(character==2||character==4) {
				if(num1==0)
					num1=num1+2;
				num2=(int)random.nextInt(num1)%(num1)+1; 
				if(num2==0) {
					num2++;
				}
			}
			else {
				num2= random.nextInt(60)%60+1;
			}
			String number1=String.valueOf(num1);
			String number2=String.valueOf(num2);
			if(character==1) {
				operat="第("+(i+1)+")题"+number1+"+"+number2+"=";
				result[i]=num1+num2;
			}
			else  if(character==2) {
				operat="第("+(i+1)+")题"+number1+"-"+number2+"=";
				result[i]=num1-num2;
			}
			else  if(character==3) {
				operat="第("+(i+1)+")题"+number1+"*"+number2+"=";
				result[i]=num1*num2;
			}
			else {
				operat="第("+(i+1)+")题"+number1+"/"+number2+"=";
				result[i]=(double)num1/(double)num2;
			}
			if((result[i]>100)||(IsXiaoshu(result[i])>3)) {
				i--;
			}
			else {
			    System.out.println(operat);
				double result2=scanner.nextDouble();
				if(result2==result[i]) {
					correct++;
				}
				else 
					error++;
			}
		}
		System.out.println("恭喜你，答对了"+correct+"道题，打错了"+error+"道题");

	}
	static int IsXiaoshu(double result) {
		int result2=(int)result;
		double xiaoshu=result-result2;
		String result3=String.valueOf(xiaoshu);
		
		return result3.length();
	}

}
