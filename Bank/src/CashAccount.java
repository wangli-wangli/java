import java.util.Scanner;
import java.io.*;
import java.time.*;
import java.time.format.*;
public class CashAccount extends Account{
    private String type;//卡的类型
    private double money;//账户里的钱
    Scanner scanner=new Scanner(System.in);
    CashAccount(String name,String aid,String type,RandomAccessFile Client)throws IOException{//构造函数

    	super.name=name;
    	super.aid=aid;
    	this.type=type;
    	addClient(Client);
    }
    CashAccount(){//无参构造
    	
    }
    void setFile(RandomAccessFile Client)throws IOException {
    	addClient(Client);
    }
    void setName(String name) {//得到姓名
    	super.name=name;
    }
    void setAid(String aid) {//设置账户号码
    	super.aid=aid;
    }
    void setType(String type) {//设置卡的类型
    	this.type=type;
    }
    String setLength(String s) {//将String的长度规定为15
    	StringBuilder builder = new StringBuilder(s); 
    	builder.setLength(15); // 最长 15 字符
    	return builder.toString();
    }
    String getName() {//设置姓名
    	return  name;
    }
    String getAid() {//得到账户号码
    	return aid;
    }
    void deposit(RandomAccessFile Accountt,int xuaho)throws IOException {//存钱
    	 System.out.print("请输入你要存款的金额：");
    	 int inputmoney=scanner.nextInt();
    	 money=money+inputmoney;
    	 addAccoutt(Accountt,"存钱",xuaho,inputmoney);
     }
    void withdeaw(RandomAccessFile Accountt,int xuaho)throws IOException {//取钱
    	try {
         System.out.print("请输入你要取款的金额：");
         double outmoney=scanner.nextInt();
   	     getWithdraw(outmoney);
   	     addAccoutt(Accountt,"取钱",xuaho,outmoney);
    	}catch(WithdrawException e) {
    		System.out.println(e.getMessage());
    	}
   	    	 
   	    }
   	void getBalance() {//查询余额
    	System.out.println("你的账户余额为"+money);
    }
    void getWithdraw(double outmoney) throws WithdrawException{//取钱异常
    	 if(outmoney>money)
    	 {
    		 throw new WithdrawException(name,money,outmoney);
    	 }
    	 else money=money-outmoney;
    	    
     }
    void addClient( RandomAccessFile Client ) throws IOException{//将账户信息写入文件中
    	 DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
         LocalDateTime now=LocalDateTime.now();
    	 String time = df.format(now);

    	 Client.writeChars(setLength(aid));//写入账户号码
         Client.writeChars(setLength(name));//写入账户姓名
         Client.writeChars(setLength("现金用户"));//写入账户类型
         Client.writeChars(setLength(type));//写入卡的类型
         Client.writeChars(setLength(time));//写入建立账户时间
         Client.writeChars("\n \r");

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