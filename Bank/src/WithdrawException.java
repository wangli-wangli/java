
public class WithdrawException extends Exception{
	private String name;
	private double money;
	private double outmoney;
	WithdrawException(String name,double money,double outmoney){
		this.name=name;
		this.outmoney=outmoney;
		this.money=money;
		
	}
      public String getMessage() {
    	  return "取款人姓名:"+this.name+"\r账户余额："+this.money+"\r取款额:"+this.outmoney+"\r异常原因：透支";
     }
      
    	 
     
      
}
