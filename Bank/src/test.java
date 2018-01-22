/***test.java***/
import java.util.Scanner;
import java.io.*;
public class test {
	 static String setLength(String s) {//将String的长度规定为15
	    	StringBuilder builder = new StringBuilder(s); 
	    	builder.setLength(15); // 最长 15 字符
	    	return builder.toString();
	    }  
	static void RequireClient(RandomAccessFile Client)throws IOException {
		 int c;
		 char[] a=new char[15];
		 Scanner scanner=new Scanner(System.in);
		 System.out.println("用（1.账户号码  2.姓名）查询");
		 c=scanner.nextInt();
		 if(c==1) {
			 System.out.print("请输入账户号码");  String aid2=setLength(scanner.next());
			 Client.seek(0);
		
			 while(Client.getFilePointer()<Client.length()) {
				  for(int i=0;i<a.length;i++)
				  {
					  a[i]=Client.readChar();
				  }
				 String aid1=String.valueOf(a);
				 if(aid1.equals(aid2))
				 {
					 System.out.println("账户号码："+aid1);
					 System.out.println("姓名："+read(Client));
					 System.out.println("账户类型："+read(Client));
					 System.out.println("卡类型："+read(Client));
					 System.out.println("时间："+read(Client));
					 break;
				 }
				else
				{
					for(int i=0;i<a.length*4;i++)
						  Client.readChar();
				}
				
			 }
		 }
		 else {
			 System.out.println("请输入姓名");
			 String name2=setLength(scanner.next());
			 Client.seek(0);
			 while(Client.getFilePointer()<Client.length()) {
				 String aid=read(Client);
				 String name1=read(Client);
				 if(name1.equals(name2))
				 { 
					 System.out.println("账户号码："+aid);
					 System.out.println("姓名："+name1);
					 System.out.println("账户类型："+read(Client));
					 System.out.println("卡类型："+read(Client));
					 System.out.println("时间："+read(Client));
					
					 break;
				 }
				 else {
					 for(int i=0;i<15;i++)
						  Client.readChar();
				 }
					 
				
			 }
			 
			 
		 }
		 
	}
	static void RequireAccount(RandomAccessFile Accountt )throws IOException {
		 int c;
		 char[] a=new char[15];
		 Scanner scanner=new Scanner(System.in);
		 System.out.println("用（1.账户号码  2.姓名）查询");
		 c=scanner.nextInt();
		 if(c==1) {
			 System.out.print("请输入账户号码");  String aid2=setLength(scanner.next());
			 while(Accountt.getFilePointer()<Accountt.length()) {
				 
				 String xuhao=read(Accountt);
				 String aid1=read(Accountt);
				 if(aid1.equals(aid2))
				 {   Accountt.seek(0);
					 System.out.println("序号："+xuhao);
					 System.out.println("账户号码："+aid1);
					 System.out.println("姓名："+read(Accountt));
					 System.out.println("时间："+read(Accountt));
					 System.out.println("流水类型："+read(Accountt));
					 System.out.println("金额："+read(Accountt));
					 
				 }
				else
				{
					for(int i=0;i<a.length*4;i++)
						  Accountt.readChar();
				}
				
			 }
		 }
		 else {
			 System.out.println("请输入姓名");
			 String name2=setLength(scanner.next());
			 while(Accountt.getFilePointer()<Accountt.length()) {
				 String xuhao=read(Accountt);
				 String aid=read(Accountt);
				 String name1=read(Accountt);
				 if(name1.equals(name2))
				 {
					 System.out.println("序号："+xuhao);
					 System.out.println("账户号码："+aid);
					 System.out.println("姓名："+name1);
					 System.out.println("时间："+read(Accountt));
					 System.out.println("流水类型："+read(Accountt));
					 System.out.println("金额："+read(Accountt));
				 }
				 else {
					 for(int i=0;i<a.length*3;i++)
						 Accountt.readChar();
				 }
					 
				
			 }
			 
			 
		 }
		 
	}
	private static String read(RandomAccessFile Client)throws IOException { 
       char[] a = new char[15]; 
       for(int i = 0; i < a.length; i++) 
    	   a[i] = Client.readChar(); 
       return new String(a);
	}
	public static void main(String[] args) throws IOException{
        int d,xuhao=0;
        File file1=new File("ClientInfoTable.txt");
        File file2=new File("bankInfoTable.txt");
        RandomAccessFile Client = new RandomAccessFile(file1, "rw"); 
        RandomAccessFile Accountt = new RandomAccessFile(file2, "rw");
        CashAccount account1=new CashAccount();
		Scanner scanner=new Scanner(System.in);
		do {
		    System.out.println("1.新建现金账户");
        	System.out.println("2.新建信用卡账户");
        	System.out.println("3.现金账户转信用卡账户");
        	System.out.println("4.查询客户信息");
        	System.out.println("5.查询流水信息");
        	System.out.println("6.退出");
        	System.out.print("请输入序号："); d=scanner.nextInt();
        	if(d==6)
        	    break;
        	else if(d==1)
        	{
        		String type;
        		System.out.print("姓名："); account1.setName(scanner.next());
        	    System.out.print("账户号码：");   account1.setAid(scanner.next());
        		System.out.print("卡的类型：（1.工资卡 2.借记卡  3.理财卡）"); int  Linet=scanner.nextInt();
        		if(Linet==1)  account1.setType("工资卡");
        		else if(Linet==2) account1.setType("借记卡");
        		else account1.setType("理财卡");
        		account1.setFile(Client);
        	    int c1=0;
        	    do {
        	    System.out.println("1.存款");
        		System.out.println("2.取款");
        		System.out.println("3.查询余额");
        		System.out.println("4.退出");
        		System.out.print("请输入序号：");
                c1=scanner.nextInt();
                if(c1==1)      account1.deposit(Accountt,xuhao);
                else if(c1==2)   account1.withdeaw(Accountt,xuhao);
                else if(c1==3)   account1.getBalance();
                else  if(c1==4)   break;
        	    }while(c1!=4);
        	}
        	else if(d==2||d==3)  
        	{  
        		String name,id;
        		if(d==2) {
        		
        		System.out.print("姓名：");   name=scanner.next();
        	    System.out.print("账户号码：");    id=scanner.next();
        		}
        		else  {
        			    name=account1.getName();
        			    id=account1.getAid();
        		}
        		char LineOfCredit;
        		System.out.print("信用卡的类型：（1.A级 2.B级 3.C级  4.D级）"); 
        		int  Linet=scanner.nextInt();
        		if(Linet==1)  LineOfCredit='A';
        		else if(Linet==2)  LineOfCredit='B';
        		else if(Linet==3) LineOfCredit='C';
        		else   LineOfCredit='D';
        	    CreditAccount account2=new CreditAccount(name,id, LineOfCredit,Client);
        	    int c2=0;
        	    do {
        	    System.out.println("1.存款");
        		System.out.println("2.取款");
        		System.out.println("3.查询余额");
        		System.out.println("4.查询透支情况");
        		System.out.println("5.退出");
        		System.out.print("请输入序号：");
               c2=scanner.nextInt();
                if(c2==1)      account2.deposit(Accountt,xuhao);
                else if(c2==2)   account2.withdeaw(Accountt,xuhao);
                else if(c2==3)   account2.getBalance();
                else if(c2==4)    account2.findOverdraw();
                else  if(c2==5)   break;
        		}while(c2!=5);
            }
        	else if(d==4)
        	{
        	   RequireClient(Client);
        	}
        	else  if(d==5)
        	{
        		RequireAccount(Accountt);
        	}

        	
        }while(d!=6);
	}
}
