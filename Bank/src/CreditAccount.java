/***CreditAccount.java****/
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;
public class CreditAccount extends Account{
	private char LineOfCredit; //信用卡的类型
	private double money;//账户里的钱
	Scanner scanner=new Scanner(System.in);
	 CreditAccount(String name,String aid,char LineOfCredit,RandomAccessFile Client)throws IOException{//构造方法
	    	super.name=name;
	    	super.aid=aid;
	    	this.LineOfCredit=LineOfCredit;
	    	money=0;
	    	addClient(Client);
	    	
	    }
	 String setLength(String s) {//将String的长度规定为15
	    	StringBuilder builder = new StringBuilder(s); 
	    	builder.setLength(15); // 最长 15 字符
	    	return builder.toString();
	    }
     void deposit(RandomAccessFile Accountt,int xuaho)throws IOException {//存钱
    	 System.out.print("请输入你要存款的金额：");
    	 int inputmoney=scanner.nextInt();
    	 money=money+inputmoney;
    	 addAccoutt(Accountt,"存钱",xuaho,inputmoney);
     }
     void withdeaw(RandomAccessFile Accountt,int xuaho) throws IOException{//取钱
    	System.out.print("请输入你要取款的金额：");
    	double outmoney=scanner.nextInt();
   	    double cha=outmoney-money;
   	    if((cha<=10000)&&(LineOfCredit=='A'))
   	    	money=money-outmoney;
   	    else if(cha<=5000&&LineOfCredit=='B')
   	    	money=money-outmoney;
   	    else if(cha<=2000&&LineOfCredit=='C')
   	    	money=money-outmoney;
   	    else  if(cha<=1000&&LineOfCredit=='D')
   	        money=money-outmoney;
   	    else
   	    	System.out.println("您的账户余额不足，不能取出");
   	    addAccoutt(Accountt,"取钱",xuaho,outmoney);
    }
    void getBalance() {//查询余额
    	System.out.println("你的账户余额为"+money);
    }
    void findOverdraw() {//查询透支
    	if(money>=0)
    		System.out.println("你的账户暂无透支");
    	else
    	     System.out.println("你的账户已透支"+(-money)+"元");	
    	
    }
    void addClient(RandomAccessFile Client) throws IOException{//将账户信息写入文件中
   	 DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now=LocalDateTime.now();
   	 String time = df.format(now);
     String LineOfCreditt=String.valueOf(LineOfCredit);
   	    Client.writeChars(setLength(aid));//写入账户号码
        Client.writeChars(setLength(name));//写入账户姓名
        Client.writeChars(setLength("信用卡用户"));//写入账户类型
        Client.writeChars(setLength(LineOfCreditt));//写入卡的类型
        Client.writeChars(setLength(time));//写入建立账户时间
        
   }
    void addAccoutt(RandomAccessFile Accountt,String type,int xuaho,double money)throws IOException{//将账户流水信息写入到文件中
       	 DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now=LocalDateTime.now();
       	 String time = df.format(now);
    	 xuaho++;
    	 String xuhaoo=String.valueOf(xuaho);
    	 String moneyy=String.valueOf(money);
    	 Accountt.writeChars(setLength(xuhaoo));//写入序号
    	 Accountt.writeChars(setLength(aid));//写入账户号码
    	 Accountt.writeChars(setLength(name));//写入姓名
    	 Accountt.writeChars(setLength(time));//写入时间
    	 Accountt.writeChars(setLength(type));//写入流水类型
    	 Accountt.writeChars(setLength(moneyy));//写入流转金额
    }

    
}